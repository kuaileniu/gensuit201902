package ${gen.modelPackage?replace("/",".")};

import ${gen.utilPackage?replace("/",".")}.*;

public class ClientBrowser {
    
    /**
     * 机器介绍
     */
    private String machineIntroduction;

    /**
     * 操作系统
     */
    private String os;

    /**
     * 浏览器类型
     */
    private String browserType;

    /**
     * 浏览器名称
     */
    private String browserName;

    /**
     * 浏览器版本
     */
    private String browserVersion;

    /**
     * 渲染引擎
     */
    private String renderingEngine;

    public String getMachineIntroduction() {
        return StringUtil.substring(machineIntroduction, 0, 200);
    }

    public void setMachineIntroduction(String machineIntroduction) {
        this.machineIntroduction = machineIntroduction;
    }

    public String getOs() {
        return StringUtil.substring(os, 0, 20);
    }

    public void setOs(String os) {
        this.os = os;
    }

    public String getBrowserType() {
        return StringUtil.substring(browserType, 0, 20);
    }

    public void setBrowserType(String browserType) {
        this.browserType = browserType;
    }

    public String getBrowserName() {
        return StringUtil.substring(browserName, 0, 20);
    }

    public void setBrowserName(String browserName) {
        this.browserName = browserName;
    }

    public String getBrowserVersion() {
        return StringUtil.substring(browserVersion, 0, 20);
    }

    public void setBrowserVersion(String browserVersion) {
        this.browserVersion = browserVersion;
    }

    public String getRenderingEngine() {
        return StringUtil.substring(renderingEngine, 0, 20);
    }

    public void setRenderingEngine(String renderingEngine) {
        this.renderingEngine = renderingEngine;
    }
}