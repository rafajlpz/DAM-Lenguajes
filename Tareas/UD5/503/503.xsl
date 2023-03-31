<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8" />
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
                    <xsl:for-each select="artistas/artista[nacimiento &gt; 1500]">
                        <xsl:sort select="nacimiento" order="ascending" />
                            <tr>
                            <td>
                                <xsl:value-of select="@id" />
                            </td>
                            <td>
                                <xsl:value-of select="nombre" />
                            </td>
                            <td>
                                <xsl:value-of select="nacimiento" />
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="fallecimiento">
                                        <xsl:value-of select="fallecimiento" />
                                    </xsl:when>
                                    <xsl:otherwise>Desconocido</xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td>
                                <xsl:value-of select="pais" />
                            </td>
                            <td>
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