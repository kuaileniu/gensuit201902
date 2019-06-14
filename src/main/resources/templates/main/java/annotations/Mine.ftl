package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 字段,数据库设计时在注释中亦采用此标志 @Mine(t_根表.字段),一对一，一对多，多对多
 */
</#if>
@Target({ElementType.METHOD , ElementType.TYPE, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Mine {
    String value() ;
}
