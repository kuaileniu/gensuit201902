package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 许可、权限 对应[![APermission()]!]
 */
</#if>
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@ALogin
public @interface APermission {
    
    String value() default "";
<#if (gen.showComment==true)>
    //权限码中的分隔符
</#if>
    public static final String Separator="${AuthoritySeparator}";
<#if (gen.showComment==true)>
    //权限码(英文字母和数字及APermission.Separator),每个方法对应的权限名称不要重复
</#if>
    String code();

<#if (gen.showComment==true)>
    //权限组、区块、菜单下拉列
</#if>
    String block() default "";

<#if (gen.showComment==true)>
    //权限描述
</#if>
    String descr() default "";
<#if (gen.showComment==true)>
//    //是否对应一个菜单项
</#if>
//    boolean isMenu() default true;
<#if (gen.showComment==true)>
    //菜单显示名称
</#if>
    String text() default "";

}
