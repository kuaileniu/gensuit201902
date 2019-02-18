<#--package ${gen.modelPackage?replace("/",".")};-->

<#--import org.springframework.web.bind.annotation.*;-->
<#--import java.util.*;-->

<#--/**-->
 <#--*-->
 <#--*/-->
<#--public class ControllerClassContext {-->

    <#--private final List<ClassWrapper> controllerClassWrapperList = new ArrayList<>();-->

    <#--/**-->
     <#--* 当类不存在时将类添加到上下文中-->
     <#--* @param clazz-->
     <#--*/-->
    <#--public ClassWrapper addControllerClassIfNotExist(Class clazz) {-->
        <#--for (ClassWrapper classWrapper : controllerClassWrapperList) {-->
            <#--if(classWrapper.getClazz().getName().equals(clazz.getName())){-->
               <#--return classWrapper;-->
            <#--}-->
        <#--}-->
        <#--ClassWrapper classWrapper=new ClassWrapper();-->
        <#--classWrapper.setClazz(clazz);-->
        <#--controllerClassWrapperList.add(classWrapper);-->
        <#--return classWrapper;-->
    <#--}-->

    <#--/**-->
     <#--*-->
     <#--* @param clazz-->
     <#--* @param rm-->
     <#--*/-->
    <#--public void addRequestMapping(Class clazz, RequestMapping rm){-->
        <#--ClassWrapper classWrapper= addControllerClassIfNotExist(clazz);-->
        <#--classWrapper.setRequestMapping(rm);-->
    <#--}-->
    <#---->
    <#--public List<ClassWrapper> getControllerClassWrapperList() {-->
        <#--return controllerClassWrapperList;-->
    <#--}-->

<#--}-->
