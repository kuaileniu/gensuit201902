package ${gen.enumPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * SQL中Where条件类型
 */
</#if>
public enum WhereType {
    Default, Native, Func
}
