package ${gen.configPackage?replace("/",".")};

import ${gen.annotationPackage?replace("/",".")}.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import java.util.*;

@Configuration
public class InterceptorConfig extends WebMvcConfigurationSupport {
    @Autowired
    private ApplicationContext context;

    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        List<HandlerInterceptorAdapter> list = new ArrayList<>();
        Map<String, Object> interceptors = context.getBeansWithAnnotation(Interceptor.class);
        interceptors.forEach((name, obj) -> {
            if (obj instanceof HandlerInterceptorAdapter) {
                HandlerInterceptorAdapter interceptor = (HandlerInterceptorAdapter) obj;
                Interceptor inter = interceptor.getClass().getAnnotation(Interceptor.class);
                if (inter == null) {
                    return;
                }
                int order = inter.order();
                registry.addInterceptor(interceptor).order(order);
            }
        });
    }
}