package ${gen.serviceImplPackage?replace("/",".")};

import ${gen.managerImplPackage?replace("/",".")}.*;
import ${gen.managerPackage?replace("/",".")}.*;
import ${gen.helperPackage?replace("/",".")}.*;
import ${gen.servicePackage?replace("/",".")}.*;
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
public class BaseService {
    //系统编码
    public String systemCode;
    @Autowired public HttpServletRequest request;
    @Autowired public HttpServletResponse response;
    @Autowired public HttpSession session;
<#if (gen.useRedis == true)>
    @Autowired public CacheHelper cacheHelper;
</#if>
<#list allManager as o>
    @Autowired public Gen${o.po.entityName}${gen.managerPostfix} gen${o.po.entityName}${gen.managerPostfix};
</#list>
<#list allController as o>
    @Autowired public Gen${o.po.entityName}${gen.servicePostfix} gen${o.po.entityName}${gen.servicePostfix};
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
    @Autowired public BaseManager bm;
    public BaseService setSystemCode(String systemCode) {
        this.systemCode = systemCode;
        return this;
    }
}
