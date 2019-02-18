package ${gen.enumPackage?replace("/",".")};

/**
 * 比较枚举
 */
public enum Comparative {
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
    Like(" LIKE "),
    NotLike(" NOT LIKE ");

    private String code;

    private Comparative(String code) {
        this.code = code;
    }

    public String code() {
        return this.code;
    }
}
