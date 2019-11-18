package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 是做防xss注入检测
 */
</#if>
@Target({ElementType.METHOD , ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface AXss {
<#if (gen.showComment==true)>
    // 是否进行检测
</#if>
    boolean check() default true;

<#if (gen.showComment==true)>
    //放行的参数
</#if>
    String[] ignoreParams() default {};
}