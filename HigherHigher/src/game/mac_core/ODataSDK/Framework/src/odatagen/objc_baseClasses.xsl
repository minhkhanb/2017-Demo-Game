<?xml version="1.0" encoding="utf-8"?><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"xmlns:edmx="http://schemas.microsoft.com/ado/2007/06/edmx"xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices"xmlns:schema_1_0="http://schemas.microsoft.com/ado/2006/04/edm"xmlns:schema_1_1="http://schemas.microsoft.com/ado/2007/05/edm"xmlns:schema_1_2="http://schemas.microsoft.com/ado/2008/09/edm"xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata"><xsl:output method="text"/><!-- Default service URI passed externally--><xsl:param name="DefaultServiceURI"/>
<!-- Service NameSpace-->
<xsl:variable name="service_namespace" select="concat(//schema_1_0:EntityType/../@Namespace, //schema_1_1:EntityType/../@Namespace, //schema_1_2:EntityType/../@Namespace)" />
<xsl:variable name="modified_service_namespace">
	<xsl:call-template name="cleanQuote">
	<xsl:with-param name="string">
	<xsl:value-of select="$service_namespace"/>
	</xsl:with-param>
</xsl:call-template>
</xsl:variable>


<xsl:template match="/">/**
*
*Copyright 2010 Microsoft Corp
*
*Licensed under the Apache License, Version 2.0 (the "License");
*you may not use this file except in compliance with the License.
*You may obtain a copy of the License at
*
*http://www.apache.org/licenses/LICENSE-2.0
*
*Unless required by applicable law or agreed to in writing, software
*distributed under the License is distributed on an "AS IS" BASIS,
*WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*See the License for the specific language governing permissions and
*limitations under the License.
*/
/**
* This code was generated by the tool 'odatagen'.
* Runtime Version:1.0
*
* Changes to this file may cause incorrect behavior and will be lost if
* the code is regenerated.
*/
/**
* Defines default Data Service URL for this proxy class
*/
#define DEFAULT_SERVICE_URL @"<xsl:value-of select="$DefaultServiceURI"/>"

<xsl:apply-templates select="/edmx:Edmx/edmx:DataServices"/>
<xsl:apply-templates select="/edmx:Edmx/edmx:DataServices/schema_1_0:Schema | /edmx:Edmx/edmx:DataServices/schema_1_1:Schema | /edmx:Edmx/edmx:DataServices/schema_1_2:Schema"/>
</xsl:template>
<xsl:template match="/edmx:Edmx/edmx:DataServices/schema_1_0:Schema | /edmx:Edmx/edmx:DataServices/schema_1_1:Schema | /edmx:Edmx/edmx:DataServices/schema_1_2:Schema">
<xsl:for-each select="schema_1_0:ComplexType | schema_1_1:ComplexType | schema_1_2:ComplexType">
@class <xsl:value-of select="$modified_service_namespace"/>_<xsl:value-of select="@Name"/>;
</xsl:for-each>
<xsl:for-each select="schema_1_0:ComplexType | schema_1_1:ComplexType | schema_1_2:ComplexType">
<xsl:apply-templates select="."/>
</xsl:for-each>
<xsl:for-each select="schema_1_0:EntityType | schema_1_1:EntityType | schema_1_2:EntityType">
<xsl:apply-templates select="."/></xsl:for-each>
</xsl:template>

<xsl:template match="/edmx:Edmx/edmx:DataServices">
#define DataServiceVersion @"<xsl:value-of select="@m:DataServiceVersion"/>"

#import "ODataObject.h"
#import "ObjectContext.h"
#import "DataServiceQuery.h"
#import "ODataGUID.h"
#import "ODataBool.h"
#import  "mProperties.h"

</xsl:template>

