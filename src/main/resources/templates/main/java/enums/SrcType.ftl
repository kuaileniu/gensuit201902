package ${gen.enumPackage?replace("/",".")};

/**
 * 资源类型
 */
public enum SrcType {
    //passport页logo
    passport_logo("passport_logo"),

    //passport页描述
    passport_desc("desc"),

    //登录Title
    passport_title("passport_title"),
    ;
     
    private String code;

    private SrcType(String code) {
        this.code = code;
    }


    public static SrcType of(String code) {
        for (SrcType srcType : SrcType.values()) {
            if(srcType.code.equals(code)){
                return srcType;
            }
        }
        return null;
    }

    public static SrcType nameOf(String name) {
        for (SrcType srcType : SrcType.values()) {
            if (srcType.name().equals(name)) {
                return srcType;
            }
        }
        return null;
    }

    public String code() {
        return this.code;
    }
}