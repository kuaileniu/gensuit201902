package ${gen.filterPackage?replace("/",".")};

import ${gen.utilPackage?replace("/",".")}.XssUtil;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XssHttpServletRequestWrapper  extends HttpServletRequestWrapper {
    HttpServletRequest orgRequest = null;
    private boolean isIncludeRichText = false;

    public XssHttpServletRequestWrapper(HttpServletRequest request, boolean isIncludeRichText) {
        super(request);
        orgRequest = request;
        this.isIncludeRichText = isIncludeRichText;
    }

<#if (gen.showComment==true)>
    /**
     * 覆盖getParameter方法，将参数名和参数值都做xss过滤。<br/>
     * 如果需要获得原始的值，则通过super.getParameterValues(name)来获取<br/>
     * getParameterNames,getParameterValues和getParameterMap也可能需要覆盖
     */
</#if>
    public String getParameter(String name) {
        if(("content".equals(name) || name.endsWith("WithHtml")) && !isIncludeRichText){
            return super.getParameter(name);
        }
        name = XssUtil.stripSqlInjection(name);
        String value = super.getParameter(name);
        if (StringUtils.isNotBlank(value)) {
            value = XssUtil.stripSqlInjection(value);
        }
        return value;
    }

    public String[] getParameterValues(String name) {
        String[] arr = super.getParameterValues(name);
        if(arr != null){
            for (int i=0;i<arr.length;i++) {
                arr[i] = XssUtil.stripSqlInjection(arr[i]);
            }
        }
        return arr;
    }

<#if (gen.showComment==true)>
    /**
     * 覆盖getHeader方法，将参数名和参数值都做xss过滤。<br/>
     * 如果需要获得原始的值，则通过super.getHeaders(name)来获取<br/>
     * getHeaderNames 也可能需要覆盖
     */
</#if>
    public String getHeader(String name) {
        name = XssUtil.stripSqlInjection(name);
        String value = super.getHeader(name);
        if (StringUtils.isNotBlank(value)) {
            value = XssUtil.stripSqlInjection(value);
        }
        return value;
    }

<#if (gen.showComment==true)>
    /**
     * 获取最原始的request
     *
     * @return
     */
</#if>
    public HttpServletRequest getOrgRequest() {
        return orgRequest;
    }

<#if (gen.showComment==true)>
    /**
     * 获取最原始的request的静态方法
     *
     * @return
     */
</#if>
    public static HttpServletRequest getOrgRequest(HttpServletRequest req) {
        if (req instanceof XssHttpServletRequestWrapper) {
            return ((XssHttpServletRequestWrapper) req).getOrgRequest();
        }

        return req;
    }

}
