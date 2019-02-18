package cn.zhsit.orm.helpers;

import cn.zhsit.models.Manager;
import cn.zhsit.models.ManagerImpl;
import cn.zhsit.models.PO;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20.
 */
@Component
public class ManagerImplHelper extends BaseHelper {
    public ManagerImpl create(PO entity) {
        ManagerImpl o = new ManagerImpl();
        addClassNameInfo(o, entity);
        addImportsInfo(o, entity);
        return o;
    }

    private void addClassNameInfo(ManagerImpl o, PO entity) {
        o.setClassName("Gen"+entityName(entity) + gen.getManagerImplPostfix());
        o.setPo(entity);
    }

    public void addImportsInfo(ManagerImpl o, PO entity) {
    }

}
