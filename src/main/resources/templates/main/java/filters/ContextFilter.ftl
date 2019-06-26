package ${gen.filterPackage?replace("/",".")};

import ${gen.handlerPackage?replace("/",".")}.*;
import ${gen.constantsPackage?replace("/",".")}.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

<#if (gen.showComment==true)>
/**
 *  
 * 优先级同 Class类名排序,按位名称小的优先级高
 */
</#if>
@WebFilter(urlPatterns = {"/api/*"}, asyncSupported = true, dispatcherTypes = {DispatcherType.REQUEST}, filterName = "ContextFilter")
public class ContextFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        ResponseWrapper responseWrapper = new ResponseWrapper(resp);
        String contentType = req.getHeader(GenConstant.contentType);

        if (contentType != null && contentType.contains(GenConstant.jsonApplicationHeader)) {
            ServletRequest requestWrapper = new BodyReaderHttpServletRequestWrapper(req);
            String body = WebUtil.getBodyString(requestWrapper);
            RequestModel requestModelBody = null;
            if (null != body) {
                requestModelBody = StringUtil.fromJson(body, RequestModel.class);
            }
            ContextHandler.Instance.setControllerRequestBody(requestModelBody);
            chain.doFilter(requestWrapper, responseWrapper);
        } else if (contentType != null && contentType.contains(GenConstant.formDataHeader)) {
            chain.doFilter(request, responseWrapper);
        } else if (contentType != null && contentType.contains(GenConstant.wwwFormUrlencodedHeader)) {
            chain.doFilter(request, responseWrapper);
        } else if (contentType != null && contentType.contains(GenConstant.xmlApplicationHeader)) {
            chain.doFilter(request, responseWrapper);
        } else if (contentType != null && contentType.contains(GenConstant.xmlTextHeader)) {
            chain.doFilter(request, responseWrapper);
        } else if (contentType != null && contentType.contains(GenConstant.textHtmlHeader)) {
            chain.doFilter(request, responseWrapper);
        } else if (contentType != null && contentType.contains(GenConstant.textPlainHeader)) {
            chain.doFilter(request, responseWrapper);
        } else {
            chain.doFilter(request, responseWrapper);
        }
        WebUtil.rewriteResponseBody(responseWrapper, response);
        //ContextHandler.Instance.clear();
    }


    public void destroy() {
    }
}
