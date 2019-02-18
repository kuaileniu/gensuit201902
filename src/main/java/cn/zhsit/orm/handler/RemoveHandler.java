package cn.zhsit.orm.handler;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Remove;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;


@Component
@Scope("prototype")
public class RemoveHandler extends BaseHandler<Remove> {


    @Override
    public RemoveHandler setInfo(Remove remove) {
        this.ftlName = GenConstants.REMOVE_FTL;
        this.info = remove;
        this.savePath = genPath.getMainJavaPackage(gen.removePackage) + File.separator + remove.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    public void compileParams(Remove remove) {
        this.param.put(GenConstants.packageStr, gen.removePackage.replaceAll("/", "."));
    }
}
