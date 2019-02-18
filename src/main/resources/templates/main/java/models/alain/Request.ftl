package ${gen.modelAlainPackage?replace("/",".")};

import ${gen.enumPackage?replace("/",".")}.*;

import java.util.*;
/**
 *
 */
public class Request {

    /**
     * 请求序号,当同一次发送多个请求(发送数组)时，客户端对每个请求生成一个序号，服务器端将此序号及对应结果返回;若每次只有一个请求，则无需填写此值
     */
    private String seq;

    //需要返回
    private Boolean back;

    //此值原样返回
    private String sameReturn;
    //查询字段列表 select columns
    private String[] selectCols;
    //数据集类型
    //0,不分页
    //1,分页
    private int dtype;
    <#--// 当前页,从1开始-->
<#--    private int currentPage = 1;-->

    // 查询页号，从1开始
    private int pageNo = 1;

    //每页的行数
    private int pageSize = 20;

    // 本次需验证的权限码点列表
    // TODO 返回当前用户是否拥有此权限列表中的具体权限
    private List<String> permissionCodes;

    /**
     * 查询时，组织sql中查询条件且是where语句之外的查询条件数据，例登录接口中的密码加密之前的原值,验证码
     * 修改时，sql中where之外的数据
     */
    private Map data;

    /**
     * SQL中Where内的关联关系
     */
    private List<WhereItem> whereItems;


    public Map getData() {
        return data;
    }

    public Request setData(Map data) {
        this.data = data;
        return this;
    }

    public String getSeq() {
        return seq;
    }

    public Request setSeq(String seq) {
        this.seq = seq;
        return this;
    }

    public Boolean getBack() {
        return back;
    }

    public Request setBack(Boolean back) {
        this.back = back;
        return this;
    }
    
    public String getSameReturn() {
        return sameReturn;
    }

    public Request setSameReturn(String sameReturn) {
        this.sameReturn = sameReturn;
        return this;
    }

    public int getDtype() {
        return dtype;
    }

    public Request setDtype(int dtype) {
        this.dtype = dtype;
        return this;
    }
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

    public Request setPageNo(int pageNo) {
        this.pageNo = pageNo;
        return this;
    }

    public int getPageSize() {
        return pageSize;
    }

    public Request setPageSize(int pageSize) {
        this.pageSize = pageSize;
        return this;
    }

    public List<String> getPermissionCodes() {
        return permissionCodes;
    }

    public Request setPermissionCodes(List<String> permissionCodes) {
        this.permissionCodes = permissionCodes;
        return this;
    }

    public List<WhereItem> getWhereItems() {
        return whereItems;
    }

    public Request setWhereItems(List<WhereItem> whereItems) {
        this.whereItems = whereItems;
        return this;
    }

    public Request addWhereItem(WhereItem whereItem) {
        if(this.whereItems == null){
            this.whereItems = new ArrayList<>();
        }
        this.whereItems.add(whereItem);
        return this;
    }

    public static class WhereItem {
        private boolean or = false;
        //数据库字段对应的java属性名称
        private String prop;
        //关系符号
        private WhereRelate whereRelate = WhereRelate.Equal;
        //值,Equal时为一个,In 时为多个
        private Object[] vals;

        public boolean isOr() {
            return or;
        }

        public WhereItem setOr(boolean or) {
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

        public Object[] getVals() {
            return vals;
        }

        public WhereItem setVals(Object... vals) {
            this.vals = vals;
            return this;
        }
    }

}
