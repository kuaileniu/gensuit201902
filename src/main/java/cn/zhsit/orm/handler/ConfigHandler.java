package cn.zhsit.orm.handler;

import cn.zhsit.configs.Gen;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.ConfigObject;
import cn.zhsit.models.SolidObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;

/**
 * Created by Administrator on 2018/3/20.
 */
@Component
@Scope("prototype")
public class ConfigHandler extends BaseHandler<ConfigObject> {
    @Autowired
    Gen gen;

    @Override
    public ConfigHandler setInfo(ConfigObject anObject) {
        this.ftlName = anObject.getFtlName();
        if (ftlName == null) {
            throw new RuntimeException("未设置 " + anObject.getConfigName() + " 对应的模板");
        }
        this.info = anObject;
        this.savePath = genPath.getServerPath(anObject.getPath())  + File.separator + anObject.getConfigName();
        return this;
    }

    @Override
    public void compileParams(ConfigObject anObject) {
//        this.param.put(GenConstants.packageStr, gen.getAnnotationPackage().replaceAll("/", "."));
    }
}
