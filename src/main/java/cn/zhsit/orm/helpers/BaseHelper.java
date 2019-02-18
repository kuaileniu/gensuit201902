package cn.zhsit.orm.helpers;

import cn.zhsit.configs.Gen;
import cn.zhsit.models.PO;
import cn.zhsit.orm.JavaCollection;
import cn.zhsit.rdb.DBCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2018/3/20.
 */
public class BaseHelper {
    @Autowired
    public Gen gen;
    @Autowired
    public JavaCollection javaCollection;
    @Autowired
    public DBCollection dbCollection;

    public String entityName(PO po) {
        String entityName = gen.tableEntity.get(po.getTableName());
        return entityName;
    }
}
