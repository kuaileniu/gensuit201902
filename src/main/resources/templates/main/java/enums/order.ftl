<#--package ${packageStr};-->
package ${gen.enumPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * 升降序枚举
 */
</#if>
public enum OrderBy {
   ASC, DESC
}