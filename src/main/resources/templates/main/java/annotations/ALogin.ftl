package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 登录
 */
</#if>
@Target({ElementType.METHOD , ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface ALogin {
    boolean required() default true;
}