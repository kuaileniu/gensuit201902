package cn.zhsit.orm.helpers;

import cn.zhsit.configs.Gen;
import cn.zhsit.models.PO;
import cn.zhsit.models.Provider;
import cn.zhsit.models.dbinfo.Field;
import cn.zhsit.models.dbinfo.Table;
import cn.zhsit.typemap.Jdbc2JavaTypeMap;
import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20.
 */
@Component
public class ProviderHelper extends BaseHelper{

    public Provider createProvider(PO po) {
        Provider provider = new Provider();
        addClassNameInfo(provider, po);
        addPackageInfo(provider);
        addClassRemarkInfo(provider);
        addImportsInfo(provider);
        return provider;
    }

    private void addClassNameInfo(Provider provider, PO po) {
        provider.setClassName(entityName(po) + gen.providerPostfix);
        provider.setPo(po);

    }


    private void addPackageInfo(Provider provider) {
        String pa = gen.providerPackage.replaceAll("/", ".");
        provider.setPackageStr(pa);
    }

    private void addClassRemarkInfo(Provider provider) {
        provider.setClassRemark(provider.getClassRemark() + " 持久化相关Provider类");
    }

    private void addImportsInfo(Provider provider) {
//        Query query = JavaCollection.findQueryByPoName(provider.getPoClassName());

        provider.addImport(List.class.getName());
        provider.addImport(SQL.class.getName());
        provider.addImport(StringBuilder.class.getName());
        {
            String kage = gen.queryPackage.replaceAll("/", ".");
            provider.addImport(kage + "." + entityName(provider.getPo()) + gen.queryPostfix);
        }

//        provider.addImport(query.getPackageStr() + "." + query.getClassName());
////        provider.addImport(Order.class.getName());
////        provider.addImport(Comparative.class.getName());
//        provider.addImport(Constants.enumPackage+".Order");
//        provider.addImport(Constants.enumPackage+".Comparative");
    }
}
