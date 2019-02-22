package ${gen.modelPackage?replace("/",".")};

import ${gen.enumPackage?replace("/",".")}.*;

import java.util.*;

/**
 * RequestModel
 */
public class RequestModel {

    <#--/**-->
     <#--* 请求序号,当同一次发送多个请求(发送数组)时，客户端对每个请求生成一个序号，服务器端将此序号及对应结果返回;若每次只有一个请求，则无需填写此值-->
     <#--*/-->
    <#--private String seq;-->

    <#--//需要返回-->
    <#--private Boolean back;-->
    //token
    private String ztoken;

<#if (gen.showComment==true)>
    //此值原样返回
</#if>
    private String sameReturn;

    <#--//查询字段列表 select columns-->
    <#--private String[] selectCols;-->
    <#--//数据集类型-->
    <#--//0,不分页-->
    <#--//1,分页-->
    <#--private int dtype;-->
    <#--// 当前页,从1开始-->
<#--    private int currentPage = 1;-->

<#if (gen.showComment==true)>
    // 查询页号，从1开始
</#if>
    private int pageNo = 1;

<#if (gen.showComment==true)>
    //每页的数量
</#if>
    private int pageSize = 20;

<#if (gen.showComment==true)>
    /**
     * 查询时，组织sql中查询条件且是where语句之外的查询条件数据，例登录接口中的密码加密之前的原值,验证码
     * 修改时，sql中where之外的数据
     */
</#if>
    private Map data;

<#if (gen.showComment==true)>
    /**
     * 查询时，组织sql中查询条件且是where语句之外的查询条件数据，例：id列表
     * 修改时，sql中where之外的数据
     */
</#if>
    private List dataList;

<#if (gen.showComment==true)>
    /**
     * 本次需验证的权限码点列表(本次url之外的权限点，例如同页面的其它按钮)
     * PermissionCodes
     */
</#if>
    private List<String> pmCodes;

<#if (gen.showComment==true)>
    //正序
</#if>
    private List<String> asc;

<#if (gen.showComment==true)>
    //反序
</#if>
    private List<String> desc;

<#if (gen.showComment==true)>
    //查询属性列表
</#if>
    private List<String> props;

<#if (gen.showComment==true)>
    /**
     * SQL中Where内的关联关系
     */
</#if>
    private List<WhereItem> whereItems;


    public Map getData() {
        if (null == data) {
            data = new HashMap();
        }
        return data;
    }

    public RequestModel setData(Map data) {
        this.data = data;
        return this;
    }

    public RequestModel addData(Object key, Object val) {
        if (this.data == null) {
            this.data = new HashMap();
        }
        this.data.put(key, val);
        return this;
    }

    public List getDataList() {
        if (null == dataList) {
            this.dataList = new ArrayList();
        }
        return dataList;
    }

    public RequestModel setDataList(List dataList) {
        this.dataList = dataList;
        return this;
    }

    public RequestModel addDataList(Object val) {
        if (this.dataList == null) {
            this.dataList = new ArrayList<>();
        }
        this.dataList.add(val);
        return this;
    }

    <#--public String[] getSelectCols() {-->
        <#--return selectCols;-->
    <#--}-->

    <#--public RequestModel setSelectCols(String[] selectCols) {-->
        <#--this.selectCols = selectCols;-->
        <#--return this;-->
    <#--}-->
    <#--public String getSeq() {-->
        <#--return seq;-->
    <#--}-->

    <#--public RequestModel setSeq(String seq) {-->
        <#--this.seq = seq;-->
        <#--return this;-->
    <#--}-->

    <#--public Boolean getBack() {-->
        <#--return back;-->
    <#--}-->

    <#--public RequestModel setBack(Boolean back) {-->
        <#--this.back = back;-->
        <#--return this;-->
    <#--}-->

    public String getZtoken() {
        return ztoken;
    }

