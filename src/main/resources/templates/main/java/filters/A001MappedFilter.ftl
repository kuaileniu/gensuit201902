package ${gen.filterPackage?replace("/",".")};

import ${gen.handlerPackage?replace("/",".")}.*;
import ${gen.annotationPackage?replace("/",".")}.*;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import java.util.*;

@ConfigurationProperties(prefix = "gen")
@WebFilter(urlPatterns = {"/*"}, asyncSupported = true, dispatcherTypes = {DispatcherType.REQUEST}, filterName = "MappedFilter") // 优先级同 Class类名排序,按位名称小的优先级高
public class A001MappedFilter implements Filter {
    @Autowired
    RequestMappingHandlerMapping mapped;

    private boolean filterLog = false;

    <#--  @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        int num = 0;
        Set<String> includePaths = MapperInclude.include;
        List<RequestMappingInfo> unregisterMappingList = new ArrayList<>();
        Map<RequestMappingInfo, HandlerMethod> requestMethodMap = mapped.getHandlerMethods();
        Iterator<RequestMappingInfo> its = requestMethodMap.keySet().iterator();
        while (its.hasNext()) {
            RequestMappingInfo requestMappingInfo = its.next();
            for (String path : requestMappingInfo.getPatternsCondition().getPatterns()) {
                if (filterLog) {
                    System.out.println("MapperInclude.include.add(\"" + path + "\");");
                    num++;
                }
                if (includePaths.contains(path)) {
                } else {
                    unregisterMappingList.add(requestMappingInfo);
                }
            }
        }
        if (filterLog) {
            System.out.println("allTotal:" + num);
        }
//        requestMethodMap.forEach((requestMappingInfo, handlerMethod) -> {
//            requestMappingInfo.getPatternsCondition().getPatterns().forEach(path -> {
//                if (filterLog) {
//                    System.out.println("include.add(\"" + path + "\");");
//                }
//                if (includePaths.contains(path)) {
//                } else {
//                    unregisterMappingList.add(requestMappingInfo);
//                }
//            });
//        });
        for (RequestMappingInfo requestMappingInfo : unregisterMappingList) {
            mapped.unregisterMapping(requestMappingInfo);
        }         
    }  -->
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        final String key = "num";
        final Map<String,Integer>  counter = new HashMap<>();
        counter.put(key,0);

        Set<String> includePaths = MapperInclude.include;
        List<RequestMappingInfo> unregisterMappingList = new ArrayList<>();
        Map<RequestMappingInfo, HandlerMethod> requestMethodMap = mapped.getHandlerMethods();
        requestMethodMap.forEach((requestMappingInfo, handlerMethod) -> {
            APermission aPermission = handlerMethod.getMethodAnnotation(APermission.class);
            String text = "";
            if (aPermission != null){
                text=aPermission.text();
            }
            for (String path : requestMappingInfo.getPatternsCondition().getPatterns()) {
                if (filterLog) {
                    System.out.println("MapperInclude.include.add(\"" + path + "\"); // "+ text);
                    int num =(int)counter.get(key);
                    counter.put(key,num+1);
                }
                if (includePaths.contains(path)) {
                } else {
                    unregisterMappingList.add(requestMappingInfo);
                }
            }
        });

        if (filterLog) {
            System.out.println("allTotal:" + counter.get(key));
        }
        for (RequestMappingInfo requestMappingInfo : unregisterMappingList) {
            mapped.unregisterMapping(requestMappingInfo);
        }
        MapperInclude.include.clear();
    }
        
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        try {
            chain.doFilter(request, response);
        } finally {
            ContextHandler.Instance.clear();
        }
    }

    @Override
    public void destroy() {

    }

    public A001MappedFilter setFilterLog(boolean filterLog) {
        this.filterLog = filterLog;
        return this;
    }
        
}
