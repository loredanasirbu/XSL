<?xml version="1.0" encoding="ISO-8859-1"?>
<!--Create a catalog in PDF format of the CDs from the XML file cd_catalog.xml:
  ●     On the top right of each page you should show the name of the shop (Best Music) and, on the top left the word “CATALOG”.
  ●     A table having the structure: Title, Artist, Company, Country, Year, Price. The header of the table should appear on each page. At the end,
   you should show the total number of CDs and the total price.
  ●     On the footer of the page you should show the number of page, excepting the first page.-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">

<xsl:key name="bykey" match="catalog/cd" use="company" />

		<xsl:template match="catalog">

      <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

        <fo:layout-master-set>

				<fo:simple-page-master master-name="no-footer" margin="1cm">
            <fo:region-body margin-top="2cm" margin-bottom="2cm"/>
            <fo:region-before display-align="before"/>
        </fo:simple-page-master>

         <fo:simple-page-master master-name="footer" margin="1cm">
            <fo:region-body margin-top="2cm" margin-bottom="4cm"/>
            <fo:region-before display-align="before"/>
            <fo:region-after extent="3cm" display-align="after"/>
        </fo:simple-page-master>

        <fo:page-sequence-master master-name="footer-test">
            <fo:repeatable-page-master-alternatives>
                <fo:conditional-page-master-reference page-position="first" master-reference="no-footer"/>
                <fo:conditional-page-master-reference page-position="rest" master-reference="footer"/>
                <!--<fo:conditional-page-master-reference page-position="last" master-reference="no-header"/>-->
              </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>

				</fo:layout-master-set>


      <fo:page-sequence master-reference="footer-test">

         <!--header-->
				<fo:static-content flow-name="xsl-region-before">
				 <fo:block-container height="0.3in" display-align="after">
					<fo:table font-size="9pt"
										border-bottom-width="1px" border-bottom-style="solid">
					 <fo:table-body>
						<fo:table-row>
						 <fo:table-cell>
							<fo:block >CATALOG</fo:block>
						 </fo:table-cell>
						 <fo:table-cell>
							<fo:block text-align="end"> <xsl:if test="" <fo:retrieve-marker retrieve-class-name="header" /></fo:block>
						 </fo:table-cell>
						</fo:table-row>
					 </fo:table-body>
					</fo:table>
				 </fo:block-container>
				</fo:static-content>

				<!-- footer -->
				<fo:static-content flow-name="xsl-region-after" font-size="90%">
          <fo:block text-align="right" border-top="1pt dashed silver">
             Page <fo:page-number/>
          </fo:block>
        </fo:static-content>


        <fo:flow flow-name="xsl-region-body">

          <xsl:for-each select="cd[count(. | key('bykey', company)[1]) = 1]">

            <fo:block>
               <fo:marker marker-class-name="header">
                  <fo:block >
                    <xsl:value-of select="company"></xsl:value-of>
                  </fo:block>
               </fo:marker>
            </fo:block>

            <fo:table break-after="page" width="100%" table-layout="fixed"
											border-collapse="separate"
											border-separation="8pt" border="4pt solid black">

							<fo:table-header text-align="center" color="#ecc4b0" border="4pt solid black">

								<fo:table-row>
									<fo:table-cell>
										<fo:block font-weight="bold">Title</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">Artist</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block font-weight="bold">Company</fo:block>
									</fo:table-cell>
                  <fo:table-cell>
										<fo:block font-weight="bold">Country</fo:block>
									</fo:table-cell>
                  <fo:table-cell>
										<fo:block font-weight="bold">Year</fo:block>
									</fo:table-cell>
                  <fo:table-cell>
										<fo:block font-weight="bold">Price</fo:block>
									</fo:table-cell>
								</fo:table-row>

							</fo:table-header>

							<fo:table-body>
								<xsl:for-each select="key('bykey', company)">

									<fo:table-row text-align="center">
										<fo:table-cell>
											<fo:block><xsl:value-of select="title" /></fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block><xsl:value-of select="artist" /></fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block><xsl:value-of select="company" /></fo:block>
										</fo:table-cell>
                    <fo:table-cell>
											<fo:block><xsl:value-of select="country" /></fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block><xsl:value-of select="year" /></fo:block>
										</fo:table-cell>
										<fo:table-cell>
											<fo:block><xsl:value-of select="price" /></fo:block>
										</fo:table-cell>
									</fo:table-row>

								</xsl:for-each>
							</fo:table-body>

						</fo:table>
					</xsl:for-each>

					<fo:block>Total price</fo:block>
					<fo:block><xsl:value-of select="sum(cd/price)"/></fo:block>
					<fo:block>Number of CDs</fo:block>
					<fo:block><xsl:value-of select="count(cd)"/></fo:block>

        </fo:flow>

      </fo:page-sequence>
		</fo:root>
  </xsl:template>
</xsl:stylesheet>