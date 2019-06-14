package ${gen.annotationPackage?replace("/",".")};

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

<#if (gen.showComment==true)>
/**
 *  虚拟controller，前后端分离场景，控制前端菜单等
 */
</#if>
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Component
public @interface VirtualController {
}