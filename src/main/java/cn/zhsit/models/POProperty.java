package cn.zhsit.models;

import java.util.ArrayList;
import java.util.List;

/**
 * 注解（annotationName）下的PO与属性关系
 */
public class POProperty {
    //是否是根
    private boolean root = false;
    private PO po;
    //属性名称
    private String property;
    //属性类型
    private String propertyType;
    //注解名称
    private String annotationName;
    //注解中的值 ,例[![Rong(t.col,t2.col)]!] 中的t.col,t2.col
    private String value;
    private List<EntityProperty> entityProperty = new ArrayList<>();

    public List<EntityProperty> getEntityProperty() {
        return entityProperty;
    }

    public POProperty addEntityProperty(EntityProperty ep) {
        entityProperty.add(ep);
        return this;
    }

    public boolean isRoot() {
        return root;
    }

    public void setRoot(boolean root) {
        this.root = root;
    }

    public PO getPo() {
        return po;
    }

    public void setPo(PO po) {
        this.po = po;
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getPropertyType() {
        return propertyType;
    }

    public POProperty setPropertyType(String propertyType) {
        this.propertyType = propertyType;
        return this;
    }

    public String getAnnotationName() {
        return annotationName;
    }

    public void setAnnotationName(String annotationName) {
        this.annotationName = annotationName;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
