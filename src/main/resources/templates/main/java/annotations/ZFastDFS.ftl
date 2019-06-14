package ${gen.annotationPackage?replace("/",".")};
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 存储到FastDFS
 * [![ZFastDFS(t_z_files.server_path)]!]
 */
</#if>
@Target({ElementType.METHOD , ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface ZFastDFS {
    String value() ;
}