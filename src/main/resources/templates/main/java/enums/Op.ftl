package ${gen.enumPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * 操作类型枚举
 */
</#if>
public enum Op {
    Insert,Remove,Modify,Query,QueryCount,QueryPage;
}