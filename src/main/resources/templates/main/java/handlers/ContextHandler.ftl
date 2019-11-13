package ${gen.handlerPackage?replace("/",".")};

import ${gen.enumPackage?replace("/",".")}.UserType;
import java.util.HashMap;

<#if (gen.showComment==true)>
/**
 * 上下文处理者
 */
</#if>
public enum ContextHandler {
    Instance;

    private ThreadLocal<ContextStore> context = new ThreadLocal<>();

    private class ContextStore {
    <#if (gen.showComment==true)>
        //token里面可含有ip等信息的加密结果
    </#if>
        private String token;

    <#if (gen.showComment==true)>
        //域名
    </#if>
        private String domain;

    <#if (gen.showComment==true)>
        //当前租户
    </#if>
        private Object lessee;

    <#if (gen.showComment==true)>
        //ip
    </#if>
        private String ip;

    <#if (gen.showComment==true)>
        //当前项目访问路径,例 http://bjzhs.jd.cn/oa/ 中的 oa,不一定同于 servlet.context-path: /oa
    </#if>
        private String path;

    <#if (gen.showComment==true)>
        //当前系统编码,oa等
    </#if>
        private String systemCode;

        private String sessionId;

    <#if (gen.showComment==true)>
        //用户id
    </#if>
        private Object userId;

        private String userName;

        private String code;

    <#if (gen.showComment==true)>
        //Controller方法入参的requestBody，例：RequestModel
    </#if>
        private Object controllerRequestBody;

    <#if (gen.showComment==true)>
        //用户类型
    </#if>
        private UserType userType;

    <#if (gen.showComment==true)>
        //用户
    </#if>
        private Object user;

    <#if (gen.showComment==true)>
        //返回的消息体对象
    </#if>
        private Object responseBody;

        private HashMap<String, Object> info = new HashMap<>();
    }

    public ContextHandler addInfo(String key, Object obj) {
        checkNull();
        context.get().info.put(key, obj);
        return this;
    }

    public Object getInfo(String key){
        checkNull();
        return context == null ? null : context.get().info.get(key);
    }

    public ContextHandler setToken(String token) {
        checkNull();
        context.get().token = token;
        return this;
    }

    public ContextHandler setDomain(String domain) {
        checkNull();
        context.get().domain = domain;
        return this;
    }

    public ContextHandler setLessee(Object lessee) {
        checkNull();
        context.get().lessee = lessee;
        return this;
    }

    public ContextHandler setIp(String ip) {
        checkNull();
        context.get().ip = ip;
        return this;
    }

    public ContextHandler setPath(String path) {
        checkNull();
        context.get().path = path;
        return this;
    }

    public ContextHandler setSystemCode(String systemCode) {
        checkNull();
        context.get().systemCode = systemCode;
        return this;
    }

    public ContextHandler setSessionId(String sessionId) {
        checkNull();
        context.get().sessionId = sessionId;
        return this;
    }

    public ContextHandler setUserName(String userName) {
        checkNull();
        context.get().userName = userName;
        return this;
    }

    public ContextHandler setUserId(Object userId) {
        checkNull();
        context.get().userId = userId;
        return this;
    }

    public ContextHandler setCode(String code) {
        checkNull();
        context.get().code = code;
        return this;
    }

    public String getCode() {
        checkNull();
        return context == null ? null : context.get().code;
    }

    public ContextHandler setControllerRequestBody(Object body) {
        checkNull();
        context.get().controllerRequestBody = body;
        return this;
    }

    public ContextHandler setResponseBody(Object body) {
        checkNull();
        context.get().responseBody = body;
        return this;
    }

    public ContextHandler setUserType(UserType userType) {
        checkNull();
        context.get().userType = userType;
        return this;
    }

    public ContextHandler setUser(Object user) {
        checkNull();
        context.get().user = user;
        return this;
    }
    public String getToken() {
        checkNull();
        return context == null ? null : context.get().token;
    }

    public String getDomain() {
        checkNull();
        return context == null ? null : context.get().domain;
    }

    public Object getLessee() {
        checkNull();
        return context.get().lessee;
    }

    public String getIp() {
        checkNull();
        return context.get().ip;
    }

    public String getPath() {
        checkNull();
        return context.get().path;
    }

    public String getSystemCode() {
        checkNull();
        return context.get().systemCode;
    }

    public String getSessionId() {
        checkNull();
        return context.get().sessionId;
    }

    public Object getUserId() {
        checkNull();
        return context == null ? null : context.get().userId;
    }

    public String getUserName() {
        checkNull();
        return context == null ? null : context.get().userName;
    }

    public Object getControllerRequestBody() {
        checkNull();
        return context.get().controllerRequestBody;
    }

    public Object getResponseBody() {
        checkNull();
        return context == null ? null : context.get().responseBody;
    }

    public UserType getUserType() {
        checkNull();
        return context == null ? null : context.get().userType;
    }

    public Object getUser() {
        checkNull();
        return context == null ? null : context.get().user;
    }

    public void clear() {
        if (null != context) {
            context.remove();
        }
        <#--context = null;-->
    }

    private void checkNull() {
        <#--if (null == context) {-->
            <#--context = new ThreadLocal<>();-->
            <#--context.set(new ContextStore());-->
        <#--}-->
        if (context.get() == null) {
            context.set(new ContextStore());
        }
    }
}