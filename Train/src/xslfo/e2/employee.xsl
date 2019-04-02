<?xml version="1.0" encoding="ISO-8859-1"?>
<!--
A PDF file that contains as many tables as the distinct number of nationalities.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">

<xsl:key name="bykey" match="employees/employee" use="nationality" />

		<xsl:template match="employees">

      <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

        <fo:layout-master-set>
					<fo:simple-page-master master-name="page">
						<fo:region-body margin-top="6cm" margin-left="3cm" margin-right="3cm" />
					</fo:simple-page-master>
				</fo:layout-master-set>

      <fo:page-sequence master-reference="page">
        <fo:flow flow-name="xsl-region-body">

           <fo:block font-weight="bold" text-align="left">Employees per nationality </fo:block>
           <fo:block padding-top="5mm" />

					<!-- group start, get list of different nationalities-->
					<xsl:for-each select="employee[count(. | key('bykey', nationality)[1]) = 1]">

					<fo:block font-size="14pt" font-family="SansSerif" color="#0000FF" text-align="left">
						<xsl:value-of select="nationality"></xsl:value-of>
					</fo:block>

						<!-- for all employees for current nationality-->

						<fo:table break-after="page">

							<fo:table-header text-align="center" color="#ecc4b0">

								<fo:table-row>
									<fo:table-cell>
										<fo:block font-weight="bold">First name</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">Last name</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">Phone</fo:block>
									</fo:table-cell>
								</fo:table-row>

							</fo:table-header>

							<fo:table-body>
								<xsl:for-each select="key('bykey', nationality)">

									<fo:table-row text-align="center">
										<fo:table-cell>
											<fo:block><xsl:value-of select="first_name" /></fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block><xsl:value-of select="last_name" /></fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block><xsl:value-of select="phone" /></fo:block>
										</fo:table-cell>
									</fo:table-row>

								</xsl:for-each>
							</fo:table-body>

						</fo:table>
					</xsl:for-each>


        </fo:flow>
      </fo:page-sequence>
		</fo:root>
  </xsl:template>
</xsl:stylesheet>
