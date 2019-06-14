package ${gen.enumPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * 用户类型
 */
</#if>
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
