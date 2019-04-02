<?xml version="1.0" encoding="ISO-8859-1"?><!--
A PDF file that has 3 columns: Name (where you should have both
first name and last name), Phone and Nationality.
 Please give the header of the table a color.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:exsl="http://exslt.org/common" xmlns:java="http://xml.apache.org/xalan/java"
                version="1.0" extension-element-prefixes="exsl" exclude-result-prefixes="java">
	<xsl:output method="xml" indent="yes" />
		<xsl:template match="employees">

      <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

        <fo:layout-master-set>
				<fo:simple-page-master master-name="page">
					<fo:region-body margin-top="7.62cm" margin-left="3cm" margin-right="3cm" />
				</fo:simple-page-master>
			</fo:layout-master-set>

      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">
           <fo:block font-weight="bold" text-align="left">Employees</fo:block>
           <fo:block padding-top="5mm" />

          <!--Table-->
          <fo:table font-size="12pt">

					<fo:table-header text-align="center" color="#ecc4b0">
						<fo:table-row>
							<fo:table-cell>
								<fo:block font-weight="bold">Name</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold">Phone</fo:block>
							</fo:table-cell>
							<fo:table-cell>
								<fo:block font-weight="bold">Nationality</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-header>

					<fo:table-body>
						<xsl:for-each select="employee">

							<fo:table-row text-align="center">
								<fo:table-cell>
									<fo:block><xsl:value-of select="concat(first_name,last_name)" /></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block><xsl:value-of select="phone" /></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block><xsl:value-of select="nationality" /></fo:block>
								</fo:table-cell>
							</fo:table-row>

						</xsl:for-each>
							</fo:table-body>
						</fo:table>

        <fo:block padding-top="5mm" />
        <xsl:for-each select="employee">
          <xsl:if test="id=4">
            <fo:block> Employee with ID  4 is <xsl:value-of select="concat(first_name,', ',last_name )" /></fo:block>
          </xsl:if>
        </xsl:for-each>

        </fo:flow>
      </fo:page-sequence>
		</fo:root>
  </xsl:template>
</xsl:stylesheet>
