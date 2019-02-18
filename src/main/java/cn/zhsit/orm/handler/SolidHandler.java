package cn.zhsit.orm.handler;

import cn.zhsit.configs.Gen;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.enums.FileType;
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
public class SolidHandler extends BaseHandler<SolidObject> {
    @Autowired
    Gen gen;

    @Override
    public SolidHandler setInfo(SolidObject anObject) {
        this.ftlName = anObject.getFtlName();
        if (ftlName == null) {
            throw new RuntimeException("未设置" + anObject.getClassName() + "类[" + anObject.getClassName() + "]对应的模板");
        }
        this.info = anObject;
        this.savePath = genPath.getMainJavaPackage(anObject.getPackageStr()) + File.separator + anObject.getClassName() + GenConstants.JAVA_POSTFIX;
        switch (anObject.getFileType()) {
            case MavenMainJava:
                this.savePath = genPath.getMainJavaPackage(anObject.getPackageStr()) + File.separator + anObject.getClassName() + GenConstants.JAVA_POSTFIX;
                break;
            case MavenTestJava:
                this.savePath = genPath.getTestJavaPackage(anObject.getPackageStr()) + File.separator + anObject.getClassName() + GenConstants.JAVA_POSTFIX;
                break;
        }
        return this;
    }

    @Override
    public void compileParams(SolidObject anObject) {
//        this.param.put(GenConstants.packageStr, gen.getAnnotationPackage().replaceAll("/", "."));
    }
}
