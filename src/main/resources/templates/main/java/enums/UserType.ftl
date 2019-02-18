package ${gen.enumPackage?replace("/",".")};

/**
 * 用户类型
 */
public enum UserType {
    Customer("customer"),
    Staff("staff");
    private String code;

    private UserType(String code) {
        this.code=code;
    }

    public String code() {
        return code;
    }
}
