package ${gen.serviceImplPackage?replace("/",".")};

import java.util.*;

import ${gen.enumPackage?replace("/",".")}.*;
import ${gen.poPackage?replace("/",".")}.*;
import ${gen.servicePackage?replace("/",".")}.Gen${entityName}${gen.servicePostfix};
import ${gen.queryPackage?replace("/",".")}.*;
import ${gen.removePackage?replace("/",".")}.${entityName}${gen.removePostfix};
import ${gen.modifyPackage?replace("/",".")}.${entityName}${gen.modifyPostfix};
import ${gen.modelPackage?replace("/",".")}.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.constantsPackage?replace("/",".")}.*;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class Gen${entityName}${gen.serviceImplPostfix} implements Gen${entityName}${gen.servicePostfix} {
    private  Logger log = LoggerFactory.getLogger(this.getClass());
    @Autowired private BaseService bs;

    /**
     * 增加
     */
    @Override
    public ResponseModel add(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@setUnionId obj="o"/>
            <@setPwd obj="o"/>
            <@setDefaultEqual obj="o"/>
            <@setCreateModifyTime obj="o"/>
        }
        
        try {
            bs.gen${entityName}${gen.managerPostfix}.add(os);
        } catch (Exception ex) {
            if (ex instanceof DuplicateKeyException) {
                log.error("数据库DuplicateKeyException", ex);
                return ResponseModel.error(GenConstant.repeat);
            }
            log.error("数据库操作异常",ex);
        }
        return ResponseModel.ok().setCode(0);
    }

    /**
     * 增加
     */
    @Override
    public ResponseModel addWithOutNull(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@setUnionId obj="o"/>
            <@setPwd obj="o"/>
            <@setDefaultEqual obj="o"/>
            <@setCreateModifyTime obj="o"/>
        }

        try {
            bs.gen${entityName}${gen.managerPostfix}.addWithOutNull(os);
        } catch (Exception ex) {
            if (ex instanceof DuplicateKeyException) {
                log.error("数据库DuplicateKeyException", ex);
                return ResponseModel.error(GenConstant.repeat).setCode(1);
            }
        }
        return ResponseModel.ok().setCode(0);
    }

    /**
     * 增加
     */
    @Override
    public ResponseModel addWithOutBlank(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@setUnionId obj="o"/>
            <@setPwd obj="o"/>
            <@setDefaultEqual obj="o"/>
            <@setCreateModifyTime obj="o"/>
        }

        try {
            bs.gen${entityName}${gen.managerPostfix}.addWithOutBlank(os);
        } catch (Exception ex) {
            if (ex instanceof DuplicateKeyException) {
                log.error("数据库DuplicateKeyException", ex);
                return ResponseModel.error(GenConstant.repeat).setCode(1);
            }
        }
        return ResponseModel.ok().setCode(0);
    }

    /**
     * 增加
     */
    @Override
    public ResponseModel add(final Collection<${entityName}${gen.poPostfix}> os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@setUnionId obj="o"/>
            <@setPwd obj="o"/>
            <@setDefaultEqual obj="o"/>
            <@setCreateModifyTime obj="o"/>
        }
        
        try {
            bs.gen${entityName}${gen.managerPostfix}.add(os);
        } catch (Exception ex) {
            if (ex instanceof DuplicateKeyException) {
                log.error("数据库DuplicateKeyException", ex);
                return ResponseModel.error(GenConstant.repeat).setCode(1);
            }
            log.error("数据库操作异常",ex);
        }
        return ResponseModel.ok().setCode(0);
    }

    /**
     * 增加
     */
    @Override
    public ResponseModel addWithOutNull(final Collection<${entityName}${gen.poPostfix}> os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@setUnionId obj="o"/>
            <@setPwd obj="o"/>
            <@setDefaultEqual obj="o"/>
            <@setCreateModifyTime obj="o"/>
        }

        try {
            bs.gen${entityName}${gen.managerPostfix}.addWithOutNull(os);
        } catch (Exception ex) {
            if (ex instanceof DuplicateKeyException) {
                log.error("数据库DuplicateKeyException", ex);
                return ResponseModel.error(GenConstant.repeat).setCode(1);
            }
        }
        return ResponseModel.ok().setCode(0);
    }

    /**
     * 使用给定的Where查询，若查询不到则增加一条记录
     */
    @Override
    public boolean addIfAbsentByWhere(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.queryPostfix}.WhereItem whereItem) {
        ${entityName}${gen.poPostfix} oo = findOneByWhere(whereItem);
        if (null != oo) {
            return true;
        }
        add(o);
        return true;
    }

    /**
     * 根据条件查询，若查询不到则增加一条记录
     */
    @Override
    public ResponseModel addIfAbsentByQuery(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.queryPostfix} query) {
        long num = count(query);
        if (num >= 1) {
            return ResponseModel.ok("库中先前已经存在。").setCode(1);
        }
        return add(o);
    }
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

    /**
     * 增加自己的
     */
    @Override
    public boolean addMine(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@setUnionId obj="o"/>
            <@setPwd obj="o"/>
            <@setDefaultEqual obj="o"/>
            <@setMine obj=POproperty/>
            <@setCreateModifyTime obj="o"/>
        }
        bs.gen${entityName}${gen.managerPostfix}.add(os);
        return true;
    }
        <#break>
        </#if>
    </#list>
