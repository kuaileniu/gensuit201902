package ${gen.managerPackage?replace("/",".")};

import java.util.List;
import java.util.Map;
import java.util.Collection;

import ${gen.poPackage?replace("/",".")}.*;
import ${gen.queryPackage?replace("/",".")}.${entityName}${gen.queryPostfix};
import ${gen.removePackage?replace("/",".")}.${entityName}${gen.removePostfix};
import ${gen.modifyPackage?replace("/",".")}.${entityName}${gen.modifyPostfix};
import ${gen.modelPackage?replace("/",".")}.DataPage;

public interface Gen${entityName}${gen.managerPostfix} {

    /**
     * 增加
     */
    public boolean add(final ${entityName}${gen.poPostfix}... os);

    /**
     * 增加，忽略空值属性
     */
    public boolean addWithOutNull(final ${entityName}${gen.poPostfix}... os);

    /**
     * 增加
     */
    public boolean add(final Collection<${entityName}${gen.poPostfix}> os);

    /**
     * 增加
     */
    public boolean addWithOutNull(final Collection<${entityName}${gen.poPostfix}> os);
<#if ( info.po.keyList?size> 0 ) >

    /**
     * 根据主键删除
     */
    public boolean delByIdObj(final ${entityName}${gen.poPostfix}... os);
</#if>
<#if ( info.po.keyList?size == 1 ) >

    /**
     * 根据主键删除
     */
    public boolean delByIdObj(final Collection<${entityName}${gen.poPostfix}> os);
</#if>
<#if ( info.po.keyList?size == 1 ) >
    <#list info.po.keyList as propertyNameType>
        <#if propertyNameType_index==0>
            <#list propertyNameType?keys as propertyName>

    /**
     * 根据主键删除
     */
    public boolean delById(final ${propertyNameType[propertyName]}... os);
            </#list>
        </#if>
    </#list>
</#if>
<#if ( info.po.keyList?size== 1 ) >
    <#list info.po.keyList as propertyNameType>
        <#if propertyNameType_index==0 >
            <#list propertyNameType?keys as propertyName>

    /**
     * 根据主键删除
     */
    public boolean delById(final Collection<${propertyNameType[propertyName]}> os);
        </#list>
    </#if>
</#list>
</#if>

    /**
     * 根据条件删除
     */
    public boolean del(final ${entityName}${gen.removePostfix} where);

    /**
     * 根据条件修改,空值的不设置
     */
    public int modifyWithOutNull(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where);

    /**
     * 根据条件修改，空值的亦设置
     */
    public int modify(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where);

    /**
     * 修改指定字段
     * @param modifier
     * @return
     */
    public int modifyColumn(final ${entityName}${gen.modifyPostfix} modifier);

    /**
     * 根据主键修改,空值的不设置
     */
    public boolean modifyWithOutNullByKey(final ${entityName}${gen.poPostfix} o);

    /**
     * 根据主键修改,空值的不设置
     */
    public boolean modifyWithOutNullByKey(final ${entityName}${gen.poPostfix}... os);

    /**
     * 根据主键修改,空值的不设置
     */
    public boolean modifyWithOutNullByKey(final Collection<${entityName}${gen.poPostfix}> os);

    /**
     * 根据主键修改，空值的亦设置
     */
    public boolean modifyByKey(final ${entityName}${gen.poPostfix} o);

    /**
     * 根据主键修改，空值的亦设置
     */
    public boolean modifyByKey(final ${entityName}${gen.poPostfix}... os);

    /**
     * 根据主键修改，空值的亦设置
     */
    public boolean modifyByKey(final Collection<${entityName}${gen.poPostfix}> os);

    /**
     * 自定义查询条件
     * @param query
     * @return
     */
    public ${entityName}${gen.poPostfix} findOne(final ${entityName}${gen.queryPostfix} query);

<#if ( info.po.keyList?size> 0 ) >
    /**
     * 根据主键查询
     */
    public ${entityName}${gen.poPostfix} findByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
</#if>

    /**
     * 自定义查询条件
     * @param property
     * @return
     */
    public ${entityName}${gen.poPostfix} findPropertyByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, final ${entityName}${gen.queryPostfix} property);

    /**
     * 自定义查询条件
     * @param query
     * @return
     */
    public List<${entityName}${gen.poPostfix}> findList(final ${entityName}${gen.queryPostfix} query);

    /**
     * 分页查询数据
     * @param column
     * @param val
     * @return
     */
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN column, Object... val);

    /**
     * 分页查询数据
     * @param column
     * @param val
     * @return
     */
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN[] selectColumns, final ${entityName}${gen.queryPostfix}.COLUMN column, Object... val);

    /**
     * 分页查询数据
     * @param column
     * @param pageSize
     * @param val
     * @return
     */
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN column, int pageSize, Object... val);

    /**
     * 分页查询数据
     * @param column
     * @param pageSize
     * @param val
     * @return
     */
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN[] selectColumns, final ${entityName}${gen.queryPostfix}.COLUMN column, int pageSize, Object... val);

    /**
     * 自定义查询条件
     * @param params
     * @return
     */
    public List<${entityName}${gen.poPostfix}> findListBySQL(final String sql, final Map<String,Object> params);

    /**
     * 根据sql进行count
     * @param params
     * @return
     */
    public long countBySQL(final String sql, final Map<String,Object> params);

    /**
     * 查询数量
     */
    public long count(final ${entityName}${gen.queryPostfix} query);

    /**
     * 分页查询
     * @param query
     * @return
     */
    public DataPage findPage(final ${entityName}${gen.queryPostfix} query);

    /**
     * 使用sql分页查询
     * @param sql
     * @param params 防SQL注入参数
     * @return
     */
    public DataPage findPageBySQL(final String sql, final Map<String,Object> params);
<#if ( info.po.keyList?size == 1 ) >

    /**
     * 从列表中选出id为给定值的一个
     * @param os
     * @param keyVal
     * @return
     */
    public ${entityName}${gen.poPostfix} findByKey(final List<${entityName}${gen.poPostfix}> os, String keyVal);
</#if>

    /**
     * 从列表中选出指定字段的与val相同的一个
     * @param os
     * @param val
     * @return
     */
    public ${entityName}${gen.poPostfix} findByProperty(final List<${entityName}${gen.poPostfix}> os, ${entityName}${gen.queryPostfix}.COLUMN column, String val);

    /**
     * 从列表中选出指定字段的与val相同的集合
     * @param os
     * @param val
     * @return
     */
    public List<${entityName}${gen.poPostfix}> findListByProperty(final List<${entityName}${gen.poPostfix}> os, ${entityName}${gen.queryPostfix}.COLUMN column, String val);

}