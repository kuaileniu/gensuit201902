package cn.zhsit.orm.handler;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Manager;
import cn.zhsit.models.Service;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
@Scope("prototype")
public class ServiceHandler extends BaseHandler<Service> {
    @Override
    public ServiceHandler setInfo(Service entity) {
        this.ftlName = GenConstants.SERVICE_FTL;
        this.info = entity;
        this.savePath = genPath.getMainJavaPackage(gen.getServicePackage()) + File.separator + entity.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    protected void compileParams(Service info) {
//        this.param.put(GenConstants.packageStr, gen.getManagerPackage().replaceAll("/","."));
    }
}
