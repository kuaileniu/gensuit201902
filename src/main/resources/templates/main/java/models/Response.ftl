package ${gen.modelPackage?replace("/",".")};

import java.util.*;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

<#if (gen.showComment==true)>
/**
 * Http请求返回统一格式
 */
</#if>
@JsonIgnoreProperties
public class Response {

<#if (gen.showComment==true)>
    // 内容正确
</#if>
    public static final Integer SUCCESS = 0;

<#if (gen.showComment==true)>
    //非法参数
</#if>
    public static final Integer ERROR=1;

<#if (gen.showComment==true)>
    //数据校验错误，但前端不要拦截
</#if>
    public static final Integer ERROR_NO_INTERCEPT=2;

    public static final String WrongParamMsg = "非法参数";

<#if (gen.showComment==true)>
    //当异常时返回的消息
</#if>
    private String msg;
<#if (gen.showComment==true)>
    // 异常 失败(放到HttpHeader中)
</#if>
    //public static final Integer ERROR = 500;
<#if (gen.showComment==true)>
    //状态
</#if>
    private Integer status;
<#if (gen.showComment==true)>
    //返回数据
</#if>
    private List<ResponseModel> data = new ArrayList<>();


//    // 需要登录,放到头文件中
//    private static final Integer NeedLogin = 401;
//    private static final String NeedLoginMsg = "需要登录";
//
//
//    // 不具备权限,放到头文件中
//    private static final Integer NoAuthority = 403;
//    private static final String NoAuthorityMsg = "不具备权限";


//////////////////////////////////////////////////////////////////////////////////////////////////



    public Response addData(ResponseModel... models) {
        for (ResponseModel model : models) {
            data.add(model);
        }
        return this;
    }

    public static Response ok() {
        return new Response().setStatus(SUCCESS);
    }
    
    public static Response ok(String msg) {
        return new Response().setStatus(SUCCESS).setMsg(msg);
    }

    public static Response error() {
        return new Response().setStatus(ERROR).setMsg(WrongParamMsg);
    }

    public static Response error(String msg) {
        return new Response().setStatus(ERROR).setMsg(msg);
    }

    public static Response error(Integer status,String msg) {
        return new Response().setStatus(status).setMsg(msg);
    }

    public Integer getStatus() {
        return status;
    }

    public Response setStatus(Integer status) {
        this.status = status;
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public Response setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public List<ResponseModel> getData() {
        return data;
    }

    public Response setData(List<ResponseModel> data) {
        this.data = data;
        return this;
    }
}