package cn.zhsit.models;


public class EntityPropertyBase {
    //目标
    private String targetProperty;
    //源
    private String sourceProperty;

    public String getTargetProperty() {
        return targetProperty;
    }

    public EntityPropertyBase setTargetProperty(String targetProperty) {
        this.targetProperty = targetProperty;
        return this;
    }

    public String getSourceProperty() {
        return sourceProperty;
    }

    public EntityPropertyBase setSourceProperty(String sourceProperty) {
        this.sourceProperty = sourceProperty;
        return this;
    }
}

