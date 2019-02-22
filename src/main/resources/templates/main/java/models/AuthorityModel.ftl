package ${gen.modelPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * 权限项
 */
</#if>
public class AuthorityModel{

<#if (gen.showComment==true)>
    //访问相对路径
</#if>
    private String url;

<#if (gen.showComment==true)>
    //权限码
</#if>
    private String code;

<#if (gen.showComment==true)>
    //描述
</#if>
    private String descr;

<#if (gen.showComment==true)>
    // 权限类型:1.纯权限点;2菜单
</#if>
    private Byte authorityType;

<#if (gen.showComment==true)>
    /**
     * 权限组:系统设置权限组等等，通过枚举类统一定义
     */
</#if>
    private String authorityGroup;

    public String getUrl() {
        return url;
    }

    public AuthorityModel setUrl(String url) {
        this.url = url;
        return this;
    }

    public String getCode() {
        return code;
    }

    public AuthorityModel setCode(String code) {
        this.code = code;
        return this;
    }

    public String getDescr() {
        return descr;
    }

    public AuthorityModel setDescr(String descr) {
        this.descr = descr;
        return this;
    }

    public Byte getAuthorityType() {
        return authorityType;
    }

    public AuthorityModel setAuthorityType(Byte authorityType) {
        this.authorityType = authorityType;
        return this;
    }

    public String getAuthorityGroup() {
        return authorityGroup;
    }

    public AuthorityModel setAuthorityGroup(String authorityGroup) {
        this.authorityGroup = authorityGroup;
        return this;
    }
}
