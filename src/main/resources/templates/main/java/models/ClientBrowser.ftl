package ${gen.modelPackage?replace("/",".")};

import ${gen.utilPackage?replace("/",".")}.*;

public class ClientBrowser {

<#if (gen.showComment==true)>
    /**
     * 机器介绍
     */
</#if>
    private String machineIntroduction;

<#if (gen.showComment==true)>
    /**
     * 操作系统
     */
</#if>
    private String os;

<#if (gen.showComment==true)>
    /**
     * 浏览器类型
     */
</#if>
    private String browserType;

<#if (gen.showComment==true)>
    /**
     * 浏览器名称
     */
</#if>
    private String browserName;

<#if (gen.showComment==true)>
    /**
     * 浏览器版本
     */
</#if>
    private String browserVersion;

<#if (gen.showComment==true)>
    /**
     * 渲染引擎
     */
</#if>
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