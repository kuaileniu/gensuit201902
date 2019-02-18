package cn.zhsit.orm.handler;

import cn.zhsit.configs.Cache;
import cn.zhsit.configs.Gen;
import cn.zhsit.configs.GenPath;
import cn.zhsit.configs.RDB;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.ClassBase;
import cn.zhsit.models.PO;
import cn.zhsit.orm.JavaCollection;
import cn.zhsit.utils.FreeMarkerUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;

/**
 * Created by Administrator on 2018/3/19.
 */
public abstract class BaseHandler<T> implements Serializable {
    @Autowired
    Gen gen;
    @Autowired
    GenPath genPath;
    @Autowired
    RDB rdb;
    @Autowired
    Cache cache;
    @Autowired
    JavaCollection javaCollection;

    //模板名称
    protected String ftlName;
    //    对象类，例如PO
    protected T info;
    //生成的文件存储路径，例如java文件，yml文件
    protected String savePath;
//    protected Map<String, String> param = new HashMap<String, String>();
    protected Map<String, Object> param = new HashMap<String, Object>();

    public abstract BaseHandler setInfo(T t);

    /**
     * 生成文件
     */
    public void execute() throws Exception {
        addCommonParam();
        String data = FreeMarkerUtil.getProcessValue(param, ftlName);
        saveToFile(data);
    }

    /**
     * 设置一些公共的参数.
     */
    private void addCommonParam() {
        ClassBase classBase= ((ClassBase)info);

        this.param.put("AuthoritySeparator", GenConstants.AuthoritySeparator);
        this.param.put(GenConstants.className, classBase.getClassName());
        this.param.put(GenConstants.classRemark, classBase.getClassRemark());

//        this.param.put(GenConstants.AAnnotationMap, javaCollection.AAnnotationMap);
        this.param.put(GenConstants.allAnnotationPO, javaCollection.getAllAnnotationPO());
        this.param.put(GenConstants.objectPropertyJavaTypeMap, classBase.getObjectPropertyJavaTypeMap());
        this.param.put(GenConstants.propertyRemarkMap, classBase.getPropertyRemarkMap());
        this.param.put(GenConstants.info, classBase);
        this.param.put(GenConstants.entityName, entityName(classBase.getPo()));
        this.param.put(GenConstants.gen, gen);
        this.param.put(GenConstants.rdb, rdb);
        this.param.put(GenConstants.cache, cache);
        this.param.put(GenConstants.order, GenConstants.enum_order);
//        this.param.put(GenConstants.comparative, GenConstants.enum_comparative);
        this.param.put(GenConstants.WhereRelate, GenConstants.enum_WhereRelate);
        this.param.put(GenConstants.allPO, javaCollection.findAllPO());
        this.param.put(GenConstants.allManager, javaCollection.findAllManager());
        this.param.put(GenConstants.allService, javaCollection.findAllService());
        this.param.put(GenConstants.allController, javaCollection.findAllController());
        this.param.put(GenConstants.javaCollection, javaCollection);


        Set<String> imports = classBase.getImports();
        List<String> importList=new ArrayList();
        for (String anImport : imports) {
            if(anImport.startsWith("java.lang.")){
                continue;
            }
            importList.add(anImport);
        }
        this.param.put(GenConstants.importList,importList);
        compileParams(info);
    }

    /**
     * 组装参数,留给子类重载实现，子类的参数设置优先级高，将覆盖父类设置的同名参数
     */
    protected abstract void compileParams(T info);


    /**
     * 将文件持久化
     *
     * @param data
     * @throws IOException
     */
    private void saveToFile(String data) throws IOException {
        String pathName =  savePath;
        File file = new File(pathName);
        boolean append = false;
        FileUtils.writeStringToFile(file, data, GenConstants.UTF8, append);
    }

    private String entityName(PO po) {
        if(po==null){
            return "";
        }
        String entityName = gen.tableEntity.get(po.getTableName());
        return entityName;
    }
}
