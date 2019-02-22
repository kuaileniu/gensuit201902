package ${gen.controllerPackage?replace("/",".")};

<#--import ${gen.controllerPackage?replace("/",".")}.*;-->
import ${gen.servicePackage?replace("/",".")}.*;
import ${gen.helperPackage?replace("/",".")}.*;
import ${gen.managerPackage?replace("/",".")}.*;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.boot.context.properties.ConfigurationProperties;
<#if (gen.workflow == true)>
import org.activiti.engine.*;
</#if>
<#if (gen.saveFastDFS == true)>
import ${gen.dfsPackage?replace("/",".")}.FastDFSComponent;
</#if>

@Component
@ConfigurationProperties(prefix = "gen")
public class BaseController {

<#if (gen.showComment==true)>
    //系统编码
</#if>
    public String systemCode;

<#if (gen.showComment==true)>
    //运行环境
</#if>
    public String runEnv;

    @Autowired public HttpServletRequest request;
    @Autowired public HttpServletResponse response;
    @Autowired public HttpSession session;
<#if (gen.useRedis == true)>
    @Autowired public CacheHelper cacheHelper;
</#if>
<#list allController as o>
    @Autowired public Gen${o.po.entityName}${gen.controllerPostfix} gen${o.po.entityName}${gen.controllerPostfix};
</#list>
<#list allService as o>
    @Autowired public Gen${o.po.entityName}${gen.servicePostfix} gen${o.po.entityName}${gen.servicePostfix};
</#list>
<#list allManager as o>
    @Autowired public Gen${o.po.entityName}${gen.managerPostfix} gen${o.po.entityName}${gen.managerPostfix};
</#list>
<#if (gen.workflow == true)>
    @Autowired public RuntimeService runtimeService;
    @Autowired public TaskService taskService;
    @Autowired public IdentityService identityService;
    @Autowired public RepositoryService repositoryService;
    @Autowired public ProcessEngine processEngine;
    @Autowired public HistoryService historyService;
</#if>
<#if (gen.saveFastDFS == true)>
    @Autowired public FastDFSComponent fastDFSComponent;
</#if>

    public BaseController setSystemCode(String systemCode) {
        this.systemCode = systemCode;
        return this;
    }

    public BaseController setRunEnv(String runEnv) {
        this.runEnv = runEnv;
        return this;
    }
}
