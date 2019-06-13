package ${gen.servicePackage?replace("/",".")};

import java.util.List;
import java.util.Map;
import java.util.Collection;

import ${gen.poPackage?replace("/",".")}.*;
import ${gen.queryPackage?replace("/",".")}.${entityName}${gen.queryPostfix};
import ${gen.removePackage?replace("/",".")}.${entityName}${gen.removePostfix};
import ${gen.modifyPackage?replace("/",".")}.${entityName}${gen.modifyPostfix};
import ${gen.modelPackage?replace("/",".")}.*;

public interface Gen${entityName}${gen.servicePostfix} {

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    public ResponseModel add(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    public ResponseModel addWithOutNull(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    public ResponseModel addWithOutBlank(final ${entityName}${gen.poPostfix}... os);

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    public ResponseModel add(final Collection<${entityName}${gen.poPostfix}> os);

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    public ResponseModel addWithOutNull(final Collection<${entityName}${gen.poPostfix}> os);

<#if (gen.showComment==true)>
    /**
     *  使用给定的Where查询，若查询不到则增加一条记录
     *  return true,操作成功;
     */
</#if>
    public boolean addIfAbsentByWhere(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.queryPostfix}.WhereItem whereItem);

<#if (gen.showComment==true)>
    /**
     *  根据条件查询，若查询不到则增加一条记录
     */
</#if>
    public ResponseModel addIfAbsentByQuery(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.queryPostfix} query) ;
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

<#if (gen.showComment==true)>
    /**
     * 增加自己的
     */
</#if>
    public boolean addMine(final ${entityName}${gen.poPostfix}... os);
        <#break>
        </#if>
    </#list>
</#if>
<#if ( info.po.keyList?size> 0 ) >
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

            <#if (gen.showComment==true)>
    /**
     * 增加自己的
     */
            </#if>
    public boolean addMine(final Collection<${entityName}${gen.poPostfix}> os);
        <#break>
        </#if>
    </#list>
</#if>

    <#if (gen.showComment==true)>
    /**
     * 根据主键删除
     */
    </#if>
    public ResponseModel delByIdObj(final ${entityName}${gen.poPostfix}... os);
</#if>

<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">
            <#if ( info.po.keyList?size> 0 ) >
                <#if (gen.showComment==true)>
    /**
     * 根据主键删除自己的
     */
                </#if>
    public boolean delMineByIdObj(final ${entityName}${gen.poPostfix}... os);
            </#if>
        <#break>
        </#if>
    </#list>
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
    public ResponseModel delById(final ${propertyNameType[propertyName]}... os);
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
    public ResponseModel delById(final Collection<${propertyNameType[propertyName]}> os);
        </#list>
    </#if>
</#list>
</#if>

<#if (gen.showComment==true)>
    /**
     * 根据条件删除
     */
</#if>
    public ResponseModel del(final ${entityName}${gen.removePostfix} where);

<#if (gen.showComment==true)>
    /**
     * 根据条件修改,空值的不设置
     */
</#if>
    public ResponseModel modifyWithOutNull(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where);

<#if (gen.showComment==true)>
    /**
     * 根据条件修改，空值的亦设置
     */
</#if>
    public ResponseModel modify(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where);

<#if (gen.showComment==true)>
    /**
     * 根据条件修改，修改指定的字段
     */
</#if>
    public ResponseModel modifyProperty(final ${entityName}${gen.modifyPostfix} property);

<#if (gen.showComment==true)>
    /**
     * 根据条件修改，修改指定的字段,值为null的不修改
     */
</#if>
    public ResponseModel modifyPropertyWithOutNull(final ${entityName}${gen.modifyPostfix} property);

<#if (gen.showComment==true)>
    /**
     * 根据条件修改，修改指定的字段,值为null、""、"   "的不修改
     */
</#if>
    public ResponseModel modifyPropertyWithOutBlank(final ${entityName}${gen.modifyPostfix} property);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置
     */
</#if>
    public ResponseModel modifyWithOutNullByKey(final ${entityName}${gen.poPostfix} o);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置,当属性类型为String时，""、"    "的值不设置
     */
</#if>
    public ResponseModel modifyWithOutBlankByKey(final ${entityName}${gen.poPostfix} o);

<#if (gen.showComment==true)>
    /**
     * 根据主键修改，空值的亦设置
     */
</#if>
    public ResponseModel modifyByKey(${entityName}${gen.poPostfix} o);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     *
     * @param query
     * @return
     */
</#if>
    public ${entityName}${gen.poPostfix} findOne(final ${entityName}${gen.queryPostfix} query);

<#if (gen.showComment==true)>
    /**
     * 前端自定义查询条件
     *
     * @param requestModel
     * @return
     */
</#if>
    public ${entityName}${gen.poPostfix} findOne(final RequestModel requestModel);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件,隐藏字段置空
     *
     * @param query
     * @return
     */
</#if>
    public ${entityName}${gen.poPostfix} findOneExcludeHidden(final ${entityName}${gen.queryPostfix} query);

<#if (gen.showComment==true)>
    /**
     * 前端自定义查询条件
     *
     * @param requestModel
     * @return
     */
</#if>
    public ${entityName}${gen.poPostfix} findOneExcludeHidden(final RequestModel requestModel);

<#if ( info.po.keyList?size> 0 ) >
    <#if (gen.showComment==true)>
    /**
     * 根据主键查询
     */
    </#if>
    public ResponseModel findExcludeHiddenByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
</#if>

<#if ( info.po.keyList?size> 0 ) >
    <#if (gen.showComment==true)>
    /**
     * 根据主键查询(含隐藏字段)
     */
    </#if>
    public ${entityName}${gen.poPostfix} findByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
</#if>

<#if (gen.showComment==true)>
    /**
     * 根据条件查询单条数据
     */
</#if>
    public ${entityName}${gen.poPostfix} findOneByWhere(final ${entityName}${gen.queryPostfix}.WhereItem ... items);
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

