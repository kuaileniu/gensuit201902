package ${gen.modelPackage?replace("/",".")};

import ${gen.enumPackage?replace("/",".")}.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.List;

<#if (gen.showComment==true)>
/**
 * ResponseModel
 */
</#if>
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ResponseModel {

<#if (gen.showComment==true)>
    // 数据状态一切正常
</#if>
    public static final Integer SUCCESS = 0;

<#if (gen.showComment==true)>
    //非法参数 登录失效，放在status里面的
</#if>
    public static final Integer ERROR = 1;

<#if (gen.showComment==true)>
    //放在code里面的
</#if>
//    enums.ResponseCode
    @Deprecated()
    public static final Integer PARAM_ERROR_CODE = 1;

    public static final String WrongParamMsg = "非法参数";

<#if (gen.showComment==true)>
    //返回代码   enums.ResponseCode
</#if>
    private Integer code;

<#if (gen.showComment==true)>
    //状态
</#if>
    private Integer status = SUCCESS;

<#if (gen.showComment==true)>
    //返回的消息
</#if>
    private Object msg;

<#if (gen.showComment==true)>
    //token
</#if>
    private String ztoken;

<#if (gen.showComment==true)>
    //把Request中的此值原样返回
    //拦截器自动设置,无需手动设置
</#if>
    private String sameReturn;

<#if (gen.showComment==true)>
    /**
     * 请求序号,当同一次发送多个请求(发送数组)时，客户端对每个请求序号，服务器端将此序号及对应结果返回;若每次只有一个请求，则无需填写此值
     * 对应请求的seq
     * 拦截器自动设置,无需手动设置
     */
</#if>
    private String seq;

<#if (gen.showComment==true)>
    /**
     * 本次验证具有的权限码点列表
     * 当前用户拥有此权限列表中的具有的权限(对应RequestModel）
     * 此用户此次请求判断的权限点列表中此人没权限的点不包含在内
     * PermissionCodes
     */
</#if>
    private List<String> pmCodes;

<#if (gen.showComment==true)>
    /**
     * 数据总条数
     */
</#if>
    private Long total;

<#if (gen.showComment==true)>
    /**
     * 返回的数据
     */
</#if>
    private Object data;

    private ResponseModel() {}

    public String getSeq() {
        return seq;
    }

    public ResponseModel setSeq(String seq) {
        this.seq = seq;
        return this;
    }

    public Object getData() {
        return data;
    }

    public ResponseModel setData(Object data) {
        this.data = data;
        return this;
    }

    public Long getTotal() {
        return total;
    }

    public ResponseModel setTotal(Long total) {
        this.total = total;
        return this;
    }

    public static ResponseModel ok() {
       // return new ResponseModel().setStatus(SUCCESS);
        return new ResponseModel().setStatus(SUCCESS).setCode(ResponseCode.dataSuccess.code());
    }

    public static ResponseModel ok(String msg) {
        //return new ResponseModel().setStatus(SUCCESS).setMsg(msg);
        return new ResponseModel().setStatus(SUCCESS).setCode(ResponseCode.dataSuccess.code());
    }

    public static ResponseModel error() {
        return new ResponseModel().setStatus(ERROR).setMsg(WrongParamMsg);
    }

    public static ResponseModel error(String msg) {
        return new ResponseModel().setStatus(ERROR).setMsg(msg);
    }

    public Integer getStatus() {
        return status;
    }

    private ResponseModel setStatus(Integer status) {
        this.status = status;
        return this;
    }

    public Integer getCode() {
        return code;
    }

    public ResponseModel setCode(Integer code) {
        this.code = code;
        return this;
    }

    public ResponseModel paramErrorCode() {
        this.code = PARAM_ERROR_CODE;
        return this;
    }

    public Object getMsg() {
        return msg;
    }

    public ResponseModel setMsg(Object msg) {
        this.msg = msg;
        return this;
    }

    public String getZtoken() {
        return ztoken;
    }

    public ResponseModel setZtoken(String ztoken) {
        this.ztoken = ztoken;
        return this;
    }

    public String getSameReturn() {
        return sameReturn;
    }

    public ResponseModel setSameReturn(String sameReturn) {
        this.sameReturn = sameReturn;
        return this;
    }

    public List<String> getPmCodes() {
        return pmCodes;
    }

    public ResponseModel setPmCodes(List<String> pmCodes) {
        this.pmCodes = pmCodes;
        return this;
    }

}