package ${gen.enumPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * 函数
 */
</#if>
public enum Func {

<#if ( rdb.database == "mysql" ) >
    <#if (gen.showComment==true)>
    // CHAR_LENGTH ('中国') -- 2 ,字符显示的个数
    </#if>
    CHAR_LENGTH(" CHAR_LENGTH "),
</#if>
<#if ( rdb.database == "oracle" ) >
    <#if (gen.showComment==true)>
    // LENGTH ('中国') -- 2 ,字符显示的个数
    </#if>
    LENGTH(" LENGTH "),
</#if>
    ;

    private String code;

    private Func(String code) {
        this.code = code;
    }

    public String code() {
        return this.code;
    }
}
