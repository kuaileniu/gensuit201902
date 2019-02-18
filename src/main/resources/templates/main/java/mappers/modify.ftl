package ${packageStr};

import java.util.Set;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;
import org.apache.commons.lang3.ArrayUtils;

import ${gen.enumPackage?replace("/",".")}.${WhereRelate};

/**
 * ${info.po.tableName} 的修改类
 * (${classRemark})
 */
public class ${entityName}${gen.modifyPostfix} {

    /**
     * 表名
     */
    public static final String TABLE_NAME = "${info.po.tableName}";

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

    // 打算更改的字段
    private Map<COLUMN, Object> updateColumns;

    // 更改的字段,使用val值原字符串（为了支持db函数等）不可对外开放
    private Map<COLUMN, String> updateNativeColumns;

    //修改条件
    private List<WhereItem> where;

    public List<WhereItem> getWhere(){
        return where;
    }

    public Map<COLUMN, Object> getUpdateColumns() {
        return updateColumns;
    }

    public Map<COLUMN, String> getUpdateNativeColumns() {
        return updateNativeColumns;
    }

    public ${entityName}${gen.modifyPostfix} WHERE(COLUMN column, WhereRelate whereRelate, final Object... vals){
        if (column == null || whereRelate == null) {
            throw new RuntimeException("column 和 whereRelate 不可为空。");
        }
        if(where == null){
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

    public ${entityName}${gen.modifyPostfix} OR_WHERE(COLUMN column, WhereRelate whereRelate, final Object... vals){
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

    /**
     * 添加修改的指定字段
     * @param column，指定字段
     * @param val 修改的结果值
     * @return
     */
    public ${entityName}${gen.modifyPostfix} ADD_UPDATE_COLUMN(final ${entityName}${gen.modifyPostfix}.COLUMN column, Object val) {
        if (updateColumns == null) {
            updateColumns = new HashMap<>();
        }
        updateColumns.put(column, val);
        return this;
    }
	
	/**
     * 添加修改的指定字段
     * @param column，指定字段
     * @param val 修改的结果值
     * @return
     */
    public ${entityName}${gen.modifyPostfix} ADD_UPDATE_NATIVE_COLUMN(final ${entityName}${gen.modifyPostfix}.COLUMN column, String val) {
        if (updateNativeColumns == null) {
            updateNativeColumns = new HashMap<>();
        }
        updateNativeColumns.put(column, val);
        return this;
    }
}