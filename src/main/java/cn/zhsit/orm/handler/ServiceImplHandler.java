package cn.zhsit.orm.handler;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Service;
import cn.zhsit.models.ServiceImpl;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
@Scope("prototype")
public class ServiceImplHandler extends BaseHandler<ServiceImpl> {

    @Override
    public ServiceImplHandler setInfo(ServiceImpl entity) {
        this.ftlName = GenConstants.SERVICE_IMPL_FTL;
        this.info = entity;
        this.savePath = genPath.getMainJavaPackage(gen.getServiceImplPackage()) + File.separator + entity.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    protected void compileParams(ServiceImpl info) {
//        this.param.put(GenConstants.packageStr, gen.getManagerPackage().replaceAll("/","."));
    }
}
