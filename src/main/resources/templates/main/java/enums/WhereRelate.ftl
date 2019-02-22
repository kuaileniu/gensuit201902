package ${gen.enumPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * SQL中Where内的关联关系枚举
 */
</#if>
public enum WhereRelate {
    Is(" IS "),
    Equal(" = "),
    NotEqual(" <> "),
    GreaterThan(" > "),
    GreaterThanOrEqualTo(" >= "),
    LessThan(" < "),
    LessThanOrEqualTo(" <= "),
    In(" IN "),
    NotIn(" NOT IN "),
    Between(" BETWEEN "),
    NotBetween(" NOT BETWEEN "),
    IsNull(" IS NULL "),
    IsNotNull(" IS NOT NULL "),
<#if (gen.showComment==true)>
    // LIKE "%a%"
</#if>
    Like(" LIKE "),
<#if (gen.showComment==true)>
    // LIKE "%a"
</#if>
    LeftLike(" LIKE "),
<#if (gen.showComment==true)>
    // LIKE "a%"
</#if>
    RightLike(" LIKE "),
<#if (gen.showComment==true)>
    // NOT LIKE "%a%"
</#if>
    NotLike(" NOT LIKE "),
<#if (gen.showComment==true)>
    // NOT LIKE "%a"
</#if>
    LeftNotLike(" NOT LIKE "),
<#if (gen.showComment==true)>
    // NOT LIKE "a%"
</#if>
    RightNotLike(" NOT LIKE ");

    private String code;

    private WhereRelate(String code) {
        this.code = code;
    }

    public String code() {
        return this.code;
    }
}
