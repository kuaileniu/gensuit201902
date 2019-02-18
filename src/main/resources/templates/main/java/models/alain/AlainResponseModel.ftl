package ${gen.modelAlainPackage?replace("/",".")};

import ${gen.enumPackage?replace("/",".")}.*;

import ${gen.enumPackage?replace("/",".")}.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import java.util.List;

/**
 *
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AlainResponseModel {
    // 内容正确
    public static final Integer SUCCESS = 0;

    //非法参数
    public static final Integer ERROR = 1;

    public static final String WrongParamMsg = "非法参数";

    //状态
    private Integer status;
    //当异常时返回的消息
    private Object msg;
    //token
    private String token;
    //把Request中的此值原样返回
    //拦截器自动设置,无需手动设置
    private String sameReturn;

    /**
     * 请求序号,当同一次发送多个请求(发送数组)时，客户端对每个请求序号，服务器端将此序号及对应结果返回;若每次只有一个请求，则无需填写此值
     * 对应请求的seq
     * 拦截器自动设置,无需手动设置
     */
    private String seq;

    // 本次需验证的权限码点列表
    // 当前用户是否拥有此权限列表中的具体权限(对应RequestModel）
    private List<String> permissionCodes;

    /**
     * 总条数
     */
    private Long total;

    /**
     * 返回的数据
     */
    private Object data;

    private AlainResponseModel() {}

    public String getSeq() {
        return seq;
    }

    public AlainResponseModel setSeq(String seq) {
        this.seq = seq;
        return this;
    }

    public Object getData() {
        return data;
    }

    public AlainResponseModel setData(Object data) {
        this.data = data;
        return this;
    }

    public Long getTotal() {
        return total;
    }

    public AlainResponseModel setTotal(Long total) {
        this.total = total;
        return this;
    }

    public static AlainResponseModel ok() {
        return new AlainResponseModel().setStatus(SUCCESS);
    }

    public static AlainResponseModel ok(String msg) {
        return new AlainResponseModel().setStatus(SUCCESS).setMsg(msg);
    }

    public static AlainResponseModel error() {
        return new AlainResponseModel().setStatus(ERROR).setMsg(WrongParamMsg);
    }

    public static AlainResponseModel error(String msg) {
        return new AlainResponseModel().setStatus(ERROR).setMsg(msg);
    }


    public Integer getStatus() {
        return status;
    }

    private AlainResponseModel setStatus(Integer status) {
        this.status = status;
        return this;
    }

    public Object getMsg() {
        return msg;
    }

    public AlainResponseModel setMsg(Object msg) {
        this.msg = msg;
        return this;
    }

    public String getToken() {
        return token;
    }

    public AlainResponseModel setToken(String token) {
        this.token = token;
        return this;
    }
    public String getSameReturn() {
        return sameReturn;
    }

    public AlainResponseModel setSameReturn(String sameReturn) {
        this.sameReturn = sameReturn;
        return this;
    }

    public List<String> getPermissionCodes() {
        return permissionCodes;
    }

    public AlainResponseModel setPermissionCodes(List<String> permissionCodes) {
        this.permissionCodes = permissionCodes;
        return this;
    }

}
