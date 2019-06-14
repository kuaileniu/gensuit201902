package ${gen.enumPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * 资源类型
 */
</#if>
public enum SrcType {
<#if (gen.showComment==true)>
    //passport页logo
</#if>
    passport_logo("passport_logo"),
<#if (gen.showComment==true)>
    //passport页描述
</#if>
    passport_desc("desc"),
<#if (gen.showComment==true)>
    //登录Title
</#if>
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