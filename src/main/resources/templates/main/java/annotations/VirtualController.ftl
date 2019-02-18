package ${gen.annotationPackage?replace("/",".")};

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 *  虚拟controller，前后端分离场景，控制前端菜单等
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Component
public @interface VirtualController {
}