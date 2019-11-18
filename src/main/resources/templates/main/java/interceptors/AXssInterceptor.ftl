package ${gen.interceptorPackage?replace("/",".")};

import ${gen.annotationPackage?replace("/",".")}.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import ${gen.handlerPackage?replace("/",".")}.*;

import org.apache.commons.lang3.StringUtils;
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
            if (null == axss || !axss.check()) {
                return true;
            }
            RequestModel requestModel = (RequestModel) ContextHandler.Instance.getControllerRequestBody();
            if (null == requestModel) {
                return true;
            }

            boolean ok = checkIsOk(request);
            if (!ok) {
                ContextHandler.Instance.setResponseBody(ResponseModel.ok().setCode(1).setMsg("please check text"));
                log.info("含XSS:" + WebUtil.getBodyString(request));
                return false;
            }
        }
        return true;
    }


    /**
     * 报文为json结构时的检测xss
     *
     * @param request
     * @return true 检测通过
     */
    private boolean checkIsOk(HttpServletRequest request) {
        String body = WebUtil.getBodyString(request);
        body = StringUtils.remove(body, "{");
        body = StringUtils.remove(body, "}");
        String[] allKeyValArray = StringUtils.split(body, ",");
        for (String kv : allKeyValArray) {
            String[] oneKeyOneVal = StringUtils.split(kv, ":");
            String val = oneKeyOneVal[1];
            if (StringUtil.isBlank(val)) {
                continue;
            }
            if (oneValContainXss(val)) {
                return false;
            }
        }
        return true;
    }

    /**
     * @param val
     * @return true含xss脚本
     */
    private boolean oneValContainXss(String val) {
        val = val.toLowerCase();
        String v = StringUtil.replaceBlank(val);
        if (StringUtils.contains(v, "<script") || StringUtil.contains(v, "</script")) {
            return true;
        }

        if (StringUtils.contains(v, "alert(")) {
            return true;
        }

        if (StringUtils.contains(v, "javascript:")) {
            return true;
        }

        if (StringUtils.contains(v, "jav&#x0a;ascript")) {
            return true;
        }
        if (StringUtils.contains(v, "jav&#x0d;ascript")) {
            return true;
        }
        if (StringUtils.contains(v, "java\\0script")) {
            return true;
        }

        if (StringUtils.contains(v, "<img")) {
            return true;
        }

        if (StringUtils.contains(v, "src=")) {
            return true;
        }

        if (StringUtils.contains(v, "type=”image”")) {
            return true;
        }
        return false;
    }
}
