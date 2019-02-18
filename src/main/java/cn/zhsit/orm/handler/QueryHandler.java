package cn.zhsit.orm.handler;

import cn.zhsit.configs.Gen;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.PO;
import cn.zhsit.models.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;


@Component
@Scope("prototype")
public class QueryHandler extends BaseHandler<Query> {
    @Autowired
    Gen gen;

    @Override
    public QueryHandler setInfo(Query query) {
        this.ftlName = GenConstants.QUERY_FTL;
        this.info = query;
        this.savePath =  genPath.getMainJavaPackage(gen.queryPackage)  + File.separator + query.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    public void compileParams(Query query) {
        this.param.put(GenConstants.packageStr, gen.queryPackage.replaceAll("/", "."));
    }
}
