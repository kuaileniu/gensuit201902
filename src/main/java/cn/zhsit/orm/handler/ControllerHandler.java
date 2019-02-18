package cn.zhsit.orm.handler;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Controller;
import cn.zhsit.models.ServiceImpl;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
@Scope("prototype")
public class ControllerHandler extends BaseHandler<Controller> {

    @Override
    public ControllerHandler setInfo(Controller entity) {
        this.ftlName = GenConstants.CONTROLLER_FTL;
        this.info = entity;
        this.savePath = genPath.getMainJavaPackage(gen.getControllerPackage()) + File.separator + entity.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    protected void compileParams(Controller info) {
//        this.param.put(GenConstants.packageStr, gen.getManagerPackage().replaceAll("/","."));
    }
}
