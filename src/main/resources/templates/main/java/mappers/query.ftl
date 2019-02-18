<#--package ${packageStr};-->
package ${gen.queryPackage?replace("/",".")};

import java.util.Set;
import java.util.List;
import java.util.ArrayList;
import org.apache.commons.lang3.ArrayUtils;

import ${gen.enumPackage?replace("/",".")}.${WhereRelate};
import ${gen.enumPackage?replace("/",".")}.${order};

/**
 * ${info.po.tableName} 的查询类
 * (${classRemark})
 */
public class ${className} {
<#-- 分页做拦截，分页 支持多类型数据库参考  org.activiti.engine.impl.db.DbSqlSessionFactory   5.x 版本的  https://github.com/Activiti/Activiti/blob/activiti-5.22.0/modules/activiti-engine/src/main/java/org/activiti/engine/impl/db/DbSqlSessionFactory.java-->
    /**
     * 表名
     */
    public static final String TABLE_NAME = "${info.po.tableName}";

    /**
     * 是否去重
     */
    private boolean distinct = false;

    /**
     * 每页数据集合数
     */
    private Integer maxResults = null;

    /**
     * 第一条数据起始位置
     */
    private Integer firstResult = null;


    /**
     * 字段枚举
     */
    public enum COLUMN {
    <#list info.po.javaPropDbColumn?keys as key>
        ${key}("${info.po.javaPropDbColumn[key]}"),
    </#list>
        ;
        /**
        * 数据库字段名称
        */
        private String column;

        private COLUMN (String column){
            this.column = column;
        }

        /**
         * 获取数据库字段名称
         */
        public String column() {
            return column;
        }
        
        public static COLUMN colOf(String column) {
            for (COLUMN col : COLUMN.values()) {
                if (col.column.equals(column)) {
                    return col;
                }
            }
            return null;
        }

        public static COLUMN nameOf(String name) {
            for (COLUMN col : COLUMN.values()) {
                if (col.name().equals(name)) {
                    return col;
                }
            }
            return null;
        }
    }

    // 查询 where 条件项
    public static class WhereItem {
        private boolean or = false;
        private COLUMN column = null;
        private WhereRelate whereRelate;
        private Object[] val;

        public WhereItem(COLUMN column, WhereRelate whereRelate, Object... val) {
            this.column = column;
            this.whereRelate = whereRelate;
            this.val = val;
        }

        private WhereItem(boolean or, COLUMN column, WhereRelate whereRelate, Object... val) {
            this.or = or;
            this.column = column;
            this.whereRelate = whereRelate;
            this.val = val;
        }

        public COLUMN getColumn() {
           return column;
        }

        public WhereRelate getWhereRelate() {
          return whereRelate;
        }

        public Object[] getVal() {
           return val;
        }

        public boolean isOr() {
           return or;
        }
     }

    // 排序项
    public class OrderByItem {
        private COLUMN column = null;
        private OrderBy order = OrderBy.ASC;

        public OrderByItem(COLUMN column) {
            this.column = column;
        }

        public OrderByItem(COLUMN column, OrderBy order) {
            this.column = column;
            this.order = order;
        }
        public COLUMN getColumn() {
             return column;
        }

        public OrderBy getOrder() {
             return order;
        }
    }
    // 打算查询出的字段
    private List<COLUMN> selectColumns;

    public List<COLUMN> getSelectColumns() {
        return selectColumns;
    }

<#if (gen.showComment == true)>
    /**
     * 是否是去重的
     */
</#if>
    public boolean isDistinct() {
        return distinct;
    }

<#if (gen.showComment == true)>
    /**
     * 设置是否去重
     */
</#if>     
    public ${entityName}${gen.queryPostfix} setDistinct(boolean distinct) {
        this.distinct = distinct;
        return this;
    }

    public  ${entityName}${gen.queryPostfix} ADD_SELECT_COLUMN(final COLUMN... column) {
        if (selectColumns == null) {
            selectColumns = new ArrayList<>();
        }
        for (COLUMN col : column) {
            selectColumns.add(col);
        }
        return this;
    }

    //查询条件
    private List<WhereItem> where;

    public List<WhereItem> getWhere(){
        return where;
    }

    // 排序
    private List<OrderByItem> orderBy;

    public List<OrderByItem> getOrderBy() {
        return orderBy;
    }


    public ${entityName}${gen.queryPostfix} WHERE(COLUMN column, WhereRelate whereRelate, final Object... vals) {
        if (column == null || whereRelate == null) {
            throw new RuntimeException("column 和 whereRelate 不可为空。");
        }
        if (where == null) {
             where = new ArrayList<>();
        }
        Object[] allVals = null;
        if (vals != null) {
            for (Object val : vals) {
                if (val instanceof List) {
                    List list = (List) val;
                    allVals = ArrayUtils.addAll(allVals, list.toArray());
                } else if (val instanceof Set) {
                    Set set = (Set) val;
                    allVals = ArrayUtils.addAll(allVals, set.toArray());
                } else {
                    allVals = ArrayUtils.addAll(allVals, val);
                }
            }
        } else {
            allVals = new Object[]{null};
        }
        where.add(new WhereItem(column, whereRelate, allVals));
        return this;
    }

    public ${entityName}${gen.queryPostfix} OR_WHERE(COLUMN column, WhereRelate whereRelate, final Object... vals) {
        if (column == null || whereRelate == null) {
            throw new RuntimeException("column 和 whereRelate 不可为空。");
        }
        if (where == null) {
            where = new ArrayList<>();
        }
        Object[] allVals = null;
        if (vals != null) {
            for (Object val : vals) {
                if (val instanceof List) {
                    List list = (List) val;
                    allVals = ArrayUtils.addAll(allVals, list.toArray());
                } else if (val instanceof Set) {
                    Set set = (Set) val;
                    allVals = ArrayUtils.addAll(allVals, set.toArray());
                } else {
                    allVals = ArrayUtils.addAll(allVals, val);
                }
            }
        } else {
            allVals = new Object[]{null};
        }
        where.add(new WhereItem(true, column, whereRelate, allVals));
        return this;
    }

    public ${entityName}${gen.queryPostfix} ORDER_BY_ASC(final COLUMN... column) {
        if (null == orderBy) {
            orderBy = new ArrayList<>();
        }
        for (COLUMN col : column) {
            orderBy.add(new OrderByItem(col));
        }
        return this;
    }

    public ${entityName}${gen.queryPostfix} ORDER_BY_DESC(final COLUMN... column) {
        if(null == orderBy){
            orderBy = new ArrayList<>();
        }
        for (COLUMN col : column) {
            orderBy.add(new OrderByItem(col, OrderBy.DESC));
        }
        return this;
    }


    public Integer getFirstResult() {
        return firstResult;
    }

    /**
     * 设置第一条数据起始位置
     */
    public ${entityName}${gen.queryPostfix} setFirstResult(Integer firstResult) {
        this.firstResult = firstResult;
        return this;
    }

    public Integer getMaxResults() {
        return maxResults;
    }

    /**
     * 每页数据集合数
     */
    public ${entityName}${gen.queryPostfix} setMaxResults(Integer maxResults) {
        this.maxResults = maxResults;
        return this;
    }
}