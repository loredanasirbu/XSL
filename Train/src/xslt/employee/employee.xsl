<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >

  <xsl:template match="/">
  <html>
    <head>
      <title>
        Employee exercise
      </title>
    </head>
  <body>
    <h2>Employees</h2>
    <table> <tbody align="center">
      <tr bgcolor="#d8ecb0">
        <th>Full name</th>
        <th>Phone</th>
        <th>Nationality</th>
      </tr>
      <xsl:for-each select="employees/employee">
        <tr>
          <td><xsl:value-of select="concat(first_name,' ',last_name)" /></td>
          <td><xsl:value-of select="phone" /></td>
          <td><xsl:value-of select="nationality" /></td>
        </tr>
      </xsl:for-each></tbody>
    </table>
    <xsl:for-each select="employees/employee">
      <xsl:if test="id=4">
        <h4><i>Employee with id = <xsl:value-of select="id" /> : <xsl:value-of select="concat(first_name,' ',last_name)" /></i></h4>
      </xsl:if>
    </xsl:for-each>

     <xsl:for-each select="employees/employee" >
      <xsl:value-of select="concat(first_name,', ',last_name,', ', nationality,', ', phone, '.')"  />
      <br />
    </xsl:for-each>

  </body>
  </html>
</xsl:template>

</xsl:stylesheet>