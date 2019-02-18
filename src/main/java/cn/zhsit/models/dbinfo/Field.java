package cn.zhsit.models.dbinfo;

/**
 * Created by Administrator on 2017/11/7.
 */
public class Field {
    /**
     * 表名
     */
    private String tableName;
    /**
     * 字段名称
     */
    private String name;
    /**
     * 数据类型
     */
    private String type;
    /**
     * 注释
     */
    private String comment;
    /**
     * 是否是主键
     */
    private boolean isKey;
    /**
     * 是否可为空
     */
    private boolean nullable=true;

    /**
     * 类型为字符串时，字段长度
     * Decimal时 整体长度
     */
    private int size;
    /**
     * 小数点后的长度
     */
    private int digits;
    /**
     * 此字段在表中的位置 index
     */
    private int seq;

    public String getName() {
        return name;
    }

    public Field setName(String name) {
        this.name = name;
        return this;
    }

    public String getType() {
        return type;
    }

    public Field setType(String type) {
        this.type = type;
        return this;
    }

    public String getComment() {
        return comment;
    }

    public Field setComment(String comment) {
        this.comment = comment;
        return this;
    }

    public String getTableName() {
        return tableName;
    }

    public Field setTableName(String tableName) {
        this.tableName = tableName;
        return this;
    }

    public boolean isKey() {
        return isKey;
    }

    public Field setKey(boolean key) {
        isKey = key;
        return this;
    }

    public boolean isNullable() {
        return nullable;
    }

    public Field setNullable(boolean nullable) {
        this.nullable = nullable;
        return this;
    }

    public int getSize() {
        return size;
    }

    public Field setSize(int size) {
        this.size = size;
        return this;
    }

    public int getDigits() {
        return digits;
    }

    public Field setDigits(int digits) {
        this.digits = digits;
        return this;
    }

    public int getSeq() {
        return seq;
    }

    public Field setSeq(int seq) {
        this.seq = seq;
        return this;
    }

    @Override
    public String toString() {
        return "Field{" +
                "tableName='" + tableName + '\'' +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", comment='" + comment + '\'' +
                ", isKey=" + isKey +
                ", nullable=" + nullable +
                ", size=" + size +
                ", digits=" + digits +
                ", seq=" + seq +
                '}';
    }
}
