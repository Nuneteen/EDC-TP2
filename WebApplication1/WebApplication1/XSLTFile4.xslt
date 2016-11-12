<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

  <xsl:template match="properties">
    <properties>
      <xsl:for-each select="property">
        <property>
          <Owners>

            <xsl:attribute name="owner">
              <xsl:for-each select="owner">
                <xsl:value-of select="name"/>
              </xsl:for-each>
            </xsl:attribute>
            
          </Owners>


        </property>
      </xsl:for-each>
    </properties>
  </xsl:template>
</xsl:stylesheet>
