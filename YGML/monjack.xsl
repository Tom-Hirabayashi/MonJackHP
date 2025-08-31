<?xml version="1.0" encoding="Shift-JIS" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<html>
		<head>
		<title>Yahoo!グループ　文籍(MonJack)メーリングリストの過去ログ</title>
		</head>

			<xsl:apply-templates />
		</html>
	</xsl:template>

	<xsl:template match="table">
		<body> <xsl:attribute name="bgcolor">#c7f2aa</xsl:attribute>
		      Yahoo!グループで一般公開されていた文籍(MonJack)メーリングリストの過去ログです。<br />
		      メールアドレスは手作業で取り除かせていただきました。	
		     
		      <h3 id="000">目次</h3>	
                                      <table border="1" cellspacing="0">
			<tr><xsl:attribute name="bgcolor">#ceff9c</xsl:attribute><th>番号</th><th>投稿日時</th><th>件名</th></tr>
			<xsl:apply-templates  mode="index" />
		      </table>
		      <br />
		      <h3>過去ログ</h3>	
                                      <table border="1" cellspacing="0">
  		      <TBODY>

  		      	<xsl:apply-templates />
 		      </TBODY>
		      </table>

                              </body>
	</xsl:template>

	<xsl:template match="表示用" mode="index">
		<tr>
			<td><a>
			  	<xsl:attribute name="href">
 				#<xsl:value-of select="番号" />
  				</xsl:attribute>
				<xsl:value-of select="番号" />
			</a></td>
			<td><xsl:value-of select="translate(substring(送信日時,0,17),'-T','/ ')" /></td>
			<td><xsl:value-of select="件名" /></td>
		</tr>
	</xsl:template>
	<xsl:template match="表示用" >
  		  <TR><xsl:attribute name="bgcolor">#ceff9c</xsl:attribute>
      			<TD>番号</TD>
      			<TD><xsl:attribute name="id"><xsl:value-of select="番号" /></xsl:attribute>
			<xsl:value-of select="番号" />
			</TD>
      			<TD>件名</TD>
      			<TD><xsl:value-of select="件名" /></TD>
      			<TD>投稿者</TD>
      			<TD><xsl:value-of select="差出人_x0020__x003A__x0020__x0028_名前_x0029_" /></TD>
      			<TD><xsl:value-of select="translate(substring(送信日時,0,17),'-T','/ ')" /></TD>
    			</TR>
    			<TR>
      			<TD colspan="7"><xsl:call-template name="replace"><xsl:with-param name="str" select="本文" /></xsl:call-template>
			<br />
			<A><xsl:attribute name="href">#000</xsl:attribute>目次に戻る</A>
			</TD>
    			</TR>
 	</xsl:template>
  	
	<xsl:template name="replace">
  		<xsl:param name="str"/>
 		 <xsl:choose>
	    		<xsl:when test="contains($str,'&#10;')">
      				<xsl:value-of select="substring-before($str,'&#10;')"/><br /><xsl:call-template name="replace"><xsl:with-param name="str" select="substring-after($str,'&#10;')"/>
   	   			</xsl:call-template>
 	   		</xsl:when>
	    		<xsl:otherwise><xsl:value-of select="$str"/></xsl:otherwise>
  		</xsl:choose>
  	</xsl:template>


</xsl:stylesheet>