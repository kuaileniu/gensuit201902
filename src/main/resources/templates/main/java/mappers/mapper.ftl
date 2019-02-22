package ${packageStr};

import java.util.List;
import java.util.Map;

import ${gen.queryPackage?replace("/",".")}.${entityName}${gen.queryPostfix};
import ${gen.modifyPackage?replace("/",".")}.${entityName}${gen.modifyPostfix};
import ${gen.removePackage?replace("/",".")}.${entityName}${gen.removePostfix};
import ${gen.poPackage?replace("/",".")}.${entityName}${gen.poPostfix};
import ${gen.providerPackage?replace("/",".")}.${entityName}${gen.providerPostfix};
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.annotations.DeleteProvider;

@Mapper
public interface ${className}{

<#if (gen.showComment==true)>
    /**
     * 插入单条数据
     */
</#if>
    @InsertProvider(type = ${entityName}${gen.providerPostfix}.class, method = "insertOne")
    public int insert(final ${entityName}${gen.poPostfix} o);

<#if (gen.showComment==true)>
    /**
     * 插入单条数据,忽略空值字段
     */
</#if>
    @InsertProvider(type = ${entityName}${gen.providerPostfix}.class, method = "insertOneWithOutNull")
    public int insertWithOutNull(final ${entityName}${gen.poPostfix} o);

<#if (gen.showComment==true)>
    /**
     * 根据条件删除数据
     */
</#if>
    @DeleteProvider(type = ${entityName}${gen.providerPostfix}.class, method = "delete")
    public int delete(final ${entityName}${gen.removePostfix} where, final @Param("p") Map<String,Object> emptyHashMap);
<#if ( info.po.keyList?size> 0 ) >

<#if (gen.showComment==true)>
    /**
     * 根据key删除数据
     */
</#if>
    @DeleteProvider(type = ${entityName}${gen.providerPostfix}.class, method = "deleteByKey")
    public int deleteByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final @Param("${propertyName}") ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
</#if>

<#if (gen.showComment==true)>
    /**
     * 更新,null值的字段不更新
     * 若有主键值，主键值不更新
     */
</#if>
    @UpdateProvider(type = ${entityName}${gen.providerPostfix}.class, method = "updateWithOutNull")
    public int updateWithOutNull(final @Param("o") ${entityName}${gen.poPostfix} o, final @Param("m") ${entityName}${gen.modifyPostfix} where, final @Param("p") Map<String,Object> emptyHashMap);

<#if (gen.showComment==true)>
    /**
     * 更新,null值的字段一起更新
     * 若有主键值，主键值不更新
     */
</#if>
    @UpdateProvider(type = ${entityName}${gen.providerPostfix}.class , method = "update")
    public int update(final @Param("o") ${entityName}${gen.poPostfix} o, final @Param("m") ${entityName}${gen.modifyPostfix} where, final @Param("p") Map<String, Object> emptyHashMap);
<#if ( info.po.keyList?size> 0 ) >

<#if (gen.showComment==true)>
    /**
     * 只更新指定的字段
     */
</#if>
    @UpdateProvider(type = ${entityName}${gen.providerPostfix}.class, method = "updateColumn")
    public int updateColumn(final @Param("m")${entityName}${gen.modifyPostfix} modifier, @Param("p") Map<String, Object> params);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改
     * 若有主键值，主键值不更新
     */
</#if>
    @UpdateProvider(type = ${entityName}${gen.providerPostfix}.class, method = "updateWithOutNullByKey")
    public int updateWithOutNullByKey(final @Param("o") ${entityName}${gen.poPostfix} o);
</#if>
<#if ( info.po.keyList?size> 0 ) >

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,null值的字段一起更新
     * 若有主键值，主键值不更新
     */
</#if>
    @UpdateProvider(type = ${entityName}${gen.providerPostfix}.class, method = "updateByKey")
    public int updateByKey(final @Param("o") ${entityName}${gen.poPostfix} o);
</#if>

<#if (gen.showComment==true)>
    /**
     * 查询单个对象，
     * 需要工程师确实查询的结果仅有一条，程序中使用limit 1 进行截取
     */
</#if>
    @SelectProvider(type = ${entityName}${gen.providerPostfix}.class, method = "selectOne")
    @Results({
    <#list info.po.javaPropDbColumn?keys as javaProperty>
            @Result(property = "${javaProperty}", column = "${info.po.javaPropDbColumn[javaProperty]}") <#if javaProperty_has_next>,</#if>
    </#list>
    })
    public ${entityName}${gen.poPostfix} selectOne(final ${entityName}${gen.queryPostfix} query, final @Param("p") Map<String,Object> emptyHashMap);
   <#if ( info.po.keyList?size> 0 ) >

<#if (gen.showComment==true)>
    /**
     * 根据主键查询
     */
</#if>
    @SelectProvider(type = ${entityName}${gen.providerPostfix}.class, method = "selectByKey")
    @Results({
       <#list info.po.javaPropDbColumn?keys as javaProperty>
            @Result(property = "${javaProperty}", column = "${info.po.javaPropDbColumn[javaProperty]}") <#if javaProperty_has_next>,</#if>
       </#list>
    })
    public ${entityName}${gen.poPostfix} selectByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final @Param("${propertyName}") ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
   </#if>
    <#if ( info.po.keyList?size> 0 ) >

<#if (gen.showComment==true)>
    /**
     * 根据主键查询,指定查询字段
     */
</#if>
    @SelectProvider(type = ${entityName}${gen.providerPostfix}.class, method = "selectColumnByKey")
    @Results({
       <#list info.po.javaPropDbColumn?keys as javaProperty>
            @Result(property = "${javaProperty}", column = "${info.po.javaPropDbColumn[javaProperty]}") <#if javaProperty_has_next>,</#if>
       </#list>
    })
    public ${entityName}${gen.poPostfix} selectColumnByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final @Param("${propertyName}") ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, final ${entityName}${gen.queryPostfix} columns);
   </#if>