<!-- Generate ComplexType interface -->
<xsl:template match="schema_1_0:ComplexType | schema_1_1:ComplexType | schema_1_2:ComplexType">
/**
 * @interface:<xsl:value-of select="@Name"/>
 <xsl:for-each select="schema_1_0:Key | schema_1_1:Key | schema_1_2:Key">
 <xsl:for-each select="schema_1_0:PropertyRef | schema_1_1:PropertyRef | schema_1_2:PropertyRef">
 * @key:<xsl:value-of select="@Name"/>
 </xsl:for-each>
 </xsl:for-each>
 <xsl:if test="@m:FC_SourcePath">
 * @FC_SourcePath:<xsl:value-of select="@m:FC_SourcePath"/>
 * @FC_TargetPath:<xsl:value-of select="@m:FC_TargetPath"/>
 * @FC_ContentKind:<xsl:value-of select="@m:FC_ContentKind"/>
 * @FC_KeepInContent:<xsl:value-of select="@m:FC_KeepInContent"/>
 </xsl:if>
 */
@interface <xsl:value-of select="$modified_service_namespace"/>_<xsl:value-of select="@Name"/> :ODataObject
{<xsl:for-each select="schema_1_0:Property | schema_1_1:Property | schema_1_2:Property">
	/**
	* @Type:ComplexTypeProperty<xsl:if test="@Nullable = 'false'">
	* NotNullable</xsl:if>
	* @EdmType:<xsl:value-of select="@Type"/><xsl:if test="@Type = 'Edm.String'">
	* @MaxLength:<xsl:value-of select="@MaxLength"/>
	* @FixedLength:<xsl:value-of select="@FixedLength"/>
	</xsl:if>
	<xsl:if test="@m:FC_TargetPath">
	* @FC_TargetPath:<xsl:value-of select="@m:FC_TargetPath"/>
	* @FC_ContentKind:<xsl:value-of select="@m:FC_ContentKind"/>
	* @FC_NsPrefix:<xsl:value-of select="@m:FC_NsPrefix"/>
	* @FC_NsUri:<xsl:value-of select="@m:FC_NsUri"/>
	* @FC_KeepInContent:<xsl:value-of select="@m:FC_KeepInContent"/>
	</xsl:if>
	*/
	<xsl:if test="@Type = 'Edm.String'">NSString *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Int32'">NSNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Int16'">NSNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Int64'">NSNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Binary'">NSData *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Decimal'">NSDecimalNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Boolean'">ODataBool *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.DateTime'">NSDate *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Single'">NSDecimalNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Guid'">NSString *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Double'">NSDecimalNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.DateTimeOffset'">NSDate *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Time'">NSDate *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Byte'">Byte m_</xsl:if>
	<xsl:if test="contains(@Type, $service_namespace)"><xsl:if test="contains(@Type,@ComplexType)"><xsl:value-of select="$modified_service_namespace"/>_<xsl:value-of select="substring-after(@Type,concat($service_namespace, '.'))"/> *m_</xsl:if></xsl:if>
	<xsl:value-of select="@Name"/>;
	</xsl:for-each>
}
<xsl:for-each select="schema_1_0:Property | schema_1_1:Property | schema_1_2:Property">
@property ( nonatomic , <xsl:if test="@Type = 'Edm.String'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: ) NSString *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Int32'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Int16'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Int64'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Binary'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSData *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Decimal'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDecimalNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.DateTime'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDate *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.DateTimeOffset'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDate *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Time'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDate *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Single'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDecimalNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Guid'">retain ,  getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSString *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Double'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDecimalNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Byte'">assign , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )Byte m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Boolean'">assign , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )ODataBool *m_</xsl:if>
    <xsl:if test="contains(@Type, $service_namespace)"><xsl:if test="contains(@Type,@ComplexType)"> retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )<xsl:value-of select="$modified_service_namespace"/>_<xsl:value-of select="substring-after(@Type,concat($service_namespace, '.'))"/> *m_</xsl:if></xsl:if>
<xsl:value-of select="@Name"/>;</xsl:for-each>

