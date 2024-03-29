package ${gen.modelPackage?replace("/",".")};


/**
 * 用户在线的分布式session
 */
public class DistributedSession {
   //  private static final long serialVersionUID = 0L;
    /**
     * 权限版本,客户端需做保存，每次对比版本号是否相同
     **/
    private String  pversion;
    
    /**
     * 当前会话ID
     */
    private String sessionId;

    /**
     * 用户端的ip
     */
    private String ip;

    /**
     * 当前用的id
     */
    private String userId;
    
    /**
     * 当前用户的姓名
     */
    private String userName;

    /**
     * 登录有效的最后时间
     * （验证是登录状态是Logged，并且成功的最后时间）
     */
    private long checkLoggedLastTime = 0L;

    /**
     * 登录状态
     */
    private LoginStatus loginStatus;

    public String getIp() {
        return ip;
    }

    public DistributedSession setIp(String ip) {
        this.ip = ip;
        return this;
    }
    
    public String getSessionId() {
        return sessionId;
    }

    public DistributedSession setSessionId(String sessionId) {
        this.sessionId = sessionId;
        return this;
    }

    public String getUserId() {
        return userId;
    }

    public DistributedSession setUserId(String userId) {
        this.userId = userId;
        return this;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getPversion() {
        return pversion;
    }

    public Request setPversion(String pversion) {
        this.pversion = pversion;
        return this;
    }

    /**
     * 设置登录状态
     *
     * @param loginStatus
     * @return
     */
    public DistributedSession setLoginStatus(LoginStatus loginStatus) {
        this.loginStatus = loginStatus;
        if (LoginStatus.Logged == loginStatus) {
            this.checkLoggedLastTime = System.currentTimeMillis();
        } else {
            this.checkLoggedLastTime = 0L;
            this.userId = null;
        }
        return this;
    }

    /**
     * 根据失效时间检查登录状态
     *
     * @param expirySecond 失效时间,秒
     * @return
     */
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

    /**
     * 登录状态枚举
     */
    public static enum LoginStatus {
        //未登录
        NotLogin((byte) 1),
        //已经登录
        Logged((byte) 2),
        //锁定
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