    public RequestModel setZtoken(String ztoken) {
        this.ztoken = ztoken;
        return this;
    }

    public String getSameReturn() {
        return sameReturn;
    }

    public RequestModel setSameReturn(String sameReturn) {
        this.sameReturn = sameReturn;
        return this;
    }

    <#--public int getDtype() {-->
        <#--return dtype;-->
    <#--}-->

    <#--public RequestModel setDtype(int dtype) {-->
        <#--this.dtype = dtype;-->
        <#--return this;-->
    <#--}-->
    <#--public int getCurrentPage() {-->
        <#--return currentPage;-->
    <#--}-->
    <#--public RequestModel setCurrentPage(int currentPage) {-->
        <#--this.currentPage = currentPage;-->
        <#--return this;-->
    <#--}-->

    public int getPageNo() {
        return pageNo;
    }

    public RequestModel setPageNo(int pageNo) {
        this.pageNo = pageNo;
        return this;
    }

    public int getPageSize() {
        return pageSize;
    }

    public RequestModel setPageSize(int pageSize) {
        this.pageSize = pageSize;
        return this;
    }

<#if (gen.showComment==true)>
    //获取每页的第一条数据序号
</#if>
    public int getOffset() {
        int offset = (pageNo - 1) * pageSize;
        return offset >= 0 ? offset : 0;
    }

    public List<String> getAsc() {
        return asc;
    }

    public RequestModel setAsc(List<String> asc) {
        this.asc = asc;
        return this;
    }

    public RequestModel addAsc(String prop) {
        if (this.asc == null) {
            this.asc = new ArrayList<>();
        }
        this.asc.add(prop);
        return this;
    }

    public List<String> getDesc() {
        return desc;
    }

    public RequestModel setDesc(List<String> desc) {
        this.desc = desc;
        return this;
    }

    public RequestModel addDesc(String prop) {
        if (this.desc == null) {
            this.desc = new ArrayList<>();
        }
        this.desc.add(prop);
        return this;
    }


    public List<String> getProps() {
        return props;
    }

    public RequestModel setProps(List<String> props) {
        this.props = props;
        return this;
    }

    public RequestModel addProps(String prop) {
        if (props == null) {
            props = new ArrayList<>();
        }
        props.add(prop);
        return this;
    }
    
    public List<WhereItem> getWhereItems() {
        return whereItems;
    }

    public RequestModel setWhereItems(List<WhereItem> whereItems) {
        this.whereItems = whereItems;
        return this;
    }

    public RequestModel addWhereItem(WhereItem whereItem) {
        if(this.whereItems == null){
            this.whereItems = new ArrayList<>();
        }
        this.whereItems.add(whereItem);
        return this;
    }

    public List<String> getPmCodes() {
        return pmCodes;
    }

    public RequestModel setPmCodes(List<String> pmCodes) {
        this.pmCodes = pmCodes;
        return this;
    }

    public static class WhereItem {
        private boolean or = false;

<#if (gen.showComment==true)>
        //数据库字段对应的java属性名称
</#if>
        private String prop;

<#if (gen.showComment==true)>
        //关系符号
</#if>
        private WhereRelate whereRelate = WhereRelate.Equal;

<#if (gen.showComment==true)>
        //值,Equal时为一个,In 时为多个,前端需传数组
</#if>
        private String[] vals;

        public boolean isOr() {
            return or;
        }

        public WhereItem setOrInner(boolean or) {
            this.or = or;
            return this;
        }

        public String getProp() {
            return prop;
        }

        public WhereItem setProp(String prop) {
            this.prop = prop;
            return this;
        }

        public WhereRelate getWhereRelate() {
            return whereRelate;
        }

        public WhereItem setWhereRelate(WhereRelate whereRelate) {
            this.whereRelate = whereRelate;
            return this;
        }

        public String[] getVals() {
            return vals;
        }

        public WhereItem setVals(String... vals) {
            this.vals = vals;
            return this;
        }
    }

}
