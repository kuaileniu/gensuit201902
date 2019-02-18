package ${gen.modelPackage?replace("/",".")};


/**
 * 菜单项
 */
public class MenuModel {

    /**
     * 菜单名称
     */
    private String showChars;
    
    /**
     * 权限名称
     */
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