@end
</xsl:template>
<xsl:template match="schema_1_0:EntityType | schema_1_1:EntityType | schema_1_2:EntityType">
<xsl:if test="not(@BaseType)"><xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
<xsl:variable name="service_namespace" select="concat(//schema_1_0:EntityType/../@Namespace, //schema_1_1:EntityType/../@Namespace, //schema_1_2:EntityType/../@Namespace)" />
/**
 * @interface:<xsl:value-of select="@Name"/>
 * @Type:EntityType
 <xsl:for-each select="schema_1_0:Key | schema_1_1:Key | schema_1_2:Key">
 <xsl:for-each select="schema_1_0:PropertyRef | schema_1_1:PropertyRef | schema_1_2:PropertyRef">
 * @key:<xsl:value-of select="@Name"/>
 </xsl:for-each>
 </xsl:for-each>* <xsl:if test="@BaseType">@BaseClass:<xsl:value-of select="substring-after(@BaseType, concat($service_namespace, '.'))"/></xsl:if>
 <xsl:if test="@m:FC_SourcePath">
 * @FC_SourcePath:<xsl:value-of select="@m:FC_SourcePath"/>
 * @FC_TargetPath:<xsl:value-of select="@m:FC_TargetPath"/>
 * @FC_ContentKind:<xsl:value-of select="@m:FC_ContentKind"/>
 * @FC_KeepInContent:<xsl:value-of select="@m:FC_KeepInContent"/>
 * @FC_Criteria:NIL
 </xsl:if>
 */
@interface <xsl:value-of select="$modified_service_namespace"/>_<xsl:value-of select="@Name"/> : <xsl:choose><xsl:when test="@BaseType"><xsl:value-of select="substring-after(@BaseType, concat($service_namespace, '.'))"/></xsl:when><xsl:otherwise>ODataObject</xsl:otherwise></xsl:choose>
{
	<xsl:for-each select="schema_1_0:Property | schema_1_1:Property | schema_1_2:Property">
	/**
	* @Type:EntityProperty<xsl:if test="@Nullable = 'false'">
	* NotNullable</xsl:if>
	* @EdmType:<xsl:value-of select="@Type"/><xsl:if test="@Type = 'Edm.String'">
	* @MaxLength:<xsl:value-of select="@MaxLength"/>
	* @FixedLength:<xsl:value-of select="@FixedLength"/>
	</xsl:if>
	<xsl:if test="@m:FC_TargetPath">
	* @FC_TargetPath:<xsl:value-of select="@m:FC_TargetPath"/>
	* @FC_ContentKind:<xsl:value-of select="@m:FC_ContentKind"/>
	* @FC_NsPrefix:<xsl:value-of select="@m:FC_NsPrefix"/>
	* @FC_NsUri:<xsl:value-of select="@m:FC_NsUri"/>
	* @FC_KeepInContent:<xsl:value-of select="@m:FC_KeepInContent"/>
   * @FC_Criteria:NIL
	</xsl:if>
	*/
	<xsl:if test="@Type = 'Edm.String'">NSString *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Int32'">NSNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Int16'">NSNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Int64'">NSNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Binary'">NSData *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Decimal'">NSDecimalNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Boolean'">ODataBool *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.DateTime'">NSDate *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.DateTimeOffset'">NSDate *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Time'">NSDate *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Single'">NSDecimalNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Guid'">NSString *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Double'">NSDecimalNumber *m_</xsl:if>
	<xsl:if test="@Type = 'Edm.Byte'">Byte m_</xsl:if>
	<xsl:if test="contains(@Type, $service_namespace)"><xsl:if test="contains(@Type,@ComplexType)"><xsl:value-of select="$modified_service_namespace"/>_<xsl:value-of select="substring-after(@Type,concat($service_namespace, '.'))"/> *m_</xsl:if></xsl:if>
	<xsl:value-of select="@Name"/>;
	</xsl:for-each>

