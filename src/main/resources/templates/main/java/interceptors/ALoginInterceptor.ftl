package ${gen.interceptorPackage?replace("/",".")};

import ${gen.constantsPackage?replace("/",".")}.*;
import ${gen.serviceImplPackage?replace("/",".")}.BaseService;
import ${gen.enumPackage?replace("/",".")}.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import ${gen.annotationPackage?replace("/",".")}.*;
import ${gen.handlerPackage?replace("/",".")}.*;
import ${gen.filterPackage?replace("/",".")}.MapperInclude;
import org.springframework.web.method.HandlerMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 只有标注了 @Login(required = false) 的方法无须登录。
 **/
@Interceptor(order = 20)
public class ALoginInterceptor extends HandlerInterceptorAdapter {
    private Logger log = LoggerFactory.getLogger(this.getClass());
    <#--@Autowired-->
    <#--private BaseService bs;-->
    <#--//token有效期天数-->
    <#--public final static int tokenValidDay = 30;-->


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
//            log.info("访问路径:"+request.getRequestURL().toString());
            //APermission permission = method.getMethodAnnotation(APermission.class);
            //if(permission!=null){
            //   System.out.println(permission.code());
            //}
            //System.out.println(method.getMethod().getName());
            ALogin login = method.getMethodAnnotation(ALogin.class);
            if (null != login && !login.required()) {
                return true;
            }
        }
        String jiaMiZtoken = request.getHeader(GenConstant.zToken);
//        log.info("ALoginInterceptor.jiaMiZtoken:" + jiaMiZtoken);
        if (jiaMiZtoken == null) {
            jiaMiZtoken = (String) request.getParameter(GenConstant.zToken);
        }
        RequestModel requestModel = (RequestModel) ContextHandler.Instance.getControllerRequestBody();
        if (null == requestModel) {
            requestModel = new RequestModel();
        }
        if (requestModel.getZtoken() == null) {
            requestModel.setZtoken(jiaMiZtoken);
        }

        jiaMiZtoken = requestModel.getZtoken();
        if (StringUtil.isBlank(jiaMiZtoken)) {
            ContextHandler.Instance.setResponseBody(ResponseModel.error().setCode(1).setMsg("needlogin"));
            log.info("客户端未提交jiaMiZtoken");
            return false;
        }
        String ztoken = null;
        try {
            ztoken = AESUtil.aesDecode(jiaMiZtoken);
        } catch (Exception e) {
            log.error("解密jiaMiZtoken异常");
            ContextHandler.Instance.setResponseBody(ResponseModel.error().setCode(1).setMsg("needlogin"));
            return false;
        }
        //Object ztokenVal = bs.cacheHelper.get(ztoken);
        CacheHandler cacheHandler = (CacheHandler) MapperInclude.api.get(MapperInclude.CacheHandler);
        Object ztokenVal = cacheHandler.get(ztoken);
        if (ztokenVal == null) {
            ContextHandler.Instance.setResponseBody(ResponseModel.error().setCode(1).setMsg("needlogin"));
            log.info("缓存中不存在此jiaMiZtoken:" + jiaMiZtoken + "   ,ztoken:" + ztoken);
            return false;
        }
        String userId = null;
        if (ztoken.startsWith(UserType.Customer.code())) { //判断是否是客户
            userId = ztoken.substring(UserType.Customer.code().length() + 14);
            ContextHandler.Instance.setUserType(UserType.Customer);
        } else if (ztoken.startsWith(UserType.Staff.code())) { //判断是否是职员
            userId = ztoken.substring(UserType.Staff.code().length() + 14);
            ContextHandler.Instance.setUserType(UserType.Staff);
        } else {
            ContextHandler.Instance.setResponseBody(ResponseModel.error().setCode(1).setMsg("needlogin"));
            log.info("token不合规:" + jiaMiZtoken);
            return false;
        }
        ContextHandler.Instance.setUserId(userId);
        return true;
    }
}
