package cn.zhsit.orm.handler;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Mapper;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;

@Component
@Scope("prototype")
public class MapperHandler extends BaseHandler<Mapper> {
    @Override
    public MapperHandler setInfo(Mapper mapper) {
        this.ftlName = GenConstants.MAPPER_FTL;
        this.info = mapper;
        this.savePath = genPath.getMainJavaPackage(gen.mapperPackage) + File.separator + mapper.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    protected void compileParams(Mapper info) {
        this.param.put(GenConstants.packageStr, gen.mapperPackage.replaceAll("/", "."));
    }
}