            <#if (gen.showComment==true)>
    /**
     * 根据条件查询自己的单条数据
     */
            </#if>
    public ${entityName}${gen.poPostfix} findMineOneByWhere(final ${entityName}${gen.queryPostfix}.WhereItem ... items);
        <#break>
        </#if>
    </#list>
</#if>

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     *
     * @param property
     * @return
     */
</#if>
    public ${entityName}${gen.poPostfix} findPropertyByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, final ${entityName}${gen.queryPostfix} property);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     *
     * @param query
     * @return ${entityName}列表
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findList(final ${entityName}${gen.queryPostfix} query);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     *
     * @param requestModel
     * @return ${entityName}列表
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findLs(final RequestModel requestModel);

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     */
</#if>
    public ResponseModel findList(final RequestModel requestModel);
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

            <#if (gen.showComment==true)>
    /**
     * 自定义查询条件,查询自己的${entityName}列表
     *
     * @param q
     * @return
     */
            </#if>
    public List<${entityName}${gen.poPostfix}> findMineList(List<Map> q);
        <#break>
        </#if>
    </#list>
</#if>

    <#--  /**
     * 自定义查询条件,查询自己的${entityName}列表
     *
     * @param q
     * @return
     */
    public List<${entityName}${gen.poPostfix}>  findMineList(List<Map> q);  -->
<#--  </#if>      -->

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     *
     * @param params
     * @return
     */
</#if>
    public List<${entityName}${gen.poPostfix}> findListBySQL(final String sql, final Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * 根据sql进行count
     *
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
     * 查询数量
     */
</#if>
    public ResponseModel count(final RequestModel requestModel);

<#if (gen.showComment==true)>
    /**
     * 查询数量(一次查询多个)
     */
</#if>
    public ResponseModel[] counts(final RequestModel[] models);

<#if (gen.showComment==true)>
    /**
     * 查询数量
     */
</#if>
    public long count(final List<Map> q);

    <#if (gen.showComment==true)>
    /**
     * 分页查询
     *
     * @param query
     * @return
     */
    </#if>
    public DataPage findPage(final ${entityName}${gen.queryPostfix} query);

    <#if (gen.showComment==true)>
    /**
     * 分页查询
     */
    </#if>
    public DataPage findPage(RequestModel requestModel);

    <#if (gen.showComment==true)>
    /**
     * 分页查询
     */
    </#if>
    public ResponseModel findPageModel(RequestModel requestModel);

    <#if (gen.showComment==true)>
    /**
     * 使用sql分页查询
     *
     * @param sql
     * @param params 防SQL注入参数
     * @return
     */
    </#if>
    public DataPage findPageBySQL(final String sql, final Map<String,Object> params);

   <#if (gen.showComment==true)>
    /**
     * 根据条件查询单条数据,若没有则insert一条数据(where条件为等于)
     */
   </#if>
    public ${entityName}${gen.poPostfix} findOrInsertByEqualWhere(final ${entityName}${gen.queryPostfix}.WhereItem... whereItems);

}