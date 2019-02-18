package cn.zhsit.orm.helpers;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.Mapper;
import cn.zhsit.models.PO;
import cn.zhsit.models.Provider;
import cn.zhsit.models.Query;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/3/20.
 */
@Component
public class MapperHelper extends BaseHelper {
    public MapperHelper() {
    }


    public Mapper createMapper(PO po) {
        Mapper mapper = new Mapper();
        addClassNameInfo(mapper, po);
        addPackageInfo(mapper, po);
        addClassRemarkInfo(mapper, po);
        addImportsInfo(mapper,po);
        return mapper;
    }

    private void addClassNameInfo(Mapper mapper, PO po) {
        mapper.setClassName(entityName(po) + gen.mapperPostfix);
        mapper.setPo(po);
    }

    /**
     * 添加类package
     *
     * @param mapper
     * @param po
     */
    private void addPackageInfo(Mapper mapper, PO po) {
        String path = gen.mapperPostfix.replaceAll("/", ".");
        mapper.setPackageStr(path);
    }

    /**
     * 添加类注释
     *
     * @param mapper
     */
    private void addClassRemarkInfo(Mapper mapper, PO po) {
        mapper.setClassRemark(po.getClassRemark() + " 持久化查询类");
    }

    public void addImportsInfo(Mapper mapper,PO po) {
//        mapper.addImport(List.class.getName());

    }
}
