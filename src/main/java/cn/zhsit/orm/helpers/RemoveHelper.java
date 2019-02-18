package cn.zhsit.orm.helpers;


import cn.zhsit.models.PO;
import cn.zhsit.models.Remove;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RemoveHelper extends BaseHelper {

    public Remove createRemove(PO po) {
        Remove remove = new Remove();
        addClassNameInfo(remove, po);
        addPackageInfo(remove);
        addClassRemarkInfo(remove);
        addImportsInfo(remove);
        return remove;
    }

    private void addClassNameInfo(Remove delete, PO po) {
        delete.setClassName(entityName(po) + gen.removePostfix);
        delete.setPo(po);
    }

    private void addPackageInfo(Remove delete) {
        String pa = gen.removePackage.replaceAll("/", ".");
        delete.setPackageStr(pa);
    }

    public void addClassRemarkInfo(Remove delete) {
        PO po = delete.getPo();
        delete.setClassRemark(po.getClassRemark() + "持久化删除参数类");
    }

    public void addImportsInfo(Remove delete) {
        delete.addImport(List.class.getName());
        delete.addImport(ArrayList.class.getName());
        delete.addImport(StringBuilder.class.getName());
        String pa = gen.removePackage.replaceAll("/", ".");
    }
}
