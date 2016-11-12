<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="properties">
      <properties>
        <xsl:for-each select="property">
          <property>
            
              <xsl:attribute name="land_register_number">
                <xsl:value-of select="@land_register_number"/>
              </xsl:attribute>

              <xsl:attribute name="Value">
                <xsl:value-of select="concat(@value, ' €')"/>
              </xsl:attribute>

            
              <xsl:attribute name="City">
                <xsl:for-each select="address">
                  <xsl:value-of select="city"/>
                </xsl:for-each>
              </xsl:attribute>

              <xsl:attribute name="Street">
                <xsl:for-each select="address">
                  <xsl:value-of select="street"/>
                </xsl:for-each>
              </xsl:attribute>

              <xsl:attribute name="PortNumber">
                <xsl:for-each select="address">
                  <xsl:value-of select="port_number"/>
                </xsl:for-each>
              </xsl:attribute>
              

              <xsl:attribute name="Owners">
                <xsl:for-each select="Owners/owner">
                  <xsl:sort select="purchase_date" order="descending"/>
                  <xsl:if test="position()=1">
                    <xsl:value-of select="name"/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:attribute>
            
          </property>
        </xsl:for-each>


      </properties>
        
        
    </xsl:template>
</xsl:stylesheet>
