package ${gen.enumPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * DFS组
 */
</#if>
public enum DFSGroupEnum {
    publicFile("publicfile"),
    privateFile("privatefile");
    private String code;

    private DFSGroupEnum(String code) {
        this.code = code;
    }

    public String code() {
        return code;
    }
}