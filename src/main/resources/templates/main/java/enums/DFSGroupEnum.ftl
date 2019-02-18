package ${gen.enumPackage?replace("/",".")};

/**
 * DFS组
 */
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