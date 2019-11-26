package ${gen.managerImplPackage?replace("/",".")};

import java.util.*;

import ${gen.enumPackage?replace("/",".")}.*;
import ${gen.poPackage?replace("/",".")}.*;
import ${gen.managerPackage?replace("/",".")}.Gen${entityName}${gen.managerPostfix};
import ${gen.queryPackage?replace("/",".")}.${entityName}${gen.queryPostfix};
import ${gen.removePackage?replace("/",".")}.${entityName}${gen.removePostfix};
import ${gen.modifyPackage?replace("/",".")}.${entityName}${gen.modifyPostfix};
import ${gen.utilPackage?replace("/",".")}.ClazzUtil;
import ${gen.modelPackage?replace("/",".")}.DataPage;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import ${gen.utilPackage?replace("/",".")}.Zset;
<#--import ${gen.utilPackage?replace("/",".")}.ClazzUtil;-->

<#if (gen.showComment==true)>
/**
 * 限定一张表只有一个主键
 */
</#if>
@Component
public class Gen${entityName}${gen.managerImplPostfix} implements Gen${entityName}${gen.managerPostfix}{
    @Autowired private BaseManager bm;

<#if (gen.showComment==true)>
    /**
     * 根据原生sql查询
     */
</#if>
    public List<Map> selectList(String sql, Map<String, Object> params) {
        return bm.sqlMapper.selectList(sql, params);
    }

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    @Transactional
    @Override
    public boolean add(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.insert(o);
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 增加,忽略空值属性
     */
</#if>
    @Transactional
    @Override
    public boolean addWithOutNull(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.insertWithOutNull(o);
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 增加，忽略空值属性,属性类型为String时，不添加“”、“   ”
     */
</#if>
    @Transactional
    @Override
    public boolean addWithOutBlank(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.insertWithOutBlank(o);
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 增加
     */
</#if>
    @Transactional
    @Override
    public boolean add(final Collection<${entityName}${gen.poPostfix}> os) {
        for (${entityName}${gen.poPostfix} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.insert(o);
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 增加,忽略空值属性
     */
</#if>
    @Transactional
    @Override
    public boolean addWithOutNull(final Collection<${entityName}${gen.poPostfix}> os) {
        for (${entityName}${gen.poPostfix} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.insertWithOutNull(o);
        }
        return true;
    }
<#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键删除
     */
    </#if>
    @Transactional
    @Override
    public boolean delByIdObj(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.deleteByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>o.get${propertyName?cap_first}()</#list><#if propertyNameType_has_next>, </#if></#list>);
        }
        return true;
    }
</#if>
<#if ( info.po.keyList?size == 1 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键删除
     */
    </#if>
    @Transactional
    @Override
    public boolean delByIdObj(final Collection<${entityName}${gen.poPostfix}> os) {
        for (${entityName}${gen.poPostfix} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.deleteByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>o.get${propertyName?cap_first}()</#list><#if propertyNameType_has_next>, </#if></#list>);
        }
        return true;
    }
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
    @Transactional
    @Override
    public boolean delById(final ${propertyNameType[propertyName]}... os) {
        for (${propertyNameType[propertyName]} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.deleteByKey(o);
        }
        return true;
    }
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
    @Transactional
    @Override
    public boolean delById(final Collection<${propertyNameType[propertyName]}> os) {
        for (${propertyNameType[propertyName]} o : os) {
            bm.${entityName?uncap_first}${gen.mapperPostfix}.deleteByKey(o);
        }
        return true;
    }
        </#list>
    </#if>
</#list>
</#if>

<#if (gen.showComment==true)>
    /**
     * 根据条件删除
     */
</#if>
    @Transactional
    @Override
    public boolean del(final ${entityName}${gen.removePostfix} where) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.delete(where, new HashMap<>()) > 0;
    }

<#if (gen.showComment==true)>
    /**
     * 根据条件修改,空值的不设置
     */
</#if>
    @Transactional
    @Override
    public int modifyWithOutNull(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where) {
       <@modifyRong  isWithOutNull=true />
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.updateWithOutNull(o, where, new HashMap<>());
    }

<#if (gen.showComment==true)>
    /**
     * 根据条件修改，空值的亦设置
     */
</#if>
    @Transactional
    @Override
    public int modify(final ${entityName}${gen.poPostfix} o, final ${entityName}${gen.modifyPostfix} where) {
        <@modifyRong  isWithOutNull=false />
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.update(o, where, new HashMap<>());
    }

<#if (gen.showComment==true)>
    /**
     * 修改指定字段
     * @param modifier
     * @return
     */
</#if>
    @Override
    public int modifyColumn(${entityName}${gen.modifyPostfix} modifier) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.updateColumn(modifier, new HashMap<>());
    }

<#if (gen.showComment==true)>
    /**
     * 修改指定字段,值为null的不修改
     * @param modifier
     * @return
     */
</#if>
    @Override
    public int modifyColumnWithOutNull(${entityName}${gen.modifyPostfix} modifier) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.updateColumnWithOutNull(modifier, new HashMap<>());
    }

<#if (gen.showComment==true)>
    /**
     * 修改指定字段,值为null、""、"   "的不修改
     * @param modifier
     * @return
     */
</#if>
    @Override
    public int modifyColumnWithOutBlank(${entityName}${gen.modifyPostfix} modifier) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.updateColumnWithOutBlank(modifier, new HashMap<>());
    }

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置
     */
</#if>
    @Override
    public boolean modifyWithOutNullByKey(final ${entityName}${gen.poPostfix} o) {
        <@modifyRong  isWithOutNull=true />
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.updateWithOutNullByKey(o) == 1;
    }

<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置,属性类型为String时，值为""、"    "的也不设置
     */
</#if>
    @Override
    public boolean modifyWithOutBlankByKey(final ${entityName}${gen.poPostfix} o) {
        <@modifyRong  isWithOutNull=true />
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.updateWithOutBlankByKey(o) == 1;
    }
	
<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置
     */
</#if>
    @Transactional
    @Override
    public boolean modifyWithOutNullByKey(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@modifyRong  isWithOutNull=true />
            bm.${entityName?uncap_first}${gen.mapperPostfix}.updateWithOutNullByKey(o);
        }
        return true;
    }
	
