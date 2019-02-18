package ${gen.modelPackage?replace("/",".")};


/**
 * Json web Token
 */
public class JwtToken {

    /**
     * 用户网络ip
     */
    private String ip;

    /**
     * 当前用户的标识
     */
    private String appId;

    /**
     * json web token值
     */
    private String jwt;

    /**
     * 设备信息
     */
    private String deviceInfo;

    public String getIp() {
        return ip;
    }

    public JwtToken setIp(String ip) {
        this.ip = ip;
        return this;
    }

    public String getAppId() {
        return appId;
    }

    public JwtToken setAppId(String appId) {
        this.appId = appId;
        return this;
    }

    public String getJwt() {
        return jwt;
    }

    public JwtToken setJwt(String jwt) {
        this.jwt = jwt;
        return this;
    }

    public String getDeviceInfo() {
        return deviceInfo;
    }

    public JwtToken setDeviceInfo(String deviceInfo) {
        this.deviceInfo = deviceInfo;
        return this;
    }
}