</#if>

<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

    /**
     * 增加自己的
     */
    @Override
    public boolean addMine(final Collection<${entityName}${gen.poPostfix}> os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@setUnionId obj="o"/>
            <@setPwd obj="o"/>
            <@setDefaultEqual obj="o"/>
            <@setMine obj=POproperty/>
            <@setCreateModifyTime obj="o"/>
        }
        bs.gen${entityName}${gen.managerPostfix}.add(os);
        return true;
    }
        <#break>
        </#if>
    </#list>
</#if>

<#if ( info.po.keyList?size> 0 ) >
    /**
     * 根据主键删除
     */
    @Override
    public ResponseModel delByIdObj(final ${entityName}${gen.poPostfix}... os) {
        ${entityName}${gen.removePostfix} where = new ${entityName}${gen.removePostfix}();
        List idList = new ArrayList<>();
        for (${entityName}${gen.poPostfix} o : os) {
            idList.add(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>o.get${propertyName?cap_first}()</#list><#break></#list>);
        }
        where.WHERE(${entityName}${gen.removePostfix}.COLUMN.<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#break></#list>, WhereRelate.In, idList);
        bs.gen${entityName}${gen.managerPostfix}.del(where);
        return ResponseModel.ok().setCode(0);
    }
</#if>

<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">
            <#if ( info.po.keyList?size> 0 ) >
    /**
     * 根据主键删除自己的
     */
    @Override
    public boolean delMineByIdObj(final ${entityName}${gen.poPostfix}... os) {
        ${entityName}${gen.removePostfix} where = new ${entityName}${gen.removePostfix}();
        List idList = new ArrayList<>();
        for (${entityName}${gen.poPostfix} o : os) {
            idList.add(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>o.get${propertyName?cap_first}()</#list><#break></#list>);
        }
        where.WHERE(${entityName}${gen.removePostfix}.COLUMN.<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#break></#list>, WhereRelate.In, idList);
        <@removeWhereMine obj=POproperty/>
        bs.gen${entityName}${gen.managerPostfix}.del(where);
        return true;
    }
            </#if>
        <#break>
        </#if>
    </#list>
</#if>

<#if ( info.po.keyList?size == 1 ) >
    /**
     * 根据主键删除
     */
    @Override
    public boolean delByIdObj(final Collection<${entityName}${gen.poPostfix}> os) {
        ${entityName}${gen.removePostfix} where = new ${entityName}${gen.removePostfix}();
        List idList = new ArrayList<>();
        for (${entityName}${gen.poPostfix} o : os) {
            idList.add(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>o.get${propertyName?cap_first}()</#list><#break></#list>);
        }
        where.WHERE(${entityName}${gen.removePostfix}.COLUMN.<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#break></#list>, WhereRelate.In, idList);
        bs.gen${entityName}${gen.managerPostfix}.del(where);        
        return true;        
    }
</#if>
<#if ( info.po.keyList?size == 1 ) >
    <#list info.po.keyList as propertyNameType>
        <#if propertyNameType_index==0>
            <#list propertyNameType?keys as propertyName>

    /**
     * 根据主键删除
     */
    @Override
    public ResponseModel delById(final ${propertyNameType[propertyName]}... os) {
        ${entityName}${gen.removePostfix} where = new ${entityName}${gen.removePostfix}();
        where.WHERE(${entityName}${gen.removePostfix}.COLUMN.<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#break></#list>, WhereRelate.In, os);
        bs.gen${entityName}${gen.managerPostfix}.del(where);
        return ResponseModel.ok().setCode(0);
    }
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
    @Override
    public ResponseModel delById(final Collection<${propertyNameType[propertyName]}> os) {
        ${entityName}${gen.removePostfix} where = new ${entityName}${gen.removePostfix}();
        where.WHERE(${entityName}${gen.removePostfix}.COLUMN.<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#break></#list>, WhereRelate.In, os);
        bs.gen${entityName}${gen.managerPostfix}.del(where);
        return ResponseModel.ok().setCode(0);
    }
        </#list>
    </#if>
</#list>
</#if>

    /**
     * 根据条件删除
     */
    @Override
    public ResponseModel del(final ${entityName}${gen.removePostfix} where) {
        boolean success = bs.gen${entityName}${gen.managerPostfix}.del(where);
        if (success) {
            return ResponseModel.ok().setCode(0);
        }
        return ResponseModel.ok().setCode(1);
    }

    /**
     * 根据条件修改,空值的不设置
     */
    @Override
    public ResponseModel modifyWithOutNull(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where) {
        int num = bs.gen${entityName}${gen.managerPostfix}.modifyWithOutNull(o, where);
        if (num > 0) {
            return ResponseModel.ok().setCode(0);
        }
        return ResponseModel.ok().setCode(1);
    }

    /**
     * 根据条件修改，空值的亦设置
     */
    @Override
    public ResponseModel modify(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where) {
        int num = bs.gen${entityName}${gen.managerPostfix}.modify(o, where);
        if (num > 0) {
            return ResponseModel.ok().setCode(0);
        }
        return ResponseModel.ok().setCode(1);
    }

    /**
     * 根据条件修改，修改指定的字段
     */
    @Override
    public ResponseModel modifyProperty(final ${entityName}${gen.modifyPostfix} property) {
        int num = bs.gen${entityName}${gen.managerPostfix}.modifyColumn(property);
        if (num > 0) {
            return ResponseModel.ok().setCode(0);
        }
        return ResponseModel.ok().setCode(1);
    }

    /**
     * 根据条件修改，修改指定的字段,值为null的不修改
     */
    @Override
    public ResponseModel modifyPropertyWithOutNull(final ${entityName}${gen.modifyPostfix} property) {
        int num = bs.gen${entityName}${gen.managerPostfix}.modifyColumnWithOutNull(property);
        if (num > 0) {
            return ResponseModel.ok().setCode(0);
        }
        return ResponseModel.ok().setCode(1);
    }

    /**
     * 根据条件修改，修改指定的字段,值为null、""、"   "的不修改
     */
    @Override
    public ResponseModel modifyPropertyWithOutBlank(final ${entityName}${gen.modifyPostfix} property) {
        int num = bs.gen${entityName}${gen.managerPostfix}.modifyColumnWithOutBlank(property);
        if (num > 0) {
            return ResponseModel.ok().setCode(0);
        }
        return ResponseModel.ok().setCode(1);
    }

    /**
     * 根据主键修改,空值的不设置
     */
    @Override
    public ResponseModel modifyWithOutNullByKey(final ${entityName}${gen.poPostfix} o) {
        boolean success = bs.gen${entityName}${gen.managerPostfix}.modifyWithOutNullByKey(o);
        if(success){
           return ResponseModel.ok().setCode(0);
        }
        return ResponseModel.error().setCode(1);
    }

    /**
     * 根据主键修改,空值的不设置,当属性类型为String时，""、"    "的值不设置
     */
    @Override
    public ResponseModel modifyWithOutBlankByKey(final ${entityName}${gen.poPostfix} o) {
        boolean success = bs.gen${entityName}${gen.managerPostfix}.modifyWithOutBlankByKey(o);
        if(success){
           return ResponseModel.ok().setCode(0);
        }
        return ResponseModel.error().setCode(1);
    }
	
    /**
     * 根据主键修改，空值的亦设置
     */
    @Override
    public ResponseModel modifyByKey(${entityName}${gen.poPostfix} o) {
        bs.gen${entityName}${gen.managerPostfix}.modifyByKey(o);
        return ResponseModel.ok().setCode(0);
    }

    /**
     * 自定义查询条件
     *
     * @param query
     * @return
     */
    @Override
    public ${entityName}${gen.poPostfix} findOne(final ${entityName}${gen.queryPostfix} query) {
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findOne(query);
        return o;
    }

    /**
     * 自定义查询条件
     *
     * @param requestModel
     * @return
     */
    @Override
    public ${entityName}${gen.poPostfix} findOne(final RequestModel requestModel) {
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findOne(createQuery(requestModel));
        return o;
    }

    /**
     * 自定义查询条件,隐藏字段置空
     *
     * @param query
     * @return
     */
    @Override
    public ${entityName}${gen.poPostfix} findOneExcludeHidden(final ${entityName}${gen.queryPostfix} query) {
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findOne(query);
        <@setHiddenNull obj="o"/>
        return o;
    }

    /**
     * 自定义查询条件
     *
     * @param requestModel
     * @return
     */
    @Override
    public ${entityName}${gen.poPostfix} findOneExcludeHidden(final RequestModel requestModel) {
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findOne(createQuery(requestModel));
        <@setHiddenNull obj="o"/>
        return o;
    }

<#if ( info.po.keyList?size> 0 ) >
    /**
     * 根据主键查询
     */
    @Override
    public ResponseModel findExcludeHiddenByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>) {
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
        <@setHiddenNull obj="o"/>
        return ResponseModel.ok().setCode(0).setData(o);
    }
</#if>

<#if ( info.po.keyList?size> 0 ) >
    /**
     * 根据主键查询(含隐藏字段)
     */
    @Override
    public ${entityName}${gen.poPostfix} findByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>) {
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
        return o;
    }
</#if>

    /**
     * 根据条件查询
     */
    @Override
    public ${entityName}${gen.poPostfix} findOneByWhere(final ${entityName}${gen.queryPostfix}.WhereItem ... items) {
        ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}();
        for (${entityName}${gen.queryPostfix}.WhereItem item : items) {
            if(item.isOr()){
                query.OR_WHERE(item.getColumn(),item.getWhereRelate(),item.getVal());
            }else {
                query.WHERE(item.getColumn(),item.getWhereRelate(),item.getVal());
            }
        }
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findOne(query);
        <@setHiddenNull obj="o"/>
        return o;
    }
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">
    
    /**
     * 根据条件查询单条数据
     */
    @Override
    public ${entityName}${gen.poPostfix} findMineOneByWhere(final ${entityName}${gen.queryPostfix}.WhereItem ... items) {
        ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}();
        for (${entityName}${gen.queryPostfix}.WhereItem item : items) {
            if (item.isOr()) {
                query.OR_WHERE(item.getColumn(),item.getWhereRelate(),item.getVal());
            } else {
                query.WHERE(item.getColumn(),item.getWhereRelate(),item.getVal());
            }
        }
        <@queryWhereMine obj=POproperty/>
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findOne(query);
        <@setHiddenNull obj="o"/>
        return o;
    }
        <#break>
        </#if>
    </#list>
</#if>

    /**
     * 自定义查询条件
     * @param property
     * @return
     */
    @Override
    public ${entityName}${gen.poPostfix} findPropertyByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, final ${entityName}${gen.queryPostfix} property) {
        ${entityName}${gen.poPostfix} o = bs.gen${entityName}${gen.managerPostfix}.findPropertyByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, property);
        <@setHiddenNull obj="o"/>
        return o;
    }

    /**
     * 自定义查询条件
     * @param query
     * @return
     */
    @Override
    public List<${entityName}${gen.poPostfix}> findList(final ${entityName}${gen.queryPostfix} query) {
        List<${entityName}${gen.poPostfix}> list = bs.gen${entityName}${gen.managerPostfix}.findList(query);
        if (null == list) {
            return null;
        }
        for (${entityName}${gen.poPostfix} o : list) {
            <@setHiddenNull obj="o"/>
        }
        return list;
    }

    /**
     * 自定义查询条件
     *
     * @param requestModel
     * @return ${entityName}列表
     */
    @Override
    public List<${entityName}${gen.poPostfix}> findLs(final RequestModel requestModel) {
        List<${entityName}${gen.poPostfix}> list = bs.gen${entityName}${gen.managerPostfix}.findList(createQuery(requestModel));
        for (${entityName}${gen.poPostfix} o : list) {
            <@setHiddenNull obj="o"/>
        }
		return list;
    }

    /**
     * 自定义查询条件
     */
    @Override
    public ResponseModel findList(final RequestModel requestModel) {
        return ResponseModel.ok().setCode(0).setData(findLs(requestModel));
    }
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

    /**
     * 自定义查询条件,查询自己的${entityName}列表
     *
     * @param q
     * @return
     */
    @Override
    public List<${entityName}${gen.poPostfix}> findMineList(List<Map> q) {
        // TODO 转换成 ${entityName}${gen.queryPostfix}
        ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}();
        List<${entityName}${gen.poPostfix}> list = bs.gen${entityName}${gen.managerPostfix}.findList(query);
        if(null == list) {
            return null;
        }
        for(${entityName}${gen.poPostfix} o : list){
            <@setHiddenNull obj="o"/>
        }
        return list;
    }
        <#break>
        </#if>
    </#list>
</#if>

    /**
     * 自定义查询条件
     *
     * @param params
     * @return
     */
    @Override
    public List<${entityName}${gen.poPostfix}> findListBySQL(final String sql, final Map<String,Object> params) {
        List<${entityName}${gen.poPostfix}> list = bs.gen${entityName}${gen.managerPostfix}.findListBySQL(sql, params);
        if(null == list) {
            return null;
        }
        for(${entityName}${gen.poPostfix} o : list){
            <@setHiddenNull obj="o"/>
        }
        return list;
    }

    /**
     * 根据sql进行count
     *
     * @param params
     * @return
     */
    @Override
    public long countBySQL(final String sql, final Map<String,Object> params) {
        return bs.gen${entityName}${gen.managerPostfix}.countBySQL(sql, params);
    }

    /**
     * 查询数量
     */
    @Override
    public long count(final ${entityName}${gen.queryPostfix} query){
        return bs.gen${entityName}${gen.managerPostfix}.count(query);
    }

    /**
     * 查询数量
     */
    @Override
    public ResponseModel count(final RequestModel requestModel){
        ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}();
        for (RequestModel.WhereItem whereItem : requestModel.getWhereItems()) {
            if (whereItem.isOr()) {
                query.OR_WHERE(${entityName}${gen.queryPostfix}.COLUMN.nameOf(whereItem.getProp()), whereItem.getWhereRelate(), whereItem.getVals());
            } else {
                query.WHERE(${entityName}${gen.queryPostfix}.COLUMN.nameOf(whereItem.getProp()), whereItem.getWhereRelate(), whereItem.getVals());
            }
        }            
        long count = bs.gen${entityName}${gen.managerPostfix}.count(query);
        return ResponseModel.ok().setCode(0).setData(count);
    }

    /**
     * 查询数量(多个)
     */
    @Override
    public ResponseModel[] counts(final RequestModel[] requestModels){
        ResponseModel[] rms = new ResponseModel[requestModels.length];
        for (int i = 0; i < requestModels.length; i++) {
            RequestModel requestModel = requestModels[i];
            ResponseModel response = ResponseModel.ok().setCode(0);
            rms[i] = response;
            ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}();
            for (RequestModel.WhereItem whereItem : requestModel.getWhereItems()) {
                if (whereItem.isOr()) {
                    query.OR_WHERE(${entityName}${gen.queryPostfix}.COLUMN.nameOf(whereItem.getProp()), whereItem.getWhereRelate(), whereItem.getVals());
                } else {
                    query.WHERE(${entityName}${gen.queryPostfix}.COLUMN.nameOf(whereItem.getProp()), whereItem.getWhereRelate(), whereItem.getVals());
                }
            }            
            long count = bs.gen${entityName}${gen.managerPostfix}.count(query);
            response.setData(count);
        }
        return rms;
    }

    /**
     * 查询数量
     */
    @Override
    public long count(final List<Map> q){
        ${entityName}${gen.queryPostfix} query  = new ${entityName}${gen.queryPostfix}();
        return bs.gen${entityName}${gen.managerPostfix}.count(query);
    }

    /**
     * 分页查询
     *
     * @param query
     * @return
     */
    @Override
    public DataPage findPage(final ${entityName}${gen.queryPostfix} query) {
        DataPage page = bs.gen${entityName}${gen.managerPostfix}.findPage(query);
        List<${entityName}${gen.poPostfix}> data = page.getData();
        if (null == data) {
            return page;
        }
        for (${entityName}${gen.poPostfix} o : data) {
            <@setHiddenNull obj="o"/>
        }
        return page;
    }

    /**
     * 分页查询
     */
    @Override
    public DataPage findPage(final RequestModel requestModel) {
        DataPage page = bs.gen${entityName}${gen.managerPostfix}.findPage(createQuery(requestModel, true));
        List<${entityName}${gen.poPostfix}> data = page.getData();
        if (null == data) {
            return page;
        }
        for (${entityName}${gen.poPostfix} o : data) {
            <@setHiddenNull obj="o"/>
        }
        return page;
    }

    /**
     * 分页查询
     */
    @Override
    public ResponseModel findPageModel(final RequestModel requestModel) {
        DataPage page = findPage(requestModel);
        ResponseModel responseModel = ResponseModel.ok().setCode(0);
        responseModel.setTotal(page.getTotal());
        responseModel.setData(page.getData());
        return responseModel;
    }

    /**
     * 使用sql分页查询
     *
     * @param sql
     * @param params 防SQL注入参数
     * @return
     */
    @Override
    public DataPage findPageBySQL(final String sql, final Map<String,Object> params) {
        DataPage page = bs.gen${entityName}${gen.managerPostfix}.findPageBySQL(sql, params);
        List<${entityName}${gen.poPostfix}> data = page.getData();
        if (null == data) {
            return page;
        }
        for (${entityName}${gen.poPostfix} o : data) {
            <@setHiddenNull obj="o"/>
        }
        return page;        
    }

    /**
     * 根据条件查询单条数据,若没有则insert一条数据(where条件为等于)
     */
    @Override
    public ${entityName}${gen.poPostfix} findOrInsertByEqualWhere(final ${entityName}${gen.queryPostfix}.WhereItem... whereItems) {
        ${entityName}${gen.poPostfix} o = findOneByWhere(whereItems);
        if (null != o) {
            return o;
        }
        o = new ${entityName}${gen.poPostfix}();
        for (${entityName}${gen.queryPostfix}.WhereItem whereItem : whereItems) {
            ClazzUtil.setFieldValue(o, whereItem.getColumn().name(), whereItem.getVal()[0]);
        }
        add(o);
        return findOneByWhere(whereItems);
    }

    private ${entityName}${gen.queryPostfix} createQuery(final RequestModel requestModel) {
        return createQuery(requestModel, false);
    }

	private ${entityName}${gen.queryPostfix} createQuery(final RequestModel requestModel, boolean page) {
		${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}();
        query.setFirstResult(requestModel.getOffset());
        if (page) {
            query.setMaxResults(requestModel.getPageSize() > GenConstant.defaultMaxResults ? GenConstant.defaultMaxResults : requestModel.getPageSize());
        } else {
            query.setMaxResults(GenConstant.defaultMaxResults);
        }

        List<String> props = requestModel.getProps();
        if (props != null) {
            for (String prop : props) {
                if (prop == null || prop.trim().length() < 1) {
                    continue;
                }
                ${entityName}${gen.queryPostfix}.COLUMN column = ${entityName}${gen.queryPostfix}.COLUMN.nameOf(prop);
                if (null != column) {
                    query.ADD_SELECT_COLUMN(column);
                }
            }
        }

        if (requestModel.getAsc() != null) {
            for (String prop : requestModel.getAsc()) {
                ${entityName}${gen.queryPostfix}.COLUMN column = ${entityName}${gen.queryPostfix}.COLUMN.nameOf(prop);
                if (null != column) {
                    query.ORDER_BY_ASC(column);
                }
            }
        }

        if (requestModel.getDesc() != null) {
            for (String prop : requestModel.getDesc()) {
                ${entityName}${gen.queryPostfix}.COLUMN column = ${entityName}${gen.queryPostfix}.COLUMN.nameOf(prop);
                if (null != column) {
                    query.ORDER_BY_DESC(column);
                }
            }
        }
        if (requestModel.getWhereItems() != null) {
            for (RequestModel.WhereItem whereItem : requestModel.getWhereItems()) {
                if (whereItem != null && (WhereRelate.IsNotNull == whereItem.getWhereRelate() || WhereRelate.IsNull == whereItem.getWhereRelate())) {
                    if (whereItem.isOr()) {
                        ${entityName}${gen.queryPostfix}.COLUMN column = ${entityName}${gen.queryPostfix}.COLUMN.nameOf(whereItem.getProp());
                        if (null != column) {
                            query.OR_WHERE(column, whereItem.getWhereRelate());
                        }
                    } else {
                        ${entityName}${gen.queryPostfix}.COLUMN column = ${entityName}${gen.queryPostfix}.COLUMN.nameOf(whereItem.getProp());
                        if (null != column) {
                            query.WHERE(column, whereItem.getWhereRelate());
                        }
                    }
                    continue;
                }
                if (whereItem != null && whereItem.getVals() != null && whereItem.getVals().length > 0) {
                  for (Object val : whereItem.getVals()) {
                      if (val == null) {
                          continue;
                      }
                      if (val instanceof String) {
                          if (((String) val).trim().length() < 1 || "undefined".equals(val)) {
                              continue;
                          }
                      }
                      if (whereItem.isOr()) {
                          ${entityName}${gen.queryPostfix}.COLUMN column = ${entityName}${gen.queryPostfix}.COLUMN.nameOf(whereItem.getProp());
                          if (null != column) {
                              query.OR_WHERE(column, whereItem.getWhereRelate(), whereItem.getVals());
                          }
                      } else {
                          ${entityName}${gen.queryPostfix}.COLUMN column = ${entityName}${gen.queryPostfix}.COLUMN.nameOf(whereItem.getProp());
                          if (null != column) {
                              query.WHERE(column, whereItem.getWhereRelate(), whereItem.getVals());
                          }
                      }                      
                  }
                }
            }
        }
		return query;
	}
}
<#macro setUnionId obj>
<#if ( info.po.keyList?size == 1 ) >
    <#list info.po.keyList as propertyNameType>
        <#if propertyNameType_index==0 >
        <#list propertyNameType?keys as propertyName>
            <#if propertyNameType[propertyName]?lower_case = "string">
            if (o.get${propertyName?cap_first}() == null || o.get${propertyName?cap_first}().trim().length() < 1) {
                ${obj}.set${propertyName?cap_first}(Unique.unique25());
            }
            <#elseif  propertyNameType[propertyName]?lower_case = "long">
            ${obj}.set${propertyName?cap_first}(Unique.uniqueLong());
            </#if>
        </#list>
    </#if>
