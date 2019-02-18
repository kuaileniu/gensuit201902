package ${gen.interceptorPackage?replace("/",".")};

import ${gen.handlerPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.servlet.mvc.method.annotation.*;


@ControllerAdvice
public class ResponseParamInterceptor implements ResponseBodyAdvice<Object> {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    public boolean supports(MethodParameter returnType, Class<? extends HttpMessageConverter<?>> converterType) {
        return (returnType.getParameterType() == ResponseModel.class) || (returnType.getParameterType() == ResponseModel[].class);
    }

    public Object beforeBodyWrite(@Nullable Object body, MethodParameter returnType, MediaType selectedContentType, Class<? extends HttpMessageConverter<?>> selectedConverterType, ServerHttpRequest request, ServerHttpResponse response) {
        Object requestBody = ContextHandler.Instance.getControllerRequestBody();
        if (requestBody instanceof RequestModel && body instanceof ResponseModel) {
            RequestModel requestModel = (RequestModel) requestBody;
            ResponseModel responseModel = (ResponseModel) body;
            responseModel.setSameReturn(requestModel.getSameReturn());
            if (null == requestModel || null == requestModel.getPmCodes()) {
            } else {
                // TODO 权限控制查询
            }
        } else if (requestBody instanceof RequestModel[] && body instanceof ResponseModel[]) {
            ResponseModel[] responseModels = (ResponseModel[]) body;
            RequestModel[] requestModels = (RequestModel[]) requestBody;
            for (int i = 0; i < responseModels.length; i++) {
                ResponseModel responseModel = responseModels[i];
                RequestModel requestModel = requestModels[i];
                responseModel.setSameReturn(requestModel.getSameReturn());
                <#--responseModel.setSeq(requestModel.getSeq());-->
            }
        }
        return body;
    }
}