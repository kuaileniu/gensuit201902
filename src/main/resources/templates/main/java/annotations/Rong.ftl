package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 冗余字段,数据库设计时在注释中亦采用此标志
 *   @Rong(table.column,table2.column),
 *   @Rong([{AnnotationValue},{AnnotationValue}])
 *   [![Rong([{"same":"t_user.name=t_login_log.user_name","key":"t_user.id=t_login_log.user_id"}])]!]
 */
</#if>
@Target({ElementType.METHOD , ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Rong {
    String value() ;

    String[] field() default {} ;
}
