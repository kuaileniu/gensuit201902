package ${gen.controllerPackage?replace("/",".")};

import ${gen.annotationPackage?replace("/",".")}.*;
import ${gen.enumPackage?replace("/",".")}.*;
import ${gen.queryPackage?replace("/",".")}.*;
import ${gen.modifyPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import ${gen.poPackage?replace("/",".")}.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.constantsPackage?replace("/",".")}.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;
import java.util.*;

@Controller
@RequestMapping("api/common")
@ConfigurationProperties(prefix = "gen")
public class CommonController {

    private boolean filterLog = false;

    //系统名称
    private String systemName;
    //系统编码
    private String systemCode;
    //系统模板
    private String templateType;
    //运行环境
    private String runEnv;

    private Logger log = LoggerFactory.getLogger(this.getClass());
 
    @Autowired
    RequestMappingHandlerMapping mapped;

    @Autowired
    private BaseController bc;
   
    <#--static {-->
        <#--System.setProperty("java.awt.headless","true");-->
    <#--}-->

    @APermission(code = "Common${AuthoritySeparator}download", text = "下载文件", descr = "下载文件")
    @RequestMapping("download")
    public void fileDownload() {
    }

    @APermission(code = "Common${AuthoritySeparator}collectAuthority", text = "整理系统权限", descr = "整理系统权限")
    @PostMapping("/collectauthority")
    @ResponseBody
    public ResponseModel collectAuthority() {
        List<Permission> permissionList = new ArrayList<>();
        Map<RequestMappingInfo, HandlerMethod> requestMethodMap = mapped.getHandlerMethods();
        requestMethodMap.forEach((requestMappingInfo, handlerMethod) -> {
            APermission aPermission = handlerMethod.getMethodAnnotation(APermission.class);
            if (null != aPermission) {
                ALogin login = handlerMethod.getMethodAnnotation(ALogin.class);
                if (login != null && !login.required()) {
                    return;
                }
                for (String path : requestMappingInfo.getPatternsCondition().getPatterns()) {
                    Permission permission = new Permission();
                    permission.setCode(aPermission.code());
                    permission.setDescr(aPermission.descr());
                    permission.setText(aPermission.text());
                    permission.setLink(path);
                    permissionList.add(permission);
                }
            }
        });
        
        permissionList.forEach(permission -> {
            bc.genPermissionService.addIfAbsentByQuery(permission, new PermissionQuery()
                    .WHERE(PermissionQuery.COLUMN.code, WhereRelate.Equal, permission.getCode())
                    .WHERE(PermissionQuery.COLUMN.link, WhereRelate.Equal, permission.getLink()));
        });

        ViewPermission.viewPermissions.forEach(permission -> {
            bc.genPermissionService.addIfAbsentByQuery(permission, new PermissionQuery()
                    .WHERE(PermissionQuery.COLUMN.code, WhereRelate.Equal, permission.getCode())
                    .WHERE(PermissionQuery.COLUMN.link, WhereRelate.Equal, permission.getLink()));
        });
        return ResponseModel.ok().setCode(0);
    }

    @APermission(code = "Common_verifycode", text = "生成验证码图片", descr = "生成验证码图片")
    @RequestMapping(value = "verifycode")
    @ResponseBody
    @ALogin(required = false)
    public void verifyCode() {
        String code = RandomUtil.getRandomNum(5);
        if ("dev".equals(runEnv) || "local".equals(runEnv)) {
            code = "66666";
        }
        bc.cacheHelper.put(GenConstant.verifyCode + bc.session.getId(), code, 60*60*5);
        WebUtil.imgWrite(bc.response, code, 100, 35, 8);
    }

    public CommonController setFilterLog(boolean filterLog) {
        this.filterLog = filterLog;
        return this;
    }

    public CommonController setRunEnv(String runEnv) {
        this.runEnv = runEnv;
        return this;
    }

    public CommonController setSystemName(String systemName) {
        this.systemName = systemName;
        return this;
    }

    public CommonController setSystemCode(String systemCode) {
        this.systemCode = systemCode;
        return this;
    }

    public CommonController setTemplateType(String templateType) {
        this.templateType = templateType;
        return this;
    }
}
