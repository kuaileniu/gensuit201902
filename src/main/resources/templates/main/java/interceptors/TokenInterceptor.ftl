package ${gen.interceptorPackage?replace("/",".")};

import ${gen.configPackage?replace("/",".")}.*;
import ${gen.annotationPackage?replace("/",".")}.*;
import ${gen.constantsPackage?replace("/",".")}.*;
import org.springframework.web.method.HandlerMethod;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//@Interceptor(order = 30)
public class TokenInterceptor extends HandlerInterceptorAdapter {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
        }
        //生成token并将token放入到Headers中
        //header设置需在preHandle中
        // Token验证
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {

    }
}
