package ${gen.managerPackage?replace("/",".")};

import java.util.List;
import java.util.Map;
import java.util.Collection;

import ${gen.poPackage?replace("/",".")}.*;
import ${gen.queryPackage?replace("/",".")}.${entityName}${gen.queryPostfix};
import ${gen.removePackage?replace("/",".")}.${entityName}${gen.removePostfix};
import ${gen.modifyPackage?replace("/",".")}.${entityName}${gen.modifyPostfix};
import ${gen.modelPackage?replace("/",".")}.DataPage;
import ${gen.utilPackage?replace("/",".")}.Zset;

public interface Gen${entityName}${gen.managerPostfix} {

<#if (gen.showComment==true)>
    /**
     * 根据原生sql查询
     */
</#if>
    public List<Map> selectList(String sql, Map<String, Object> params);

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    public boolean add(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 增加，忽略空值属性
     */
</#if>
    public boolean addWithOutNull(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 增加，忽略空值属性,属性类型为String时，不添加“”、“   ”
     */
</#if>
    public boolean addWithOutBlank(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    public boolean add(final Collection<${entityName}${gen.poPostfix}> os);

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    public boolean addWithOutNull(final Collection<${entityName}${gen.poPostfix}> os);
<#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键删除
     */
    </#if>
    public boolean delByIdObj(final ${entityName}${gen.poPostfix}... os);
</#if>
<#if ( info.po.keyList?size == 1 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键删除
     */
    </#if>
    public boolean delByIdObj(final Collection<${entityName}${gen.poPostfix}> os);
</#if>
<#if ( info.po.keyList?size == 1 ) >
    <#list info.po.keyList as propertyNameType>
        <#if propertyNameType_index==0>
            <#list propertyNameType?keys as propertyName>

    <#if (gen.showComment==true)>
    /**
     * 根据主键删除
     */
    </#if>
    public boolean delById(final ${propertyNameType[propertyName]}... os);
            </#list>
        </#if>
    </#list>
</#if>
<#if ( info.po.keyList?size== 1 ) >
    <#list info.po.keyList as propertyNameType>
        <#if propertyNameType_index==0 >
            <#list propertyNameType?keys as propertyName>

    <#if (gen.showComment==true)>
    /**
     * 根据主键删除
     */
    </#if>
    public boolean delById(final Collection<${propertyNameType[propertyName]}> os);
        </#list>
    </#if>
</#list>
</#if>

<#if (gen.showComment==true)>
    /**
     * 根据条件删除
     */
</#if>
    public boolean del(final ${entityName}${gen.removePostfix} where);

<#if (gen.showComment==true)>
    /**
     * 根据条件修改,空值的不设置
     */
</#if>
    public int modifyWithOutNull(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where);

<#if (gen.showComment==true)>
    /**
     * 根据条件修改，空值的亦设置
     */
</#if>
    public int modify(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where);

<#if (gen.showComment==true)>
    /**
     * 修改指定字段
     * @param modifier
     * @return
     */
</#if>
    public int modifyColumn(final ${entityName}${gen.modifyPostfix} modifier);

<#if (gen.showComment==true)>
    /**
     * 修改指定字段,值为null的不修改
     * @param modifier
     * @return
     */
</#if>
    public int modifyColumnWithOutNull(final ${entityName}${gen.modifyPostfix} modifier);

<#if (gen.showComment==true)>
    /**
     * 修改指定字段,值为null、""、"   "的不修改
     * @param modifier
     * @return
     */
</#if>
    public int modifyColumnWithOutBlank(final ${entityName}${gen.modifyPostfix} modifier);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置
     */
</#if>
    public boolean modifyWithOutNullByKey(final ${entityName}${gen.poPostfix} o);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置,属性类型为String时，值为""、"    "的不设置
     */
</#if>
    public boolean modifyWithOutBlankByKey(final ${entityName}${gen.poPostfix} o);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置
     */
</#if>
    public boolean modifyWithOutNullByKey(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置,属性类型为String时，值为""、"    "的也不设置
     */
</#if>
    public boolean modifyWithOutBlankByKey(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置
     */
</#if>
    public boolean modifyWithOutNullByKey(final Collection<${entityName}${gen.poPostfix}> os);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改，空值的亦设置
     */
</#if>
    public boolean modifyByKey(final ${entityName}${gen.poPostfix} o);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改，空值的亦设置
     */
</#if>
    public boolean modifyByKey(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改，空值的亦设置
     */
</#if>
    public boolean modifyByKey(final Collection<${entityName}${gen.poPostfix}> os);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     * @param query
     * @return
     */
</#if>
    public ${entityName}${gen.poPostfix} findOne(final ${entityName}${gen.queryPostfix} query);
<#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键查询
     */
    </#if>
    public ${entityName}${gen.poPostfix} findByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
</#if>

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     * @param property
     * @return
     */
</#if>
    public ${entityName}${gen.poPostfix} findPropertyByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, final ${entityName}${gen.queryPostfix} property);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     * @param query
     * @return
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findList(final ${entityName}${gen.queryPostfix} query);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件,需保证ADD_SELECT_COLUMN 有且只有一个值
     * @param query
     * @return
     */
</#if>
    public Zset findZset(final ${entityName}${gen.queryPostfix} query);

<#if (gen.showComment==true)>
    /**
     * 分页查询数据
     * @param column
     * @param val
     * @return
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN column, Object... val);

<#if (gen.showComment==true)>
    /**
     * 分页查询数据
     * @param column
     * @param val
     * @return
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN[] selectColumns, final ${entityName}${gen.queryPostfix}.COLUMN column, Object... val);

<#if (gen.showComment==true)>
    /**
     * 分页查询数据
     * @param column
     * @param pageSize
     * @param val
     * @return
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN column, int pageSize, Object... val);

<#if (gen.showComment==true)>
    /**
     * 分页查询数据
     * @param column
     * @param pageSize
     * @param val
     * @return
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN[] selectColumns, final ${entityName}${gen.queryPostfix}.COLUMN column, int pageSize, Object... val);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     * @param params
     * @return
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findListBySQL(final String sql, final Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * 根据sql进行count
     * @param params
     * @return
     */
</#if>
    public long countBySQL(final String sql, final Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * 查询数量
     */
</#if>
    public long count(final ${entityName}${gen.queryPostfix} query);

<#if (gen.showComment==true)>
    /**
     * 分页查询
     * @param query
     * @return
     */
</#if>
    public DataPage findPage(final ${entityName}${gen.queryPostfix} query);

<#if (gen.showComment==true)>
    /**
     * 使用sql分页查询
     * @param sql
     * @param params 防SQL注入参数
     * @return
     */
</#if>
    public DataPage findPageBySQL(final String sql, final Map<String,Object> params);
<#if ( info.po.keyList?size == 1 ) >

    <#if (gen.showComment==true)>
    /**
     * 从列表中选出id为给定值的一个
     * @param os
     * @param keyVal
     * @return
     */
    </#if>
    public ${entityName}${gen.poPostfix} findByKey(final List<${entityName}${gen.poPostfix}> os, String keyVal);
</#if>

<#if (gen.showComment==true)>
    /**
     * 从列表中选出指定字段的与val相同的一个
     * @param os
     * @param val
     * @return
     */
</#if>
    public ${entityName}${gen.poPostfix} findByProperty(final List<${entityName}${gen.poPostfix}> os, ${entityName}${gen.queryPostfix}.COLUMN column, String val);

<#if (gen.showComment==true)>
    /**
     * 从列表中选出指定字段的与val相同的集合
     * @param os
     * @param val
     * @return
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findListByProperty(final List<${entityName}${gen.poPostfix}> os, ${entityName}${gen.queryPostfix}.COLUMN column, String val);

}