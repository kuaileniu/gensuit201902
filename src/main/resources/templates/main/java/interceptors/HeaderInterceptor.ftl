package ${gen.interceptorPackage?replace("/",".")};

import ${gen.annotationPackage?replace("/",".")}.*;
import ${gen.handlerPackage?replace("/",".")}.*;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Interceptor(order = 40)
public class HeaderInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            String code = request.getHeader("code");
            if (code == null || "".equals(code)) {
            } else {
                ContextHandler.Instance.setCode(code);
                //ContextHandler.Instance.addInfo("code", code);
            }
        }
        return true;
    }
}
