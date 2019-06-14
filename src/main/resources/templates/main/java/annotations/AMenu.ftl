package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 可用与controller表明是菜单
 * 若权限和菜单1对1关系时，可把菜单注解合并到权限注解中
 */
</#if>
@Target({ElementType.TYPE , ElementType.METHOD , ElementType.ANNOTATION_TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface AMenu {
<#if (gen.showComment==true)>
    //菜单显示名称
</#if>
    String menuShow() default "";

//    //权限点编号,系统自动获取权限注解中的权限编码
//    String code() default "";
<#if (gen.showComment==true)>
    //菜单描述
</#if>
    String descr() default "";
}
