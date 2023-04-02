<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="utf-8" indent="yes" />
    <xsl:template match="/">
        <!-- TODOS LOS PRODUCTOS -->
        <productos>
            <!-- Recorremos todos los elementos producto -->
            <xsl:for-each select="productos/producto">
                <!-- Estructura del elemento producto -->
                <xsl:call-template name="producto" />
            </xsl:for-each>

            <!-- TODAS LAS OFERTAS -->
            <ofertas>
                <xsl:for-each select="productos/producto[@descuento]">
                    <xsl:call-template name="producto"></xsl:call-template>
                </xsl:for-each>
            </ofertas>

            <!-- TODAS LAS VENTAS -->
            <ventas>
                <xsl:for-each select="productos/ventas/venta">
                    <venta cantidad="{count(productos/producto)}" fecha="{fecha}" id="{@id}">
                        <!-- Selecciona los productos vendidos en cada venta -->
                        <xsl:for-each select="productos/producto">
                            <!-- buscar el producto correspondiente a su ID -->
                            <xsl:variable name="producto"
                                select="/productos/producto[@id = current()/@id]" />
                            <!-- Crear elemento producto -->
                            <producto
                                precio="{$producto/precio}" categoria="{$producto/categoria}">
                                <!-- Añadir nombre del producto como texto del elemento -->
                                <xsl:value-of select="$producto/nombre" />
                            </producto>
                        </xsl:for-each>
                    </venta>
                </xsl:for-each>
            </ventas>

        </productos>

    </xsl:template>
    <!-- TEMPLATE DEL PRODUCTO -->
    <xsl:template name="producto">
        <producto id="{@id}" precio="{precio}">
            <!-- Atributos -->
            <!-- nombre -->
            <xsl:value-of select="nombre" />
        </producto>
    </xsl:template>

</xsl:stylesheet>