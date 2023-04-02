<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- Salida en formato xml -->
    <xsl:output method="xml" indent="yes" />
    <!-- Empieza a procesar a partir del elemento raiz que seria tienda -->
    <xsl:template match="/">
        <!-- Productos -->
        <productos>
            <xsl:for-each select="tienda/productos/producto">
                <producto id="{@id}" precio="{@precio}">
                    <xsl:value-of select="nombre/text()" />
                </producto>
            </xsl:for-each>
        </productos>
        <!-- Ofertas -->
        <ofertas>
            <xsl:for-each select="tienda/productos/producto[@descuento]"> </xsl:for-each>
        </ofertas>
        <!-- Ventas -->
        <ventas>
            <xsl:for-each select="tienda/productos/ventas/venta">
                <venta fecha="{@fecha}" id="{@id}" cantidad="{count(productos/producto)}"></venta>
            </xsl:for-each>
        </ventas>
        
        
    </xsl:template>
</xsl:stylesheet>