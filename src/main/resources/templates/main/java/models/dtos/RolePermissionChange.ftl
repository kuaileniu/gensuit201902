package ${gen.dtoPackage?replace("/",".")};

import java.io.Serializable;

public class RolePermissionChange implements Serializable {
    // 增加true；减false;
    private boolean add = true;
    private String id;

    private String roleId;

    private String code;

    public boolean isAdd() {
        return add;
    }

    public RolePermissionChange setAdd(boolean add) {
        this.add = add;
        return this;
    }

    public String getId() {
        return id;
    }

    public RolePermissionChange setId(String id) {
        this.id = id;
        return this;
    }

    public String getRoleId() {
        return roleId;
    }

    public RolePermissionChange setRoleId(String roleId) {
        this.roleId = roleId;
        return this;
    }

    public String getCode() {
        return code;
    }

    public RolePermissionChange setCode(String code) {
        this.code = code;
        return this;
    }
}
