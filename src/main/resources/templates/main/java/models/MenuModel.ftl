package ${gen.modelPackage?replace("/",".")};

<#if (gen.showComment==true)>
/**
 * 菜单项
 */
</#if>
public class MenuModel {

<#if (gen.showComment==true)>
    /**
     * 菜单名称
     */
</#if>
    private String showChars;

<#if (gen.showComment==true)>
    /**
     * 权限名称
     */
</#if>
    private String authorityName;
    public String getShowChars() {
        return showChars;
    }

    public MenuModel setShowChars(String showChars) {
        this.showChars = showChars;
        return this;
    }

    public String getAuthorityName() {
        return authorityName;
    }

    public MenuModel setAuthorityName(String authorityName) {
        this.authorityName = authorityName;
        return this;
    }

}
