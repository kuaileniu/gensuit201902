package ${gen.annotationPackage?replace("/",".")};
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 存储到七牛
 */
@Target({ElementType.METHOD , ElementType.TYPE, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Qiniu {
    String value() ;
}