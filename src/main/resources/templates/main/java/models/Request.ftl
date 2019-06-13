package ${gen.modelPackage?replace("/",".")};

import java.util.*;

public class Request {
<#if (gen.showComment==true)>
    //权限版本,客户端需做保存，每次对比版本号是否相同,采用权限更新策略(放在了HttpHeader中)
</#if>
    //private String  pversion;

    //token(转入到HttpHeader中)
    // private token: string;

<#if (gen.showComment==true)>
    // 协议版本
</#if>
    private String zproto;

<#if (gen.showComment==true)>
    //请求数据
</#if>
    private List<RequestModel> data;

    public List<RequestModel> getData() {
        return data;
    }

    public Request setData(List<RequestModel> data) {
        this.data = data;
        return this;
    }
    
//   public String getPversion() {
//       return pversion;
//    }

//    public Request setPversion(String pversion) {
//        this.pversion = pversion;
//        return this;
//    }
    
    public String getZproto() {
        return zproto;
    }

    public Request setZproto(String zproto) {
        this.zproto = zproto;
        return this;
    }

}
