package ${gen.interceptorPackage?replace("/",".")};

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.ControllerAdvice;

@ControllerAdvice
public class ErrorInterceptor implements ErrorController {

    @Override
    public String getErrorPath() {
        return null;
    }
}