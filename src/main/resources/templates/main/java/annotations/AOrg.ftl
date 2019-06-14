package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 是组织 对应 [![AOrg()]!]
 */
</#if>
@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface AOrg {
    boolean value() default false;

}
