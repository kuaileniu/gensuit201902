package cn.zhsit.orm.helpers;

import cn.zhsit.models.PO;
import cn.zhsit.models.Service;
import cn.zhsit.models.ServiceImpl;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/3/20.
 */
@Component
public class ServiceImplHelper extends BaseHelper {

    public ServiceImpl create(PO entity) {
        ServiceImpl o = new ServiceImpl();
        addClassNameInfo(o, entity);
        return o;
    }

    private void addClassNameInfo(ServiceImpl o, PO entity) {
        o.setClassName("Gen"+entityName(entity) + gen.getServiceImplPostfix());
        o.setPo(entity);
    }



}