<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置,属性类型为String时，值为""、"    "的也不设置
     */
</#if>
    @Transactional
    @Override
    public boolean modifyWithOutBlankByKey(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@modifyRong  isWithOutNull=true />
            bm.${entityName?uncap_first}${gen.mapperPostfix}.updateWithOutBlankByKey(o);
        }
        return true;
    }
	
<#if (gen.showComment==true)>
    /**
     * 根据主键修改,空值的不设置
     */
</#if>
    @Transactional
    @Override
    public boolean modifyWithOutNullByKey(final Collection<${entityName}${gen.poPostfix}> os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@modifyRong  isWithOutNull=true />
            bm.${entityName?uncap_first}${gen.mapperPostfix}.updateWithOutNullByKey(o);
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 根据主键修改，空值的亦设置
     */
</#if>
    @Transactional
    @Override
    public boolean modifyByKey(final ${entityName}${gen.poPostfix} o) {
        <@modifyRong isWithOutNull=false />
        bm.${entityName?uncap_first}${gen.mapperPostfix}.updateByKey(o);
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 根据主键修改，空值的亦设置
     */
</#if>
    @Transactional
    @Override
    public boolean modifyByKey(final ${entityName}${gen.poPostfix}... os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@modifyRong isWithOutNull=false />
             bm.${entityName?uncap_first}${gen.mapperPostfix}.updateByKey(o);
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 根据主键修改，空值的亦设置
     */
</#if>
    @Transactional
    @Override
    public boolean modifyByKey(final Collection<${entityName}${gen.poPostfix}> os) {
        for (${entityName}${gen.poPostfix} o : os) {
            <@modifyRong isWithOutNull=false />
             bm.${entityName?uncap_first}${gen.mapperPostfix}.updateByKey(o);
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     * @param query
     * @return
     */
</#if>
    @Override
    public ${entityName}${gen.poPostfix} findOne(final ${entityName}${gen.queryPostfix} query) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.selectOne(query, new HashMap<>());
    }
<#if ( info.po.keyList?size> 0 ) >

    <#if (gen.showComment==true)>
    /**
     * 根据主键查询
     */
    </#if>
    @Override
    public ${entityName}${gen.poPostfix} findByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.selectByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>);
    }
</#if>

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     * @param property
     * @return
     */
</#if>
    @Override
    public ${entityName}${gen.poPostfix} findPropertyByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>final ${propertyNameType[propertyName]} ${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, final ${entityName}${gen.queryPostfix} property) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.selectColumnByKey(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyName}</#list><#if propertyNameType_has_next>, </#if></#list>, property);
    }

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     * @param query
     * @return
     */
</#if>
    @Override
    public List<${entityName}${gen.poPostfix}> findList(final ${entityName}${gen.queryPostfix} query) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, new HashMap<>());
    }

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件,需保证ADD_SELECT_COLUMN 有且只有一个值
     * @param query
     * @return
     */
