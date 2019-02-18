package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 许可、权限 对应[![APermission()]!]
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@ALogin
public @interface APermission {
    
    String value() default "";

    //权限码中的分隔符
    public static final String Separator="${AuthoritySeparator}";

    //权限码(英文字母和数字及APermission.Separator),每个方法对应的权限名称不要重复
    String code();

    //权限组、区块、菜单下拉列
    String block() default "";

    //权限描述
    String descr() default "";

//    //是否对应一个菜单项
//    boolean isMenu() default true;

    //菜单显示名称
    String text() default "";

}
