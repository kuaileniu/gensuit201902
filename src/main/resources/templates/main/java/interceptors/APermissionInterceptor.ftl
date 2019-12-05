package ${gen.interceptorPackage?replace("/",".")};

import ${gen.annotationPackage?replace("/",".")}.*;
import ${gen.enumPackage?replace("/",".")}.*;
import ${gen.handlerPackage?replace("/",".")}.*;
import ${gen.filterPackage?replace("/",".")}.MapperInclude;
import ${gen.modelPackage?replace("/",".")}.*;
import org.springframework.web.method.HandlerMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

<#if (gen.showComment==true)>
/**
 * 功能模块权限控制
 **/
</#if>
@Interceptor(order = 30)
public class APermissionInterceptor extends HandlerInterceptorAdapter {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
            APermission permission = method.getMethodAnnotation(APermission.class);
            if(permission == null){
                return true;
            }

            ALogin login = method.getMethodAnnotation(ALogin.class);
            if (null != login && !login.required()) {
                return true;
            }

            String userId = (String)ContextHandler.Instance.getUserId();
            String code = permission.code();

            PermissionHandler permissionHandler = (PermissionHandler) MapperInclude.api.get(MapperInclude.PermissionHandler);
<#if (gen.showComment==true)>
            // 判断是否具有权限
</#if>
            boolean have = permissionHandler.havePermission(userId, code);
            if (!have) {
                <#--ContextHandler.Instance.setResponseBody(ResponseModel.ok().setCode(2).setMsg("You have no permission:"+code));-->
                <#--ContextHandler.Instance.setResponseBody(ResponseModel.error().setCode(1).setMsg("no permission["+code+"]"));-->
                ContextHandler.Instance.setResponseBody(ResponseModel.ok().setCode(ResponseCode.dataFailure.code()).setMsg("no permission["+code+"]"));
                log.info("用户:" + ContextHandler.Instance.getUserId() + ",无 " + code + " 操作权限");
            }
            return have;
        }
        return true;
    }
}
