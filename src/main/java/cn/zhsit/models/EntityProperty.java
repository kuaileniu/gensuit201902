package cn.zhsit.models;


public class EntityProperty extends EntityPropertyBase{
//  * 姓名[![Rong([{"same":"t_user.name=t_order.user_name","key":"t_user.id=t_order.user_id"}])]!]

    /**
     * "key":"t_user.id=t_order.user_id"
     * 原entity(id所在的表（即t_user）对应的Entity)的名称，不含poPostfix 部分
     */
    private String sourceKeyEntity;

    /**
     * "key":"t_user.id=t_order.user_id"
     * 目标entity(user_id所在的表（即t_order表）对应的Entity)的名称，不含poPostfix 部分
     */
    private String targetKeyEntity;

    /**
     * 冗余字段的源表的名称
     * 例："same":"t_user.name=t_order.user_name",
     * t_user对应的Entity的名称
     */
    private String sourceSameEntity;

    /**
     * 冗余字段的目标表的名称
     * 例："same":"t_user.name=t_order.user_name",
     * t_order对应的Entity的名称
     */
    private String targetSameEntity;

    /**
     * "key":"t_user.id=t_order.user_id"
     * 原entity的PO中的id对应的java property 名称
     */
    private String sourceKeyProperty;

    /**
     * "key":"t_user.id=t_order.user_id"
     * 目标entity的PO中的user_id对应的java property 名称
     */
    private String targetKeyProperty;

    /**
     * "same":"t_user.name=t_order.user_name"
     * 原entity的PO中的name对应的java property 名称
     */
    private String sourceSameProperty;

    /**
     * "same":"t_user.name=t_order.user_name"
     * 目标entity的PO中的user_name对应的java property 名称
     */
    private String targetSameProperty;

    public String getSourceKeyEntity() {
        return sourceKeyEntity;
    }

    public EntityProperty setSourceKeyEntity(String sourceKeyEntity) {
        this.sourceKeyEntity = sourceKeyEntity;
        return this;
    }

    public String getTargetKeyEntity() {
        return targetKeyEntity;
    }

    public EntityProperty setTargetKeyEntity(String targetKeyEntity) {
        this.targetKeyEntity = targetKeyEntity;
        return this;
    }

    public String getSourceSameEntity() {
        return sourceSameEntity;
    }

    public EntityProperty setSourceSameEntity(String sourceSameEntity) {
        this.sourceSameEntity = sourceSameEntity;
        return this;
    }

    public String getTargetSameEntity() {
        return targetSameEntity;
    }

    public EntityProperty setTargetSameEntity(String targetSameEntity) {
        this.targetSameEntity = targetSameEntity;
        return this;
    }

    public String getSourceKeyProperty() {
        return sourceKeyProperty;
    }

    public EntityProperty setSourceKeyProperty(String sourceKeyProperty) {
        this.sourceKeyProperty = sourceKeyProperty;
        return this;
    }

    public String getTargetKeyProperty() {
        return targetKeyProperty;
    }

    public EntityProperty setTargetKeyProperty(String targetKeyProperty) {
        this.targetKeyProperty = targetKeyProperty;
        return this;
    }

    public String getSourceSameProperty() {
        return sourceSameProperty;
    }

    public EntityProperty setSourceSameProperty(String sourceSameProperty) {
        this.sourceSameProperty = sourceSameProperty;
        return this;
    }

    public String getTargetSameProperty() {
        return targetSameProperty;
    }

    public EntityProperty setTargetSameProperty(String targetSameProperty) {
        this.targetSameProperty = targetSameProperty;
        return this;
    }
}

