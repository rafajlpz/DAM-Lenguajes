<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <!-- Salida en formato xml -->
    <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    <!-- Empieza a procesar a partir del elemento raiz -->
    <xsl:template match="/">             
            <!-- Elemento productos -->
            <productos>
                <!-- Reccoremos todos los productos -->
                <xsl:for-each select="productos/producto">
                    <!-- Elemento producto con sus atributos -->
                    <producto id="{@id}" precio="{@precio}">
                        <!-- Valor del elemento -->
                        <xsl:value-of select="nombre/text()" />
                    </producto>
                </xsl:for-each>
                
                <!-- Elemento ofertas -->
                <ofertas>
                    <!-- Reccoremos todos los productos -->
                    <xsl:for-each select="productos/producto[@descuento]">
                        <!-- Elemento producto con sus atributos -->
                        <producto id="{@id}" precio="{@precio}">
                            <!-- Valor del elemento -->
                            <xsl:value-of select="nombre/text()" />
                        </producto>
                    </xsl:for-each>
                </ofertas>
                <!-- Elemento ventas -->
                <ventas>
                    <!-- Recorremos todas las ventas -->
                    <xsl:for-each select="ventas/venta">
                        <!-- Elemento venta con sus atributos -->
                        <venta fecha="{@fecha}" id="{@id}" cantidad="{count(producto)}">
                            <xsl:for-each select="producto">
                                <!-- Buscar el producto correspondiente a su ID -->
                                <xsl:variable name="producto" select="productos/producto[@id = current()/@id]" />
                                <!-- Crear elemento producto -->
                                <producto precio="{$producto/@precio}" categoria="{$producto/categoria}">
                                    <!-- Añadir nombre del producto como texto del elemento -->
                                    <xsl:value-of select="$producto/nombre" />
                                </producto>
                            </xsl:for-each>
                        </venta>
                    </xsl:for-each>
                </ventas>
            </productos>
        
    </xsl:template>
</xsl:stylesheet>