</#if>
    @Override
    public Zset findZset(final ${entityName}${gen.queryPostfix} query) {
        List<${entityName}${gen.poPostfix}> list = bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, new HashMap<>());
        ${entityName}${gen.queryPostfix}.COLUMN column = query.getSelectColumns().get(0);
        Zset set = new Zset();
        for (${entityName}${gen.poPostfix} po : list) {
            set.add(ClazzUtil.getFieldValue(po, column.name()));
        }
        return set;
    }

<#if (gen.showComment==true)>
    /**
     * 分页查询数据(只查给定的几个字段)
     * @param column
     * @param val
     * @return
     */
</#if>
    @Override
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN column, Object... val) {
        return findListWhereIn(column, 50, val);
    }

<#if (gen.showComment==true)>
    /**
     * 分页查询数据(只查给定的几个字段)
     * @param column
     * @param val
     * @return
     */
</#if>
    @Override
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN[] selectColumns, final ${entityName}${gen.queryPostfix}.COLUMN column, Object... val) {
        return findListWhereIn(selectColumns, column, 50, val);
    }

<#if (gen.showComment==true)>
    /**
     * 分页查询数据
     * @param column
     * @param pageSize
     * @param val
     * @return
     */
</#if>
    @Override
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN column, int pageSize, Object... val) {
        Set<Object> allVals = new HashSet<>();
        for (Object o : val) {
            if (o instanceof Set) {
                for (Object o1 : ((Set) o).toArray()) {
                    allVals.add(o1);
                }
            } else if (o instanceof List) {
                for (Object o1 : ((List) o).toArray()) {
                    allVals.add(o1);
                }
            }else {
                allVals.add(o);
            }
        }

        Map<String, Object> param = new HashMap<>();
        if (allVals.size() <= pageSize) {
            ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}().WHERE(column, WhereRelate.In, allVals);
            return bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, param);
        }
        List<${entityName}${gen.poPostfix}> all = new ArrayList<>();
        Set<Object> subVals = new HashSet<>();
        Object[] allObj = allVals.toArray();
        for (int i = 0; i < allObj.length; i++) {
            subVals.add(allObj[i]);
            if (i == allObj.length - 1) {
                ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}().WHERE(column, WhereRelate.In, subVals);
                List<${entityName}${gen.poPostfix}> list = bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, param);
                all.addAll(list);
                break;
            }
            if (i == 0 || i % pageSize == 0) {
                continue;
            }
            ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}().WHERE(column, WhereRelate.In, subVals);
            List<${entityName}${gen.poPostfix}> list = bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, param);
            all.addAll(list);
            subVals.clear();
        }
        return all;
    }

