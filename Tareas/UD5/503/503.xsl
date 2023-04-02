<?xml version="1.0" encoding="UTF-8"?>
<!-- Estructura del elemento raiz de la hoja XSL -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- Salida en formato html, codificacion UTF-8 -->
    <xsl:output method="html" encoding="UTF-8" />
    <!-- Empieza a procesar a partir del elemento raiz -->
    <xsl:template match="/">
        <!-- Formato documento html -->
        <html>
            <head>
                <title>Astistas XSLT</title>
            </head>
            <body>
                <table border="1">
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Año de nacimiento</th>
                        <th>Año de fallecimiento</th>
                        <th>País</th>
                        <th>Wikipedia</th>
                    </tr>
                    <!-- Bucle para recorrer los artistas, seleccionando el path con condicion -->
                    <xsl:for-each select="artistas/artista[nacimiento &gt; 1500]">
                        <!-- Ordenando los artistas de forma ascendente -->
                        <xsl:sort
                            select="nacimiento" order="ascending" />
                        <tr>
                            <td>
                                <!-- Valor mostrado del atributo id -->
                                <xsl:value-of select="@id" />
                            </td>
                            <td>
                                <!-- Valor mostrado del elemento nombre -->
                                <xsl:value-of select="nombre" />
                            </td>                            
                            <td>
                                <!-- Valor mostrado del elemento nacimiento -->
                                <xsl:value-of select="nacimiento" />
                            </td>
                            <td>
                                <!-- Uso de choose, similar a un if else, usamos when cuando aparece fallecimiento y si no otherwise y aparece en texto Desconocido. -->
                                <xsl:choose>
                                    <xsl:when test="fallecimiento">
                                        <xsl:value-of select="fallecimiento" />
                                    </xsl:when>
                                    <xsl:otherwise>Desconocido</xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td>
                                <!-- Valor mostrado del elemento pais -->
                                <xsl:value-of select="pais" />
                            </td>
                            <td>
                                <!-- Enlace seleccionando el atributo wikipedia, en otra pestaña -->
                                <a href="{@wikipedia}" target="_blank">
                                    Saber más
                                </a>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>