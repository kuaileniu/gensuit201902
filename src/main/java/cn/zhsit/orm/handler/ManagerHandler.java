package cn.zhsit.orm.handler;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Manager;
import cn.zhsit.models.Mapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
@Scope("prototype")
public class ManagerHandler extends BaseHandler<Manager> {
    @Override
    public ManagerHandler setInfo(Manager entity) {
        this.ftlName = GenConstants.MANAGER_FTL;
        this.info = entity;
        this.savePath = genPath.getMainJavaPackage(gen.getManagerPackage()) + File.separator + entity.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    protected void compileParams(Manager info) {
//        this.param.put(GenConstants.packageStr, gen.getManagerPackage().replaceAll("/","."));
    }
}
