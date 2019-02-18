package cn.zhsit.orm.helpers;

import cn.zhsit.models.Manager;
import cn.zhsit.models.PO;
import cn.zhsit.models.Service;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/3/20.
 */
@Component
public class ServiceHelper extends BaseHelper {

    public Service create(PO entity) {
        Service o = new Service();
        addClassNameInfo(o, entity);

        return o;
    }

    private void addClassNameInfo(Service o, PO entity) {
        o.setClassName("Gen"+entityName(entity) + gen.getServicePostfix());
        o.setPo(entity);
    }



}
