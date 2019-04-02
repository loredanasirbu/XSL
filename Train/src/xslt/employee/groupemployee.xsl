<?xml version="1.0" encoding="utf-8"?>
   <!--
  ~ Copyright (c) 2019. UnifiedPost, SA. http://www.unifiedpost.com
  ~ This software is the proprietary information of UnifiedPost, SA.
  ~ Use is subject to license terms.
  -->

   <!--
   Muenchian method
   An html file that contains as many tables as the distinct number of nationalities
  -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"   >
     <xsl:template match="nationality" >
        <html>
          <body>
            <h3><i>Nationality: <xsl:value-of select="current()"/></i></h3>
          </body>
        </html>
       <table id="{.}">
         <tr class="heading"  bgcolor="#c4b0ec">
           <th scope="col">First name</th>
           <th scope="col">Last name</th>
           <th scope="col">Phone</th>
         </tr>
         <xsl:variable name="temp" select="." />
         <xsl:apply-templates select="//employee[nationality = current()]" />
       </table>
     </xsl:template>

    <xsl:template match="/employees">
       <xsl:apply-templates select="employee[not(preceding-sibling::employee/nationality = nationality)]/nationality" />
     </xsl:template>

    <xsl:template match="employee" >
       <tr>
          <td>
           <xsl:value-of select="first_name"/>
         </td>
          <td>
           <xsl:value-of select="last_name"/>
         </td>
         <td>
           <xsl:value-of select="phone"/>
         </td>
       </tr>
     </xsl:template>

   </xsl:stylesheet>