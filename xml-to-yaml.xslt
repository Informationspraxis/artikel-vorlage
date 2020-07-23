<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:pkp="http://pkp.sfu.ca">

<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyzäöüßáéóúàèòùâêôûç'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZÖÄÜẞÁÉÓÚÀÈÒÙÂÊÔÛÇ'" />

<xsl:output method="text" media-type="text/yml" indent="yes"/>

<xsl:template match="/pkp:article">
  <xsl:text>---&#xa;# Von den AutorInnen vergebene Metadaten</xsl:text>
	<xsl:apply-templates select="*" />
	<xsl:text>&#xa;&#xa;title-en:</xsl:text>
	<xsl:text>&#xa;abstract-en:</xsl:text>
	<xsl:text>&#xa;keywords-en:</xsl:text>
	<xsl:text>&#xa;&#xa;# Von der Redaktion vergebene Metadaten&#xa;</xsl:text>
	<xsl:text>&#xa;author-short: </xsl:text>
	<xsl:for-each select="./pkp:authors/pkp:author">
		<xsl:value-of select="./pkp:familyname" />
		<xsl:choose>
      <xsl:when test="position() != last()">
			  <xsl:text>/</xsl:text>
			</xsl:when>
    </xsl:choose>
	</xsl:for-each>
	<xsl:text>&#xa;title-short: </xsl:text>
	<xsl:variable name="shorttitle1" select="substring-before(./pkp:title[@locale='de_DE'], ' – ')" />
	<xsl:choose>
		<xsl:when test="string-length($shorttitle1) &lt; 40">
			<xsl:value-of select="$shorttitle1" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="substring(./pkp:title[@locale='de_DE'], 1, 40)" />
		</xsl:otherwise>
	</xsl:choose>
	<xsl:text>&#xa;category: </xsl:text>
	<xsl:if test="@section_ref='KurzB'">
		<xsl:text>Kurzbeitrag</xsl:text>
	</xsl:if>
	<xsl:if test="@section_ref='FachB'">
		<xsl:text>Fachbeitrag</xsl:text>
	</xsl:if>
	<xsl:text>&#xa;date: </xsl:text>
	<xsl:value-of select="@date_published" />
	<xsl:text>&#xa;identifier: 10.11588/ip.YYYY.N.</xsl:text>
	<xsl:value-of select="./pkp:id" />
	<xsl:text>&#xa;publisher: Informationspraxis Bd. </xsl:text>
	<xsl:value-of select="./pkp:issue_identification/pkp:volume" />
	<xsl:text>, Nr. </xsl:text>
	<xsl:value-of select="./pkp:issue_identification/pkp:number" />
	<xsl:text> (</xsl:text>
	<xsl:value-of select="./pkp:issue_identification/pkp:year" />
	<xsl:text>)</xsl:text>
	<xsl:text>&#xa;lang: de</xsl:text>
	<xsl:text>&#xa;rights: CC-BY 4.0</xsl:text>
	<xsl:text>&#xa;...&#xa;</xsl:text>
</xsl:template>

<xsl:template match="pkp:title">
  <xsl:if test="@locale='de_DE'">
    <xsl:text>&#xa;title: </xsl:text>
	</xsl:if>
	<xsl:if test="@locale='en_US'">
    <xsl:text>&#xa;title-en: </xsl:text>
	</xsl:if>
  <xsl:value-of select="." />
</xsl:template>

<xsl:template match="pkp:authors">
  <xsl:text>&#xa;author: </xsl:text>
	<xsl:for-each select="./pkp:author">
		<xsl:value-of select="./pkp:givenname" />
		<xsl:text> </xsl:text>
		<xsl:value-of select="translate(./pkp:familyname, $lowercase, $uppercase)" />
		<xsl:choose>
      <xsl:when test="position() != last()">
			  <xsl:text>, </xsl:text>
			</xsl:when>
    </xsl:choose>
	</xsl:for-each>
  <xsl:text>&#xa;author-detail: </xsl:text>
	<xsl:apply-templates select="*" />
</xsl:template>

<xsl:template match="pkp:author">
  <xsl:text>&#xa;    - name: </xsl:text>
  <xsl:value-of select="./pkp:givenname" />
	<xsl:text> </xsl:text>
	<xsl:value-of select="./pkp:familyname" />
	<xsl:text>&#xa;      email: </xsl:text>
  <xsl:value-of select="./pkp:email" />
	<xsl:text>&#xa;      url: </xsl:text>
  <xsl:value-of select="./pkp:url" />
	<xsl:text>&#xa;      orcid: </xsl:text>
  <xsl:value-of select="./pkp:orcid" />
	<xsl:text>&#xa;      affiliation: </xsl:text>
  <xsl:value-of select="./pkp:affiliation" />
</xsl:template>

<xsl:template match="pkp:abstract">
  <xsl:if test="@locale='de_DE'">
    <xsl:text>&#xa;abstract: &#xa;    </xsl:text>
	</xsl:if>
  <xsl:if test="@locale='en_US'">
    <xsl:text>&#xa;abstract-en: &#xa;    </xsl:text>
	</xsl:if>
  <xsl:value-of select="normalize-space(.)" />
</xsl:template>

<xsl:template match="pkp:subjects[@locale='de_DE']">
  <xsl:if test="@locale='de_DE'">
	  <xsl:text>&#xa;keywords:</xsl:text>
	</xsl:if>
	<xsl:if test="@locale='en_US'">
	  <xsl:text>&#xa;keywords-en:</xsl:text>
	</xsl:if>
  <xsl:apply-templates select="*" />
</xsl:template>

<xsl:template match="pkp:subject">
  <xsl:text>&#xa;    - </xsl:text>
  <xsl:value-of select="." />
</xsl:template>

<xsl:template match="*" />

</xsl:stylesheet>