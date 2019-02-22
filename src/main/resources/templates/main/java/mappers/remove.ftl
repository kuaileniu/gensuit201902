package ${packageStr};

import java.util.Set;
import java.util.List;
import java.util.ArrayList;
import org.apache.commons.lang3.ArrayUtils;

import ${gen.enumPackage?replace("/",".")}.${WhereRelate};

<#if (gen.showComment==true)>
/**
 * ${info.po.tableName} 的删除参数类
 * (${classRemark})
 */
</#if>
public class ${entityName}${gen.removePostfix} {

<#if (gen.showComment==true)>
    /**
     * 表名
     */
</#if>
    public static final String TABLE_NAME = "${info.po.tableName}";

<#if (gen.showComment==true)>
    /**
     * 字段枚举
     */
</#if>
    public enum COLUMN {
    <#list info.po.javaPropDbColumn?keys as key>
       ${key}("${info.po.javaPropDbColumn[key]}"),
    </#list>
    ;

<#if (gen.showComment==true)>
     /**
      * 数据库字段名称
      */
</#if>
     private String column;

      private COLUMN (String column){
         this.column = column;
      }

<#if (gen.showComment==true)>
       /**
        * 获取数据库字段名称
        */
</#if>
       public String column() {
          return column;
       }
    }

    public class WhereItem {
        private boolean or = false;
        private COLUMN column=null;
        private WhereRelate whereRelate;
        private Object[] val;

        public WhereItem(COLUMN column, WhereRelate whereRelate, Object... val) {
            this.column = column;
            this.whereRelate = whereRelate;
            this.val = val;
        }

        public WhereItem(boolean or, COLUMN column, WhereRelate whereRelate, Object... val) {
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

<#if (gen.showComment==true)>
    //删除条件
</#if>
    private List<WhereItem> where;

    public List<WhereItem> getWhere(){
        return where;
    }

    public ${entityName}${gen.removePostfix} WHERE(COLUMN column, WhereRelate whereRelate, final Object... vals){
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

    public ${entityName}${gen.removePostfix} OR_WHERE(COLUMN column, WhereRelate whereRelate, final Object... vals) {
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
        where.add(new WhereItem(true,column, whereRelate, allVals));
        return this;
    }

}