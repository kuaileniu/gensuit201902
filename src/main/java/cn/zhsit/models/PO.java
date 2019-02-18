package cn.zhsit.models;

import cn.zhsit.models.dbinfo.Table;

import java.util.*;

/**
 * Created by Administrator on 2018/3/19.
 */
public class PO extends ClassBase {
    /**
     * 对应的数据库表
     */
    private Table table;
    /**
     * 表名-英文名称
     */
    private String tableName;
    // 主键列表，可能会是联合主键
    // Map<("userName", "String")>
    // Map<主键对应的java属性，java属性的类型>
    private List<Map<String, String>> keyList = new ArrayList<>();

    /**
     * java类属性名，数据库字段名
     * <userName,user_name>
     */
    private Map<String, String> javaPropDbColumn = new LinkedHashMap<>();

    public String getTableName() {
        return tableName;
    }

    public PO setTableName(String tableName) {
        this.tableName = tableName;
        return this;
    }

    /**
     * 通过 数据库表字段查询对应的java类属性名称
     * @param field
     * @return
     */
    public String getPropertyByTableField(String field) {
        Iterator<String> propIts = javaPropDbColumn.keySet().iterator();
        while (propIts.hasNext()){
            String prop = propIts.next();
            String val =javaPropDbColumn.get(prop);
            if(val.equals(field)){
                return prop;
            }
        }
        return null;
    }

    public PO addKey(String propertyName, String propertyType) {
        HashMap property = new HashMap<String, String>();
        property.put(propertyName, propertyType);
        keyList.add(property);
        return this;
    }

    public List<Map<String, String>> getKeyList() {
        return keyList;
    }

    public PO addJavaPropDbColumn(String prop, String dbColumn) {
        this.javaPropDbColumn.put(prop, dbColumn);
        return this;
    }

    public Map<String, String> getJavaPropDbColumn() {
        return javaPropDbColumn;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }

    @Override
    public String toString() {
        return "PO{" +
                "tableName='" + tableName + '\'' +
                ", keyList=" + keyList +
                ", javaPropDbColumn=" + javaPropDbColumn +
                '}';
    }
}
