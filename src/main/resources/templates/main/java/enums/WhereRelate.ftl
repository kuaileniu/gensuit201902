package ${gen.enumPackage?replace("/",".")};

/**
 * SQL中Where内的关联关系枚举
 */
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
    // LIKE "%a%"
    Like(" LIKE "),
    // LIKE "%a"
    LeftLike(" LIKE "),
    // LIKE "a%"
    RightLike(" LIKE "),
    // NOT LIKE "%a%"
    NotLike(" NOT LIKE "),
    // NOT LIKE "%a"
    LeftNotLike(" NOT LIKE "),
    // NOT LIKE "a%"
    RightNotLike(" NOT LIKE ");

    private String code;

    private WhereRelate(String code) {
        this.code = code;
    }

    public String code() {
        return this.code;
    }
}
