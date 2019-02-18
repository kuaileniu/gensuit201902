package cn.zhsit.orm.helpers;

import cn.zhsit.models.Controller;
import cn.zhsit.models.PO;
import cn.zhsit.models.ServiceImpl;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/3/20.
 */
@Component
public class ControllerHelper extends BaseHelper {

    public Controller create(PO entity) {
        Controller o = new Controller();
        addClassNameInfo(o, entity);
        return o;
    }

    private void addClassNameInfo(Controller o, PO entity) {
        o.setClassName("Gen"+entityName(entity) + gen.getControllerPostfix());
        o.setPo(entity);
    }



}
