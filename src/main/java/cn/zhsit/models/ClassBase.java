package cn.zhsit.models;

import cn.zhsit.enums.FileType;

import java.util.*;

/**
 * Created by Administrator on 2018/3/19.
 */
public abstract class ClassBase {
    private FileType fileType;
    /**
     * po包名
     */
    private String packageStr;

    /**
     * 需要导入的包
     */
    private Set<String> imports = new LinkedHashSet<>();

    /**
     * pos
     */
    private PO po;

    /**
     * PO之外的类名 例: 业务类名等，UserService
     */
    private String className;
    /**
     * User 无后缀之外的
     */
    private String entityName;
    /**
     * 模板路径，freemarker模板的路径
     */
    private String ftlName;

    /**
     * po类对应的注释
     */
    private String classRemark;

    /**
     * 属性名以及对应的类型
     * ("userName", "String");
     */
    private Map<String, String> objectPropertyJavaTypeMap = new LinkedHashMap<>();

    /**
     * 属性名以及注释的对应<userName,用户姓名>
     */
    private Map<String, String> propertyRemarkMap = new HashMap<>();


    public String getPackageStr() {
        return packageStr;
    }

    public ClassBase setPackageStr(String packageStr) {
        this.packageStr = packageStr;
        return this;
    }


    public ClassBase setClassName(String className) {
        this.className = className;
        return this;
    }


    public String getClassName() {
        return className;
    }

    public ClassBase setFtlName(String ftlName) {
        this.ftlName = ftlName;
        return this;
    }

    public String getFtlName() {
        return ftlName;
    }

    public String getClassRemark() {
        return classRemark;
    }

    public ClassBase setClassRemark(String classRemark) {
        this.classRemark = classRemark;
        return this;
    }

    public Set<String> getImports() {
        return imports;
    }

    public ClassBase addImport(String anImport) {
        if (anImport == null || anImport == "") {
        } else {
            imports.add(anImport);
        }
        return this;
    }


    public Map<String, String> getObjectPropertyJavaTypeMap() {
        return objectPropertyJavaTypeMap;
    }

    public ClassBase addObjectPropertyJavaTypeMap(String objectProperties, String javaType) {
        this.objectPropertyJavaTypeMap.put(objectProperties, javaType);
        return this;
    }

    public String getPropertyTypeByPropertyName(String propertyName) {
        return this.objectPropertyJavaTypeMap.get(propertyName);
    }

    public Map<String, String> getPropertyRemarkMap() {
        return propertyRemarkMap;
    }

    public ClassBase setPropertyRemarkMap(Map<String, String> propertyRemarkMap) {
        this.propertyRemarkMap = propertyRemarkMap;
        return this;
    }

    public ClassBase addPropertyRemark(String property, String remark) {
        this.propertyRemarkMap.put(property, remark);
        return this;
    }

    public PO getPo() {
        return po;
    }

    public void setPo(PO po) {
        this.po = po;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public FileType getFileType() {
        return fileType;
    }

    public ClassBase setFileType(FileType fileType) {
        this.fileType = fileType;
        return this;
    }
}
