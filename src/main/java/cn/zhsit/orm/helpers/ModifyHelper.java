package cn.zhsit.orm.helpers;


import cn.zhsit.models.Modify;
import cn.zhsit.models.PO;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class ModifyHelper extends BaseHelper {



    public Modify createModify(PO po) {
        Modify modify = new Modify();
        addClassNameInfo(modify, po);
        addPackageInfo(modify);
        addClassRemarkInfo(modify);
        addImportsInfo(modify);
        return modify;
    }

    private void addClassNameInfo(Modify modify, PO po) {
        modify.setClassName(entityName(po) + gen.modifyPostfix);
        modify.setPo(po);
    }

    private void addPackageInfo(Modify modify) {
        String pa = gen.modifyPackage.replaceAll("/", ".");
        modify.setPackageStr(pa);
    }

    public void addClassRemarkInfo(Modify modify) {
        PO po = modify.getPo();
        modify.setClassRemark(po.getClassRemark() + "持久化更新参数类");
    }

    public void addImportsInfo(Modify modify) {
        modify.addImport(List.class.getName());
        modify.addImport(ArrayList.class.getName());
        modify.addImport(StringBuilder.class.getName());
        String pa = gen.modifyPackage.replaceAll("/", ".");
    }
}