<#if (gen.showComment==true)>
    /**
     * 查询列表
     */
</#if>
    @SelectProvider(type = ${entityName}${gen.providerPostfix}.class, method= "selectList")
    @Results({
    <#list info.po.javaPropDbColumn?keys as javaProperty>
             @Result(property = "${javaProperty}", column = "${info.po.javaPropDbColumn[javaProperty]}") <#if javaProperty_has_next>,</#if>
    </#list>
    })
    public List<${entityName}${gen.poPostfix}> selectList(final ${entityName}${gen.queryPostfix} query, final @Param("p") Map<String,Object> emptyHashMap);

<#if (gen.showComment==true)>
    /**
     * 使用原生sql查询列表。
     * @param sql example： "select *   from t_order where id > ${r"#"}{p.id}  order by ${r"#"}{p.ob} ";
     * @param params where中的参数, params.put("id",7);  params.put("ob","id");
     * 支持查询条件多表，结果集只为${entityName}${gen.poPostfix}对应的表的数据,
     * 自动映射为java bean的属性
     */
</#if>
    @SelectProvider(type = ${entityName}${gen.providerPostfix}.class, method= "bySQL")
    @Results({
    <#list info.po.javaPropDbColumn?keys as javaProperty>
            @Result(property = "${javaProperty}", column = "${info.po.javaPropDbColumn[javaProperty]}") <#if javaProperty_has_next>,</#if>
    </#list>
    })
    public List<${entityName}${gen.poPostfix}> selectListBySQL(final String sql, final @Param("p") Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * 查询数量
     */
</#if>
    @SelectProvider(type = ${entityName}${gen.providerPostfix}.class , method = "bySQL")
    public long countBySQL(final String sql, final @Param("p") Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
    * 查询数量
    */
</#if>
    @SelectProvider(type = ${entityName}${gen.providerPostfix}.class , method = "count")
    public long count(final ${entityName}${gen.queryPostfix} query, final @Param("p") Map<String,Object> emptyHashMap);

}