package ${gen.dtoPackage?replace("/",".")};

import java.io.Serializable;

public class StaffRoleChange implements Serializable {
//    private StaffRole po;
    // 增加true；减false;
    private boolean add = true;
    // ID
    private String id;

    //
    private String staffId;

    //
    private String roleId;

    //
    private String groupCode;

    public boolean isAdd() {
        return add;
    }

    public StaffRoleChange setAdd(boolean add) {
        this.add = add;
        return this;
    }

    public String getId() {
        return id;
    }

    public StaffRoleChange setId(String id) {
        this.id = id;
        return this;
    }

    public String getStaffId() {
        return staffId;
    }

    public StaffRoleChange setStaffId(String staffId) {
        this.staffId = staffId;
        return this;
    }

    public String getRoleId() {
        return roleId;
    }

    public StaffRoleChange setRoleId(String roleId) {
        this.roleId = roleId;
        return this;
    }

    public String getGroupCode() {
        return groupCode;
    }

    public StaffRoleChange setGroupCode(String groupCode) {
        this.groupCode = groupCode;
        return this;
    }
}