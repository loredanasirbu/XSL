<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/">
  <html>
    <head>
      <title>
        Catalog exercise
      </title>
    </head>
  <body>
    <h2>A list of all titles and artists of all CD-s, ordered alphabetically based on the artist name</h2>
    <table> <tbody align="center">
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:sort select="artist" data-type="text" order="ascending" />
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
        </tr>
      </xsl:for-each></tbody>
    </table>

    <h2>Title, artist and price of all CDs, sorted based on the price</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Price</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:sort select="price" />
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="price" /></td>
        </tr>
      </xsl:for-each>
    </table>

    <h2>Title, artist, company, year and country for all CDs which have the price between 5 and 10</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Company</th>
        <th>Year</th>
        <th>Country</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:if test="price &gt; 5 and price &lt; 10">
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="company" /></td>
          <td><xsl:value-of select="year" /></td>
          <td><xsl:value-of select="country" /></td>
        </tr>
        </xsl:if>
      </xsl:for-each>
    </table>


    <h2>Title, artist and company of all CDs which appeared in UK</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Company</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:if test="country='UK'">
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="company" /></td>
        </tr>
        </xsl:if>
      </xsl:for-each>
    </table>

    <h2>Title, artist and year of all CDs which appeared at Columbia company</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Year</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:if test="company='Columbia'">
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="year" /></td>
        </tr>
        </xsl:if>
      </xsl:for-each>
    </table>

    <h2>Number of CD-s appeared in USA</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th><xsl:value-of select="count(/catalog/cd[country='USA'])" /></th>
        <!--<th><xsl:value-of select="count(/catalog/cd/country[text() = 'USA'])"/></th>-->
      </tr>
    </table>


    <h2>Title, artist, country and price for all CDs which are not from USA country</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Country</th>
        <th>Price</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:if test="country!='USA'">
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="country" /></td>
          <td><xsl:value-of select="price" /></td>
        </tr>
        </xsl:if>
      </xsl:for-each>
    </table>

    <h2>Title, artist, price and company for all CDs, cheaper than 8</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Price</th>
        <th>Company</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:if test="price &lt; 8">
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="price" /></td>
          <td><xsl:value-of select="company" /></td>
        </tr>
        </xsl:if>
      </xsl:for-each>
    </table>

    <h2>All the info for all CDs appeared at Atlantic company after 1980 and cheaper than 9</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Country</th>
        <th>Company</th>
        <th>Price</th>
        <th>Year</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:if test="company= 'Atlantic' and price &lt; 9">
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="country" /></td>
          <td><xsl:value-of select="company" /></td>
          <td><xsl:value-of select="price" /></td>
          <td><xsl:value-of select="year" /></td>
        </tr>
        </xsl:if>
      </xsl:for-each>
    </table>

     <h2>Title, artist, country and price for all CDs which appeared after year 1990</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Country</th>
        <th>Price</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:if test="year &gt; 1990">
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="country" /></td>
          <td><xsl:value-of select="price" /></td>
        </tr>
        </xsl:if>
      </xsl:for-each>
    </table>

    <h2>Number of CDs recorded before year 2000 and which cost more than 10</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th><xsl:value-of select="count(/catalog/cd[year &lt; 2000 and price &gt; 10])" /></th>
      </tr>
    </table>

    <h2>Total price for all Tina Turner’s CDs</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th><xsl:value-of select="sum(/catalog/cd[artist='Tina Turner']/price)" /></th>
      </tr>
    </table>

    <h2>Total price of all the CDs from the catalog</h2>
    <table>
      <tr bgcolor="#d8ecb0">
       <th> <xsl:value-of select="sum(/catalog/cd/price)" /></th>
      </tr>
    </table>

    <h2>Title, artist, year and price for the most expensive and cheapest CD, respectively</h2>
    <table>
      <tr bgcolor="#d8ecb0">
        <th>Title</th>
        <th>Artist</th>
        <th>Year</th>
        <th>Price</th>
      </tr>
      <xsl:for-each select="catalog/cd">
        <xsl:sort select="price" data-type="number" order="ascending"/>
        <xsl:if test="position()=1 or position()=last()">
        <tr>
          <td><xsl:value-of select="title" /></td>
          <td><xsl:value-of select="artist" /></td>
          <td><xsl:value-of select="year" /></td>
          <td><xsl:value-of select="price" /></td>
        </tr>
        </xsl:if>
      </xsl:for-each>
    </table>

  </body>
  </html>
</xsl:template>
</xsl:stylesheet>