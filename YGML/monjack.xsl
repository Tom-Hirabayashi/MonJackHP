<?xml version="1.0" encoding="Shift-JIS" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<html>
		<head>
		<title>Yahoo!�O���[�v�@����(MonJack)���[�����O���X�g�̉ߋ����O</title>
		</head>

			<xsl:apply-templates />
		</html>
	</xsl:template>

	<xsl:template match="table">
		<body> <xsl:attribute name="bgcolor">#c7f2aa</xsl:attribute>
		      Yahoo!�O���[�v�ň�ʌ��J����Ă�������(MonJack)���[�����O���X�g�̉ߋ����O�ł��B<br />
		      ���[���A�h���X�͎��ƂŎ�菜�����Ă��������܂����B	
		     
		      <h3 id="000">�ڎ�</h3>	
                                      <table border="1" cellspacing="0">
			<tr><xsl:attribute name="bgcolor">#ceff9c</xsl:attribute><th>�ԍ�</th><th>���e����</th><th>����</th></tr>
			<xsl:apply-templates  mode="index" />
		      </table>
		      <br />
		      <h3>�ߋ����O</h3>	
                                      <table border="1" cellspacing="0">
  		      <TBODY>

  		      	<xsl:apply-templates />
 		      </TBODY>
		      </table>

                              </body>
	</xsl:template>

	<xsl:template match="�\���p" mode="index">
		<tr>
			<td><a>
			  	<xsl:attribute name="href">
 				#<xsl:value-of select="�ԍ�" />
  				</xsl:attribute>
				<xsl:value-of select="�ԍ�" />
			</a></td>
			<td><xsl:value-of select="translate(substring(���M����,0,17),'-T','/ ')" /></td>
			<td><xsl:value-of select="����" /></td>
		</tr>
	</xsl:template>
	<xsl:template match="�\���p" >
  		  <TR><xsl:attribute name="bgcolor">#ceff9c</xsl:attribute>
      			<TD>�ԍ�</TD>
      			<TD><xsl:attribute name="id"><xsl:value-of select="�ԍ�" /></xsl:attribute>
			<xsl:value-of select="�ԍ�" />
			</TD>
      			<TD>����</TD>
      			<TD><xsl:value-of select="����" /></TD>
      			<TD>���e��</TD>
      			<TD><xsl:value-of select="���o�l_x0020__x003A__x0020__x0028_���O_x0029_" /></TD>
      			<TD><xsl:value-of select="translate(substring(���M����,0,17),'-T','/ ')" /></TD>
    			</TR>
    			<TR>
      			<TD colspan="7"><xsl:call-template name="replace"><xsl:with-param name="str" select="�{��" /></xsl:call-template>
			<br />
			<A><xsl:attribute name="href">#000</xsl:attribute>�ڎ��ɖ߂�</A>
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