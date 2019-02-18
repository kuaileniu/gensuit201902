package cn.zhsit.orm.handler;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Provider;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.io.File;


@Component
@Scope("prototype")
public class ProviderHandler extends BaseHandler<Provider>  {
    @Override
    public ProviderHandler setInfo(Provider provider) {
        this.ftlName = GenConstants.PROVIDER_FTL;
        this.info = provider;
        this.savePath = genPath.getMainJavaPackage( gen.providerPackage) + File.separator + provider.getClassName() + GenConstants.JAVA_POSTFIX;
        return this;
    }

    @Override
    protected void compileParams(Provider info) {
        this.param.put(GenConstants.packageStr, gen.providerPackage.replaceAll("/","."));
    }
}
