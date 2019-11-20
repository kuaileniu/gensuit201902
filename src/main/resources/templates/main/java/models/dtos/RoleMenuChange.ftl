package ${gen.dtoPackage?replace("/",".")};

import java.io.Serializable;

public class RoleMenuChange implements Serializable {
    // 增加true；减false;
    private boolean add = true;
    // ID
    private String id;

    private String roleId;

    private String menuId;

    private String menuType;

    public boolean isAdd() {
        return add;
    }

    public RoleMenuChange setAdd(boolean add) {
        this.add = add;
        return this;
    }

    public String getId() {
        return id;
    }

    public RoleMenuChange setId(String id) {
        this.id = id;
        return this;
    }

    public String getRoleId() {
        return roleId;
    }

    public RoleMenuChange setRoleId(String roleId) {
        this.roleId = roleId;
        return this;
    }

    public String getMenuId() {
        return menuId;
    }

    public RoleMenuChange setMenuId(String menuId) {
        this.menuId = menuId;
        return this;
    }

    public String getMenuType() {
        return menuType;
    }

    public RoleMenuChange setMenuType(String menuType) {
        this.menuType = menuType;
        return this;
    }
}