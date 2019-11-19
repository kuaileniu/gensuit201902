package ${gen.mapperPackage?replace("/",".")};

import ${gen.providerPackage?replace("/",".")}.SqlProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.UpdateProvider;

import java.util.List;
import java.util.Map;

@Mapper
public interface SqlMapper {

<#if (gen.showComment==true)>
    /**
     * @param sql example： "delete  from t_order where id > ${r"#"}{p.id}  order by ${r"#"}{p.ob} ";
     * @param params where中的参数, params.put("id",7);  params.put("ob","id");
     * 可以多表关联删除
     */
</#if>
    @DeleteProvider(type = SqlProvider.class, method = "nativeSql")
    public long delete(String sql, @Param("p") Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * @param sql example： "update t_order set user_name = ${r"#"}{userName} where id > ${r"#"}{p.id}  order by ${r"#"}{p.ob} ";
     * @param params where中的参数,params.put("userName","Joker");  params.put("id",7);  params.put("ob","id");
     * 可以多表关联更新
     */
</#if>
    @UpdateProvider(type= SqlProvider.class, method= "nativeSql")
    public long update(String sql, @Param("p") Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * @param sql example： "select *   from t_order where id > ${r"#"}{p.id}  order by ${r"#"}{p.ob} ";
     * @param params where中的参数, params.put("id",7);  params.put("ob","id");
//        String sql = "select " + ProjectQuery.COLUMN.erJiOrgId.column() + " ,count(1) as num from " + ProjectQuery.TABLE_NAME
//                + " where " + ProjectQuery.COLUMN.erJiOrgId.column() + " in ('4bj2657cqaslkv3ndpz4tu7j7','5i6f0lo6c81yxdy839qomr14') group by " + ProjectQuery.COLUMN.erJiOrgId.column();
     * 防注入时，需要为in中的每个单独设置,例如 in(#{},#{})
     * 可以多表查询
     */
</#if>
    @SelectProvider(type = SqlProvider.class, method = "nativeSql")
    public List<Map> selectList(String sql, @Param("p") Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * @param sql example： "select *   from t_order where id = ${r"#"}{p.id} ";
     * @param params where中的参数, params.put("id",1);
     * 可以多表查询
     * 结果集无数据时 返回的Map为null
     */
</#if>
    @SelectProvider(type = SqlProvider.class, method = "nativeSql")
    public Map selectOne(String sql, @Param("p") Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * @param sql example： "count(1)   from t_order where id > ${r"#"}{p.id}  order by ${r"#"}{p.ob} ";
     * @param params where中的参数, params.put("id",7);  params.put("ob","id");
     * 可以多表关联查询
     */
</#if>
    @SelectProvider(type = SqlProvider.class, method = "nativeSql")
    public long count(String sql, @Param("p") Map<String,Object> params);

<#if (gen.showComment==true)>
    /**
     * 组装参数
     */
</#if>
    default public String param(String paramName, Object paramVal, Map params) {
        params.put(paramName, paramVal);
        return "${r"#"}{p." + paramName + "}";
    }

    
}