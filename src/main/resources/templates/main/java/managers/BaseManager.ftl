package ${gen.managerImplPackage?replace("/",".")};

import ${gen.mapperPackage?replace("/",".")}.*;
import ${gen.managerPackage?replace("/",".")}.*;
<#--import java.util.List;-->
<#--import java.util.Map;-->
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
<#if (gen.workflow == true)>
import org.activiti.engine.*;
</#if>
<#if (gen.saveFastDFS == true)>
import ${gen.dfsPackage?replace("/",".")}.FastDFSComponent;
</#if>

@Component
public class BaseManager {

    @Autowired public HttpServletRequest request;
    @Autowired public HttpServletResponse response;
    @Autowired public HttpSession session;
    @Autowired public SqlMapper sqlMapper;
<#list allPO as po>
    @Autowired public ${po.entityName}${gen.mapperPostfix} ${po.entityName?uncap_first}${gen.mapperPostfix};
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

}
