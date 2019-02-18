package cn.zhsit.orm.helpers;


import cn.zhsit.configs.Gen;
import cn.zhsit.models.Query;
import cn.zhsit.models.PO;
import cn.zhsit.orm.JavaCollection;
import cn.zhsit.orm.handler.BaseHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class QueryHelper  extends BaseHelper {



    public Query createQuery(PO po) {
        Query query = new Query();
        addClassNameInfo(query, po);
        addPackageInfo(query);
        addClassRemarkInfo(query);
        addImportsInfo(query);
        return query;
    }

    private void addClassNameInfo(Query query, PO po) {
        query.setClassName(entityName(po) + gen.queryPostfix);
        query.setPo(po);
    }

    private void addPackageInfo(Query query) {
        String pa = gen.queryPackage.replaceAll("/", ".");
        query.setPackageStr(pa);
    }

    public void addClassRemarkInfo(Query query) {
        PO po = query.getPo();
        query.setClassRemark(po.getClassRemark() + "持久化查询参数类");
    }

    public void addImportsInfo(Query query) {
        query.addImport(List.class.getName());
        query.addImport(ArrayList.class.getName());
        query.addImport(StringBuilder.class.getName());
//        query.addImport(Order.class.getName());
//        query.addImport(Comparative.class.getName());
        String pa = gen.queryPackage.replaceAll("/", ".");
//        query.addImport(pa + ".Order");
//        query.addImport(pa + ".Comparative");
    }
}
