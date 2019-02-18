package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 许可、权限
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface Permission {
        
    String value() default "";
    //权限码(请全部用英文字母和数字及点与下划线),每个方法对应的权限名称不要重复
    String code();

    //权限组、区块、菜单下拉列
    String block() default "";

    //权限描述
    String descr() default "";

//    //是否对应一个菜单项
//    boolean isMenu() default true;

    //菜单显示名称
    String menuShow() default "";

}
