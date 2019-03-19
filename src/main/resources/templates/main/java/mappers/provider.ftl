package ${packageStr};

import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.annotations.Param;
import ${gen.queryPackage?replace("/",".")}.${entityName}${gen.queryPostfix};
import ${gen.modifyPackage?replace("/",".")}.${entityName}${gen.modifyPostfix};
import ${gen.poPackage?replace("/",".")}.${entityName}${gen.poPostfix};
import ${gen.removePackage?replace("/",".")}.${entityName}${gen.removePostfix};
import ${gen.utilPackage?replace("/",".")}.StringUtil;

public class ${className} {

<#if (gen.showComment==true)>
    /**
     * 插入一条记录
     */
</#if>
    public String insertOne(final ${entityName}${gen.poPostfix} o) {
        return new SQL() {{
            INSERT_INTO("${info.po.tableName}");
        <#list info.po.javaPropDbColumn?keys as javaProperty>
            VALUES("${info.po.javaPropDbColumn[javaProperty]}", "${r"#"}{${javaProperty}}");
        </#list>
        }}.toString();
    }

<#if (gen.showComment==true)>
    /**
     * 插入一条记录，忽略空值字段
     */
</#if>
    public String insertOneWithOutNull(final ${entityName}${gen.poPostfix} o) {
        return new SQL() {{
            INSERT_INTO("${info.po.tableName}");
        <#list info.po.javaPropDbColumn?keys as javaProperty>
            if (o.get${javaProperty?cap_first}() != null) {
                VALUES("${info.po.javaPropDbColumn[javaProperty]}", "${r"#"}{${javaProperty}}");
            }
        </#list>
        }}.toString();
    }

<#if (gen.showComment==true)>
    /**
     * 插入单条数据,忽略空值字段,String类型的属性值为“”、"  "的不添加
     */
</#if>
    public String insertWithOutBlank(final ${entityName}${gen.poPostfix} o) {
        return new SQL() {{
            INSERT_INTO("${info.po.tableName}");
        <#list info.po.javaPropDbColumn?keys as javaProperty>
			<#if (info.po.objectPropertyJavaTypeMap[javaProperty] == 'String') >
			if (StringUtil.isNotBlank(o.get${javaProperty?cap_first}())) {
                VALUES("${info.po.javaPropDbColumn[javaProperty]}", "${r"#"}{${javaProperty}}");
            }
			<#else> 
            if (o.get${javaProperty?cap_first}() != null) {
                VALUES("${info.po.javaPropDbColumn[javaProperty]}", "${r"#"}{${javaProperty}}");
            }
			</#if>			
        </#list>
        }}.toString();
    }

<#if (gen.showComment==true)>
    /**
     * 根据条件删除
     */
</#if>
    public String delete(final ${entityName}${gen.removePostfix} where, @Param("p") Map<String,Object> params) {
        return new SQL() {{
            DELETE_FROM("${info.po.tableName}");

            if(null == where.getWhere()){
                  throw new RuntimeException("删除[${info.po.tableName}]表数据时，请设置where条件");
            }

            <@whereColumnQueryUpdateMacroNoSQlInjection whereEntityName="${entityName}${gen.removePostfix}" whereParam="where"/>
        }}.toString();
    }
<#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键删除
     */
    </#if>
    public String deleteByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>@Param("${propertyName}") final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>) {
        return new SQL() {{
                DELETE_FROM("${info.po.tableName}");
          <#list info.po.keyList as propertyNameType>
              <#list propertyNameType?keys as propertyName>
                WHERE("${info.po.javaPropDbColumn[propertyName]} = ${r"#"}{${propertyName}}");
             </#list>
          </#list>
        }}.toString();
    }
</#if>

<#if (gen.showComment==true)>
    /**
     * 更新,null值的字段不更新
     * 若有主键值，主键值不更新
     */
</#if>
    public String updateWithOutNull(@Param("o") final ${entityName}${gen.poPostfix} o, @Param("m") final ${entityName}${gen.modifyPostfix} where, @Param("p") Map<String, Object> params) {
        return new SQL() {{
            UPDATE("${info.po.tableName}");
        <#list info.po.javaPropDbColumn?keys as javaProperty>
            <@setNotKeyColumnWithOutNullMacro javaProperty="${javaProperty}"/>
        </#list>
            <@whereColumnQueryUpdateMacroNoSQlInjection whereEntityName="${entityName}${gen.modifyPostfix}" whereParam="where"/>
        }}.toString();
    }

<#if (gen.showComment==true)>
    /**
     * 更新,null值的字段一起更新
     * 若有主键值，主键值不更新
     */
</#if>
    public String update(@Param("o") final ${entityName}${gen.poPostfix} o, @Param("m") final ${entityName}${gen.modifyPostfix} where, @Param("p") Map<String, Object> params) {
        return new SQL() {{
            UPDATE("${info.po.tableName}");
        <#list info.po.javaPropDbColumn?keys as javaProperty>
            <@setNotKeyColumnMacro javaProperty="${javaProperty}"/>
        </#list>
            <@whereColumnQueryUpdateMacroNoSQlInjection whereEntityName="${entityName}${gen.modifyPostfix}" whereParam="where"/>
        }}.toString();
    }

<#if (gen.showComment==true)>
    /**
     * 只更新指定的字段
     */
</#if>
    public String updateColumn(@Param("m") final ${entityName}${gen.modifyPostfix} modifier, @Param("p") Map<String, Object> params) {
        return new SQL() {{
            UPDATE("${info.po.tableName}");
            Map<${entityName}${gen.modifyPostfix}.COLUMN, String> nativeColumn = modifier.getUpdateNativeColumns();
            if (nativeColumn != null) {
                for (${entityName}${gen.modifyPostfix}.COLUMN column : nativeColumn.keySet()) {
                    SET(column.column() + " = " + nativeColumn.get(column));
                }
            }
            Map<${entityName}${gen.modifyPostfix}.COLUMN, Object> columns = modifier.getUpdateColumns();
            if (columns != null) {
				for (${entityName}${gen.modifyPostfix}.COLUMN column : columns.keySet()) {
					String setKey = "updateSetKey_"+column.column();
					SET(column.column()+" = ${r"#"}{p."+ setKey +"}");
					params.put(setKey,columns.get(column));
				}
			}
            <@whereColumnQueryUpdateMacroNoSQlInjection whereEntityName="${entityName}${gen.modifyPostfix}" whereParam="modifier"/>
        }}.toString();
    }
<#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键更新,null值的字段不更新
     * 若有主键值，主键值不更新
     */
    </#if>
    public String updateWithOutNullByKey(@Param("o") final ${entityName}${gen.poPostfix} o) {
        return new SQL() {{
            UPDATE("${info.po.tableName}");
        <#list info.po.javaPropDbColumn?keys as javaProperty>
            <@setNotKeyColumnWithOutNullMacro javaProperty="${javaProperty}"/>
        </#list>
        <@whereColumnIsKeyMacro />
        }}.toString();
    }
</#if>
<#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键更新,null或 "" 值的字段不更新
     * 若有主键值，主键值不更新
     */
    </#if>
    public String updateWithOutBlankByKey(@Param("o") final ${entityName}${gen.poPostfix} o) {
        return new SQL() {{
            UPDATE("${info.po.tableName}");
        <#list info.po.javaPropDbColumn?keys as javaProperty>
            <@setNotKeyColumnWithOutBlankMacro javaProperty="${javaProperty}"/>
        </#list>
        <@whereColumnIsKeyMacro />
        }}.toString();
    }
</#if>

<#if ( info.po.keyList?size> 0 ) >
    <#if (gen.showComment==true)>
    /**
     * 根据主键更新,null值的字段一起更新
     * 若有主键值，主键值不更新
     */
    </#if>
    public String updateByKey(@Param("o") final ${entityName}${gen.poPostfix} o) {
        return new SQL() {{
            UPDATE("${info.po.tableName}");
        <#list info.po.javaPropDbColumn?keys as javaProperty>
            <@setNotKeyColumnMacro javaProperty="${javaProperty}"/>
        </#list>
        <@whereColumnIsKeyMacro />
        }}.toString();
    }
</#if>

<#if (gen.showComment==true)>
    /**
     * 查询一条记录
     */
</#if>
    public String selectOne(final ${entityName}${gen.queryPostfix}  query, @Param("p") Map<String, Object> params) {
        SQL sql = new SQL() {{
            if (null == query.getSelectColumns() ) {
                <#--SELECT("<#list info.po.javaPropDbColumn?keys as javaProperty>${info.po.javaPropDbColumn[javaProperty]}<#if javaProperty_has_next>,</#if></#list>");-->
                if (query.isDistinct()) {
                    SELECT_DISTINCT("<#list info.po.javaPropDbColumn?values as dbColumn>${dbColumn}<#if dbColumn_has_next>,</#if></#list>");
                } else {
                    SELECT("<#list info.po.javaPropDbColumn?values as dbColumn>${dbColumn}<#if dbColumn_has_next>,</#if></#list>");
                }
            } else {
                StringJoiner joiner = new StringJoiner(",");
                for (${entityName}${gen.queryPostfix}.COLUMN column : query.getSelectColumns() ) {
                    joiner.add(column.column());
                }
                if(query.isDistinct()) {
                    SELECT_DISTINCT(joiner.toString());
                }else{
                    SELECT(joiner.toString());
                }
            }
            FROM("${info.po.tableName}");

            <@whereColumnQueryUpdateMacroNoSQlInjection whereEntityName="${entityName}${gen.queryPostfix}" whereParam="query"/>
            <@orderBy/>
        }};
        <#if ( rdb.database == "mysql" ) >
        return sql.toString() + " LIMIT 1";
        </#if>
        <#if ( rdb.database == "oracle" ) >
        return ;
        </#if>
    }
    <#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键查询
     */
    </#if>
    public String selectByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>@Param("${propertyName}") final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>){
        return new SQL(){{
            SELECT("<#list info.po.javaPropDbColumn?values as dbColumn>${dbColumn}<#if dbColumn_has_next>,</#if></#list>");
            FROM("${info.po.tableName}");
            <#list info.po.keyList as propertyNameType>
                <#list propertyNameType?keys as propertyName>
            WHERE("${info.po.javaPropDbColumn[propertyName]} = ${r"#"}{${propertyName}}");
               </#list>
            </#list>
        }}.toString();
    }
    </#if>
    <#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键查询,指定字段
     */
    </#if>
    public String selectColumnByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>@Param("${propertyName}") final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, final ${entityName}${gen.queryPostfix} columns){
        return new SQL(){{
            if (null == columns.getSelectColumns() ) {
                 SELECT("<#list info.po.javaPropDbColumn?values as dbColumn>${dbColumn}<#if dbColumn_has_next>,</#if></#list>");
            } else {
                StringJoiner joiner = new StringJoiner(",");
                for (${entityName}${gen.queryPostfix}.COLUMN column : columns.getSelectColumns() ) {
                  joiner.add(column.column());
                }
                 SELECT(joiner.toString());
            }
            FROM("${info.po.tableName}");
            <#list info.po.keyList as propertyNameType>
                <#list propertyNameType?keys as propertyName>
            WHERE("${info.po.javaPropDbColumn[propertyName]} = ${r"#"}{${propertyName}}");
               </#list>
            </#list>
        }}.toString();
    }
    </#if>

<#if (gen.showComment==true)>
    /**
     *  查询列表
     * @param query
     * @return
     */
</#if>
    public String selectList(final ${entityName}${gen.queryPostfix} query, @Param("p") Map<String, Object> params) {
        String sql = new SQL() {{
            if (null == query.getSelectColumns()) {
                <#--SELECT("<#list info.po.javaPropDbColumn?keys as javaProperty>${info.po.javaPropDbColumn[javaProperty]}<#if javaProperty_has_next>,</#if></#list>");-->
                if (query.isDistinct()) {
                    SELECT_DISTINCT("<#list info.po.javaPropDbColumn?values as dbColumn>${dbColumn}<#if dbColumn_has_next>,</#if></#list>");
                } else {
                    SELECT("<#list info.po.javaPropDbColumn?values as dbColumn>${dbColumn}<#if dbColumn_has_next>,</#if></#list>");
                }
            } else {
                StringJoiner joiner = new StringJoiner(",");
                for (${entityName}${gen.queryPostfix}.COLUMN column : query.getSelectColumns()) {
                    joiner.add(column.column());
                }
                if (query.isDistinct()) {
                    SELECT_DISTINCT(joiner.toString());
                }else{
                    SELECT(joiner.toString());
                }
            }
            FROM("${info.po.tableName}");

            <@whereColumnQueryUpdateMacroNoSQlInjection whereEntityName="${entityName}${gen.queryPostfix}" whereParam="query"/>
            <@orderBy/>
        }}.toString();
<#if ( rdb.database == "mysql" ) >

        StringJoiner joiner = null;
        if (null != query.getMaxResults()) {
            joiner = new StringJoiner(" ");
            joiner.add(sql);
            joiner.add("LIMIT").add(query.getMaxResults().toString());
            if (null != query.getFirstResult()) {
                joiner.add("OFFSET").add(query.getFirstResult().toString());
            }
        }
        return null != joiner ? joiner.toString() : sql;
</#if>
<#if ( rdb.database == "oracle" ) >

        StringJoiner joiner = null;

        return ;
</#if>
    }

<#if (gen.showComment==true)>
    /**
     * 使用原sql
     */
</#if>
    public String bySQL(String sql) {
        return sql;
    }

<#if (gen.showComment==true)>
    /**
     * 查询数量
     */
</#if>
    public String count(final ${entityName}${gen.queryPostfix} query, @Param("p") Map<String, Object> params) {
        return new SQL() {{
            SELECT("count(1)");
            FROM("${info.po.tableName}");
            <@whereColumnQueryUpdateMacroNoSQlInjection whereEntityName="${entityName}${gen.queryPostfix}" whereParam="query"/>
        }}.toString();
    }

}
<#--  set("user_name = #{userName})，修改（设置）非关键字 -->
<#macro setNotKeyColumnMacro javaProperty isKey = false >
    <#list info.po.keyList as propertyNameType>
        <#list propertyNameType?keys as propertyName>
            <#if propertyName == javaProperty ><#local isKey=true /></#if>
        </#list>
    </#list>
    <#if isKey>
    <#else>
            SET("${info.po.javaPropDbColumn[javaProperty]} = ${r"#"}{o.${javaProperty}}");
    </#if>
</#macro>

<#macro setNotKeyColumnWithOutNullMacro javaProperty isKey = false >
    <#list info.po.keyList as propertyNameType>
        <#list propertyNameType?keys as propertyName>
            <#if propertyName == javaProperty ><#local isKey=true /></#if>
        </#list>
    </#list>
    <#if isKey>
    <#else> 
            if (o.get${javaProperty?cap_first}() != null) {
                SET("${info.po.javaPropDbColumn[javaProperty]} = ${r"#"}{o.${javaProperty}}");
            }
    </#if>
</#macro>

<#macro setNotKeyColumnWithOutBlankMacro javaProperty isKey = false >
    <#list info.po.keyList as propertyNameType>
        <#list propertyNameType?keys as propertyName>
            <#if propertyName == javaProperty ><#local isKey=true /></#if>
        </#list>
    </#list>
    <#if isKey>
    <#else> 
			<#if (info.po.objectPropertyJavaTypeMap[javaProperty] == 'String') >
			if (StringUtil.isNotBlank(o.get${javaProperty?cap_first}())) {
                SET("${info.po.javaPropDbColumn[javaProperty]} = ${r"#"}{o.${javaProperty}}");
            }
			<#else> 
            if (o.get${javaProperty?cap_first}() != null) {
                SET("${info.po.javaPropDbColumn[javaProperty]} = ${r"#"}{o.${javaProperty}}");
            }
			</#if>
    </#if>
</#macro>

<#--  where ("table_id = #{tableId}) ，条件是关键字  -->
<#macro whereColumnIsKeyMacro >
    <#list info.po.keyList as propertyNameType>
        <#list propertyNameType?keys as propertyName>
            WHERE("${info.po.javaPropDbColumn[propertyName]} = ${r"#"}{o.${propertyName}}");
        </#list>
    </#list>
</#macro>

<#--  动态设置Where条件  -->
<#macro whereColumnQueryUpdateMacro whereEntityName whereParam>
            List<${whereEntityName}.WhereItem> whereList = ${whereParam}.getWhere();
            if (whereList != null) {
                for (${whereEntityName}.WhereItem whereItem : whereList) {
                    if (whereItem.isOr()) {
                        OR();
                    }
                    if ( whereItem.getWhereRelate() == WhereRelate.Between || whereItem.getWhereRelate() == WhereRelate.NotBetween ) {
                        WHERE(whereItem.getColumn().column() + " " + whereItem.getWhereRelate().code() + " '" + whereItem.getVal()[0] + "' " + "AND" + "  '" + whereItem.getVal()[1] + "'");
                    } else if ( whereItem.getWhereRelate() == WhereRelate.In || whereItem.getWhereRelate() == WhereRelate.NotIn  ){
                        StringJoiner ins = new StringJoiner(",");
                        for (Object o : whereItem.getVal()) {
                            ins.add("'" + o + "'");
                        }
                        WHERE(whereItem.getColumn().column() + " " + whereItem.getWhereRelate().code() + " (" + ins.toString() + ")");
                    } else {
                        WHERE(whereItem.getColumn().column() + " " + whereItem.getWhereRelate().code() + " '" +whereItem.getVal()[0] + "'");
                    }
                }
            }
</#macro>
<#--  动态设置Where条件,无sql注入  -->
<#macro whereColumnQueryUpdateMacroNoSQlInjection whereEntityName whereParam>
            List<${whereEntityName}.WhereItem> whereList = ${whereParam}.getWhere();
            if (whereList != null) {
                int key = 0;
                for (${whereEntityName}.WhereItem whereItem : whereList) {
                    if (whereItem.isOr()) {
                        OR();
                    }
                    switch (whereItem.getWhereRelate()) {
                        case Between:
                        case NotBetween:
                            key++;
                            String pk0 = key + "";
                            key++;
                            String pk1 = key + "";
                            params.put(pk0, whereItem.getVal()[0]);
                            params.put(pk1, whereItem.getVal()[1]);
                            WHERE(whereItem.getColumn().column() + whereItem.getWhereRelate().code() + "${r"#"}{p." + pk0 + "}" + " AND " + "${r"#"}{p." + pk1 + "}");
                            break;
                        case In:
                        case NotIn:
                            StringJoiner joiner = new StringJoiner(",");
                            for (Object o : whereItem.getVal()) {
                                key++;
                                joiner.add("${r"#"}{p." + key + "}");
                                params.put(key + "", o);
                            }
                            WHERE(whereItem.getColumn().column() + whereItem.getWhereRelate().code() + "(" + joiner.toString() + ")");
                            break;
                        case IsNull:
                        case IsNotNull:
                            WHERE(whereItem.getColumn().column() + whereItem.getWhereRelate().code());
                            break;
                        case LeftLike:
                        case LeftNotLike:
                            key++;
                            pk0 = key + "";
                            params.put(pk0, "%" + whereItem.getVal()[0]);
                            WHERE(whereItem.getColumn().column() + whereItem.getWhereRelate().code() + "${r"#"}{p." + pk0 + "}");
                            break;
                        case RightLike:
                        case RightNotLike:
                            key++;
                            pk0 = key + "";
                            params.put(pk0, whereItem.getVal()[0] + "%");
                            WHERE(whereItem.getColumn().column() + whereItem.getWhereRelate().code() + "${r"#"}{p." + pk0 + "}");
                            break;
                        case Like:
                        case NotLike:
                            key++;
                            pk0 = key + "";
                            params.put(pk0, "%" + whereItem.getVal()[0] + "%");
                            WHERE(whereItem.getColumn().column() + whereItem.getWhereRelate().code() + "${r"#"}{p." + pk0 + "}");
                            break;
                        default:
                            key++;
                            pk0 = key + "";
                            params.put(pk0, whereItem.getVal()[0]);
                            WHERE(whereItem.getColumn().column() + whereItem.getWhereRelate().code() + "${r"#"}{p." + pk0 + "}");
                    }
                }
            }
</#macro>
<#macro orderBy>
            if (null == query.getOrderBy()) {
            } else {
                for (${entityName}${gen.queryPostfix}.OrderByItem orderByItem : query.getOrderBy()) {
                    if (orderByItem.getOrder() == ${gen.enumPackage?replace("/",".")}.${order}.DESC) {
                        ORDER_BY( orderByItem.getColumn().column() + " desc");
                    } else {
                        ORDER_BY( orderByItem.getColumn().column() );
                    }
                }
            }
</#macro>            