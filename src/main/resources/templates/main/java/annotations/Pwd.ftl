package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 字段,数据库设计时在注释中亦采用此标志 @Pwd(),加密字段
 */
@Target({ElementType.METHOD , ElementType.TYPE, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Pwd {
    String value() ;
}
