package ${gen.interceptorPackage?replace("/",".")};

import ${gen.handlerPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.HttpInputMessage;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.RequestBodyAdvice;

import java.io.IOException;
import java.lang.reflect.Type;

//@ControllerAdvice
public class RequestParamInterceptor implements RequestBodyAdvice {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    public boolean supports(MethodParameter methodParameter, Type targetType, Class<? extends HttpMessageConverter<?>> converterType) {
        return (RequestModel.class.getTypeName().equals(targetType.getTypeName())) || (RequestModel[].class.getTypeName().equals(targetType.getTypeName()));
    }

    public HttpInputMessage beforeBodyRead(HttpInputMessage inputMessage, MethodParameter parameter, Type targetType, Class<? extends HttpMessageConverter<?>> converterType) throws IOException {
        return inputMessage;
    }

    public Object afterBodyRead(Object body, HttpInputMessage inputMessage, MethodParameter parameter, Type targetType, Class<? extends HttpMessageConverter<?>> converterType) {
        if ((RequestModel.class.getTypeName().equals(targetType.getTypeName())) || (RequestModel[].class.getTypeName().equals(targetType.getTypeName()))) {
            ContextHandler.Instance.setControllerRequestBody(body);
        }
        return body;
    }

    public Object handleEmptyBody(@Nullable Object body, HttpInputMessage inputMessage, MethodParameter parameter, Type targetType, Class<? extends HttpMessageConverter<?>> converterType) {
        return body;
    }
}