	<xsl:for-each select="schema_1_0:NavigationProperty | schema_1_1:NavigationProperty | schema_1_2:NavigationProperty">
	/**
	* @Type:NavigationProperty
	* @Relationship:<xsl:value-of select="substring-after(@Relationship, concat($service_namespace, '.'))"/>
	* @FromRole:<xsl:value-of select="@FromRole"/>
	* @ToRole:<xsl:value-of select="@ToRole"/>
	*/
	NSMutableArray *m_<xsl:value-of select="@Name"/>;
	</xsl:for-each>
}
<xsl:for-each select="schema_1_0:Property | schema_1_1:Property | schema_1_2:Property">
@property ( nonatomic , <xsl:if test="@Type = 'Edm.String'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: ) NSString *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Int32'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Int16'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Int64'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Binary'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSData *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Decimal'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDecimalNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.DateTime'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDate *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Single'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDecimalNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Guid'">retain ,  getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSString *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Double'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDecimalNumber *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.DateTimeOffset'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDate *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Time'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSDate *m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Byte'">assign , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )Byte m_</xsl:if>
    <xsl:if test="@Type = 'Edm.Boolean'">retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )ODataBool *m_</xsl:if>
    <xsl:if test="contains(@Type, $service_namespace)"><xsl:if test="contains(@Type,@ComplexType)"> retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )<xsl:value-of select="$modified_service_namespace"/>_<xsl:value-of select="substring-after(@Type,concat($service_namespace, '.'))"/> *m_</xsl:if></xsl:if>
<xsl:value-of select="@Name"/>;</xsl:for-each>

<xsl:for-each select="schema_1_0:NavigationProperty | schema_1_1:NavigationProperty | schema_1_2:NavigationProperty">
@property ( nonatomic , retain , getter=get<xsl:value-of select="@Name"/> , setter=set<xsl:value-of select="@Name"/>: )NSMutableArray *m_<xsl:value-of select="@Name"/>;</xsl:for-each>

+ (id) Create<xsl:value-of select="@Name"/><xsl:if test="schema_1_0:Property[@Nullable = 'false'] | schema_1_1:Property[@Nullable = 'false'] | schema_1_2:Property[@Nullable = 'false']">With<xsl:for-each select="schema_1_0:Property[@Nullable = 'false'] | schema_1_1:Property[@Nullable = 'false'] | schema_1_2:Property[@Nullable = 'false']"><xsl:value-of select="translate(@Name, $uppercase, $smallcase)"/>:(<xsl:if test="@Type = 'Edm.String'">NSString *</xsl:if><xsl:if test="@Type = 'Edm.Int32'">NSNumber *</xsl:if><xsl:if test="@Type = 'Edm.Int16'">NSNumber *</xsl:if><xsl:if test="@Type = 'Edm.Int64'">NSNumber *</xsl:if>
<xsl:if test="@Type = 'Edm.Binary'">NSData *</xsl:if>
<xsl:if test="@Type = 'Edm.Decimal'">NSDecimalNumber *</xsl:if>
<xsl:if test="@Type = 'Edm.Boolean'">ODataBool *</xsl:if>
<xsl:if test="@Type = 'Edm.DateTime'">NSDate *</xsl:if>
<xsl:if test="@Type = 'Edm.Single'">NSDecimalNumber *</xsl:if>
<xsl:if test="@Type = 'Edm.Guid'">NSString *</xsl:if>
<xsl:if test="@Type = 'Edm.DateTimeOffset'">NSDate *</xsl:if>
<xsl:if test="@Type = 'Edm.Time'">NSDate *</xsl:if>
<xsl:if test="@Type = 'Edm.Byte'">Byte </xsl:if>
<xsl:if test="contains(@Type, $service_namespace)"><xsl:if test="contains(@Type,@ComplexType)"><xsl:value-of select="$modified_service_namespace"/>_<xsl:value-of select="substring-after(@Type,concat($service_namespace, '.'))"/> *</xsl:if></xsl:if>
<xsl:if test="@Type = 'Edm.Double'">NSDecimalNumber *</xsl:if>)a<xsl:value-of select="@Name"/><xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if></xsl:for-each></xsl:if>;
- (id) init;
- (id) initWithUri:(NSString*)anUri;
@end
</xsl:if></xsl:template>
<xsl:template name="cleanQuote">
<xsl:param name="string" />
<xsl:if test="contains($string, '.')"><xsl:value-of
    select="substring-before($string, '.')" />_<xsl:call-template name="cleanQuote">
                <xsl:with-param name="string"><xsl:value-of
select="substring-after($string, '.')" />
                </xsl:with-param>
        </xsl:call-template>
</xsl:if>
<xsl:if test="not(contains($string, '.'))"><xsl:value-of select="$string" />
</xsl:if>
</xsl:template>
</xsl:stylesheet>