<#if (gen.showComment==true)>
    /**
     * 分页查询数据
     * @param column
     * @param pageSize
     * @param val
     * @return
     */
</#if>
    @Override
    public List<${entityName}${gen.poPostfix}> findListWhereIn(final ${entityName}${gen.queryPostfix}.COLUMN[] selectColumns, final ${entityName}${gen.queryPostfix}.COLUMN column, int pageSize, Object... val) {
        Set<Object> allVals = new HashSet<>();
        for (Object o : val) {
            if (o instanceof Set) {
                for (Object o1 : ((Set) o).toArray()) {
                    allVals.add(o1);
                }
            } else if (o instanceof List) {
                for (Object o1 : ((List) o).toArray()) {
                    allVals.add(o1);
                }
            }else {
                allVals.add(o);
            }
        }

        Map<String, Object> param = new HashMap<>();
        if (allVals.size() <= pageSize) {
            ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}().ADD_SELECT_COLUMN(selectColumns).WHERE(column, WhereRelate.In, allVals);
            return bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, param);
        }
        List<${entityName}${gen.poPostfix}> all = new ArrayList<>();
        Set<Object> subVals = new HashSet<>();
        Object[] allObj = allVals.toArray();
        for (int i = 0; i < allObj.length; i++) {
            subVals.add(allObj[i]);
            if (i == allObj.length - 1) {
                ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}().ADD_SELECT_COLUMN(selectColumns).WHERE(column, WhereRelate.In, subVals);
                List<${entityName}${gen.poPostfix}> list = bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, param);
                all.addAll(list);
                break;
            }
            if (i == 0 || i % pageSize == 0) {
                continue;
            }
            ${entityName}${gen.queryPostfix} query = new ${entityName}${gen.queryPostfix}().ADD_SELECT_COLUMN(selectColumns).WHERE(column, WhereRelate.In, subVals);
            List<${entityName}${gen.poPostfix}> list = bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, param);
            all.addAll(list);
            subVals.clear();
        }
        return all;
    }

<#if (gen.showComment==true)>
    /**
     * 自定义查询条件
     * @param params
     * @return
     */
</#if>
    @Override
    public List<${entityName}${gen.poPostfix}> findListBySQL(final String sql, final Map<String,Object> params) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.selectListBySQL(sql, params);
    }

<#if (gen.showComment==true)>
    /**
     * 根据sql进行count
     * @param params
     * @return
     */
</#if>
    @Override
    public long countBySQL(final String sql, final Map<String,Object> params) {
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.countBySQL(sql, params);
    }

<#if (gen.showComment==true)>
    /**
     * 查询数量
     */
</#if>
    @Override
    public long count(final ${entityName}${gen.queryPostfix} query){
        return bm.${entityName?uncap_first}${gen.mapperPostfix}.count(query, new HashMap());
    }

<#if (gen.showComment==true)>
    /**
     * 分页查询
     *
     * @param query
     * @return
     */
</#if>
    @Override
    public DataPage findPage(final ${entityName}${gen.queryPostfix} query) {
        DataPage page = new DataPage();
        Map<String, Object> params = new HashMap<>();
        long total = bm.${entityName?uncap_first}${gen.mapperPostfix}.count(query, params);
        List<${entityName}${gen.poPostfix}> data = bm.${entityName?uncap_first}${gen.mapperPostfix}.selectList(query, params);
        page.setTotal(total);
        page.setData(data);
        return page;
    }

<#if (gen.showComment==true)>
    /**
     * 使用sql分页查询
     * @param sql
     * @param params 防SQL注入参数
     * @return
     */
