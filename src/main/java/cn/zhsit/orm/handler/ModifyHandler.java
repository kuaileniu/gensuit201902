package cn.zhsit.orm.handler;

import cn.zhsit.configs.Gen;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Modify;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;


@Component
@Scope("prototype")
public class ModifyHandler extends BaseHandler<Modify> {
    @Autowired
    Gen gen;

    @Override
    public ModifyHandler setInfo(Modify modify) {
        this.ftlName = GenConstants.MODIFY_FTL;
        this.info = modify;
        this.savePath = genPath.getMainJavaPackage( gen.modifyPackage) + File.separator + modify.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    public void compileParams(Modify modify) {
        this.param.put(GenConstants.packageStr, gen.modifyPackage.replaceAll("/", "."));
    }
}
