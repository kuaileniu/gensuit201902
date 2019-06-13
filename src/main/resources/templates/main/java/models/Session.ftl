package ${gen.modelPackage?replace("/",".")};

import java.io.Serializable;

<#if (gen.showComment==true)>
/**
 * 用户在线的分布式session
 */
</#if>
public class Session implements Serializable {
   //  private static final long serialVersionUID = 0L;

<#if (gen.showComment==true)>
    /**
     * 当前会话ID
     */
</#if>
    private String sessionId;

<#if (gen.showComment==true)>
    /**
     * 用户端的ip
     */
</#if>
    private String ip;

<#if (gen.showComment==true)>
    /**
     * 当前用的id
     */
</#if>
    private String userId;

<#if (gen.showComment==true)>
    /**
     * 当前用户的姓名
     */
</#if>
    private String userName;

<#if (gen.showComment==true)>
    /**
     * 登录有效的最后时间
     * （验证是登录状态是Logged，并且成功的最后时间）
     */
</#if>
    private long checkLoggedLastTime = 0L;

<#if (gen.showComment==true)>
    /**
     * 登录状态
     */
</#if>
    private LoginStatus loginStatus;

    public String getIp() {
        return ip;
    }

    public Session setIp(String ip) {
        this.ip = ip;
        return this;
    }
    
    public String getSessionId() {
        return sessionId;
    }

    public Session setSessionId(String sessionId) {
        this.sessionId = sessionId;
        return this;
    }

    public String getUserId() {
        return userId;
    }

    public Session setUserId(String userId) {
        this.userId = userId;
        return this;
    }

    public String getUserName() {
        return userName;
    }

    public Session setUserName(String userName) {
        this.userName = userName;
        return this;
    }

<#if (gen.showComment==true)>
    /**
     * 设置登录状态
     *
     * @param loginStatus
     * @return
     */
</#if>
    public Session setLoginStatus(LoginStatus loginStatus) {
        this.loginStatus = loginStatus;
        if (LoginStatus.Logged == loginStatus) {
            this.checkLoggedLastTime = System.currentTimeMillis();
        } else {
            this.checkLoggedLastTime = 0L;
            this.userId = null;
        }
        return this;
    }

<#if (gen.showComment==true)>
    /**
     * 根据失效时间检查登录状态
     *
     * @param expirySecond 失效时间,秒
     * @return
     */
</#if>
    public LoginStatus checkLoginStatus(int expirySecond) {
        long cha = System.currentTimeMillis() - checkLoggedLastTime;
        if (LoginStatus.Logged == loginStatus && cha < expirySecond * 1000) {
            setLoginStatus(LoginStatus.Logged);
            checkLoggedLastTime = System.currentTimeMillis();
            return loginStatus;
        } else {
            setLoginStatus(LoginStatus.NotLogin);
            checkLoggedLastTime = 0L;
            return loginStatus;
        }
    }

<#if (gen.showComment==true)>
    /**
     * 登录状态枚举
     */
</#if>
    public static enum LoginStatus {
    <#if (gen.showComment==true)>
        //未登录
    </#if>
        NotLogin((byte) 1),
    <#if (gen.showComment==true)>
        //已经登录
    </#if>
        Logged((byte) 2),
    <#if (gen.showComment==true)>
        //锁定
    </#if>
        Locked((byte) 3);

        private byte code;

        private LoginStatus(byte code) {
            this.code = code;
        }

        public byte getCode() {
            return code;
        }
    }
}
