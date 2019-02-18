package cn.zhsit.orm.handler;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Manager;
import cn.zhsit.models.ManagerImpl;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
@Scope("prototype")
public class ManagerImplHandler extends BaseHandler<ManagerImpl> {
    @Override
    public ManagerImplHandler setInfo(ManagerImpl entity) {
        this.ftlName = GenConstants.MANAGER_IMPL_FTL;
        this.info = entity;
        this.savePath = genPath.getMainJavaPackage(gen.getManagerImplPackage()) + File.separator + entity.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    protected void compileParams(ManagerImpl info) {
//        this.param.put(GenConstants.packageStr, gen.getManagerPackage().replaceAll("/","."));
    }
}
