package cn.zhsit.orm.helpers;

import cn.zhsit.models.Manager;
import cn.zhsit.models.PO;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20.
 */
@Component
public class ManagerHelper extends BaseHelper {

    public Manager create(PO entity) {
        Manager o = new Manager();
        addClassNameInfo(o, entity);
        return o;
    }

    private void addClassNameInfo(Manager o, PO entity) {
        o.setClassName("Gen"+entityName(entity) + gen.getManagerPostfix());
        o.setPo(entity);
    }



}
