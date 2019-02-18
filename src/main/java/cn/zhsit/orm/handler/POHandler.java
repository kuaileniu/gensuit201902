package cn.zhsit.orm.handler;

import cn.zhsit.configs.Gen;
import cn.zhsit.configs.GenPath;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.PO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import javax.annotation.Generated;
import java.io.File;

@Component
@Scope("prototype")
public class POHandler extends BaseHandler<PO> {

    @Autowired
    Gen gen;

    @Override
    public POHandler setInfo(PO po) {
        this.ftlName = GenConstants.PO_FTL;
        this.info = po;
        this.savePath = genPath.getMainJavaPackage(gen.poPackage) + File.separator + po.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    public void compileParams(PO info) {
        this.param.put(GenConstants.packageStr, gen.poPackage.replaceAll("/", "."));
    }
}
