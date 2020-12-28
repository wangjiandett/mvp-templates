<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
   
<#if generateLayout>
	<instantiate from="root/res/layout/mvp_simple.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
	<open file="${escapeXmlAttribute(srcOut)}/layout/${layoutName}.xml" />
</#if>

<#if generateFragment>
    <instantiate from="root/src/app_package/MVPFragment.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/view/${fragmentClass}.${ktOrJavaExt}" />
	<open file="${escapeXmlAttribute(srcOut)}/${fragmentClass}.${ktOrJavaExt}" />
</#if>

<instantiate from="root/src/app_package/MVPContract.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/contract/${mvpName}Contract.${ktOrJavaExt}" />
				   
 <#if !userObjectAsResponse>
	<instantiate from="root/src/app_package/MVPResponse.${ktOrJavaExt}.ftl"
                 to="${escapeXmlAttribute(srcOut)}/mvp/bean/${mvpName}Response.${ktOrJavaExt}" />
</#if>
				   
<instantiate from="root/src/app_package/MVPPresenter.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/presenter/${mvpName}Presenter.${ktOrJavaExt}" />

<instantiate from="root/src/app_package/MVPModel.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/mvp/model/${mvpName}Model.${ktOrJavaExt}" />

</recipe>