</#list>
</#if>
</#macro>

<#macro setCreateModifyTime obj>
<#list info.po.objectPropertyJavaTypeMap?keys as propertyName>
            <#if propertyName?lower_case = "createtime" || propertyName?lower_case = "modifytime" && info.po.objectPropertyJavaTypeMap[propertyName] = "Date">
            ${obj}.set${propertyName?cap_first}(Calendar.getInstance().getTime());
            </#if>
</#list>
</#macro>

 <#macro setPwd obj>
    <#if javaCollection.getAnnotationByName("Pwd")??>
        <#list javaCollection.getAnnotationByName("Pwd") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">
            if (${obj}.get${POproperty.property?cap_first}() != null) {
                ${obj}.set${POproperty.property?cap_first}(Encrypt.pwd(${obj}.get${POproperty.property?cap_first}()));
            }
            </#if>
        </#list>
    </#if>    
</#macro>        

<#macro setMine obj>
            o.set${obj.property?cap_first}((${obj.propertyType}) ContextHandler.Instance.getUserId());
</#macro> 
<#--  <#macro whereMine obj>  -->
<#macro removeWhereMine obj>
        where.WHERE(${entityName}${gen.removePostfix}.COLUMN.${obj.property}, WhereRelate.Equal, ((${obj.propertyType}) ContextHandler.Instance.getUserId()));
</#macro>

<#macro queryWhereMine obj>
        query.WHERE(${entityName}${gen.queryPostfix}.COLUMN.${obj.property}, WhereRelate.Equal, ((${obj.propertyType}) ContextHandler.Instance.getUserId()));
</#macro>

<#macro setHiddenNull obj>
    <#if javaCollection.getAnnotationByName("Hidden")??>
        <#list javaCollection.getAnnotationByName("Hidden") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">
            if (null != ${obj}) {
                ${obj}.set${POproperty.property?cap_first}(null);
            }
            </#if>
        </#list>
    </#if>
</#macro>

<#macro setDefaultEqual obj>
    <#if javaCollection.getAnnotationByName("DefaultEqual")??>
        <#list javaCollection.getAnnotationByName("DefaultEqual") as POProperty>
            <#list POProperty.entityProperty as EntityProperty>
                <#if POProperty.po.entityName=="${entityName}">
            if (o.get${EntityProperty.targetProperty?cap_first}() == null) {
                ${obj}.set${EntityProperty.targetProperty?cap_first}(${obj}.get${EntityProperty.sourceProperty?cap_first}());
            }                
                </#if>
            </#list>    
        </#list>
    </#if>    
</#macro>     