</#if>
    @Override
    public DataPage findPageBySQL(final String sql, final Map<String,Object> params) {
        DataPage page = new DataPage();
        long total = bm.${entityName?uncap_first}${gen.mapperPostfix}.countBySQL(sql, params);
        List<${entityName}${gen.poPostfix}> data = bm.${entityName?uncap_first}${gen.mapperPostfix}.selectListBySQL(sql, params);
        page.setTotal(total);
        page.setData(data);
        return page;
    }
<#if ( info.po.keyList?size == 1 ) >

    @Override
    public ${entityName}${gen.poPostfix} findByKey(final List<${entityName}${gen.poPostfix}> os, String keyVal){
        for (${entityName}${gen.poPostfix} o : os) {
            if(<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>o.get${propertyName?cap_first}()</#list><#if propertyNameType_has_next>, </#if></#list>.equals(keyVal)){
                return o;
            }
        }
        return null;
    }
</#if>

    @Override
    public ${entityName}${gen.poPostfix} findByProperty(final List<${entityName}${gen.poPostfix}> os, ${entityName}${gen.queryPostfix}.COLUMN column, String val) {
        for (${entityName}${gen.poPostfix} o : os) {
            String prop = column.name();
            Object propVal = ClazzUtil.getFieldValue(o, prop);
            if (propVal instanceof String) {
                if (((String) propVal).equals(val)) {
                    return o;
                }
            }
        }
        return null;
    }

    @Override
    public List<${entityName}${gen.poPostfix}> findListByProperty(final List<${entityName}${gen.poPostfix}> os, ${entityName}${gen.queryPostfix}.COLUMN column, String val) {
        List<${entityName}${gen.poPostfix}> list = new ArrayList<>();
        for (${entityName}${gen.poPostfix} o : os) {
            String prop = column.name();
            Object propVal = ClazzUtil.getFieldValue(o, prop);
            if (propVal instanceof String) {
                if (((String) propVal).equals(val)) {
                    list.add(o);
                }
            }
        }
        return list;
    }

<#if (gen.showComment==true)>
    /**
     * @param query
     * @return map<key,PO>
     */
</#if>
    public Map<<#list info.po.keyList as propertyNameType><#list propertyNameType?keys as propertyName>${propertyNameType[propertyName]}</#list><#if propertyNameType_has_next>, </#if></#list>,${entityName}${gen.poPostfix}> findKeyPOMap(final ${entityName}${gen.queryPostfix} query){
        return null;
    }

}
<#--  更新冗余字段  -->
<#macro modifyRong isWithOutNull>
        <#if javaCollection.getAnnotationByName("Rong")?? && (javaCollection.getAnnotationByName("Rong")?size > 0)>
            <#list javaCollection.getAnnotationByName("Rong") as POProperty>
                <#list POProperty.entityProperty as EntityProperty>
                    <#if EntityProperty.sourceKeyEntity == entityName>
        {
            <#if isWithOutNull>
            if (null != o.get${EntityProperty.sourceSameProperty?cap_first}()) {
            </#if>
                ${EntityProperty.targetKeyEntity}${gen.poPostfix} po = new ${EntityProperty.targetKeyEntity}${gen.poPostfix}().set${EntityProperty.targetSameProperty?cap_first}(o.get${EntityProperty.sourceSameProperty?cap_first}());
                ${EntityProperty.targetKeyEntity}${gen.modifyPostfix} whereAnother = new ${EntityProperty.targetKeyEntity}${gen.modifyPostfix}().WHERE(${EntityProperty.targetKeyEntity}${gen.modifyPostfix}.COLUMN.${EntityProperty.targetKeyProperty}, WhereRelate.Equal, o.get${EntityProperty.sourceKeyProperty?cap_first}());
                bm.${EntityProperty.targetKeyEntity?uncap_first}${gen.mapperPostfix}.updateWithOutNull(po, whereAnother, new HashMap<>());
            <#if isWithOutNull>
            }
            </#if>
        }
          
                    </#if>
                </#list>
            </#list>
        </#if>
</#macro>