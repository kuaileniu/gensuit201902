package ${gen.interceptorPackage?replace("/",".")};

import ${gen.annotationPackage?replace("/",".")}.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Interceptor(order = 50)
public class AXssInterceptor extends HandlerInterceptorAdapter {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
            AXss axss = method.getMethodAnnotation(AXss.class);
            if (null != axss && !axss.check()) {
                return true;
            }
        }
        return true;
    }
}
