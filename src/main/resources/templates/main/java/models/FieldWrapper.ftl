<#--package ${gen.modelPackage?replace("/",".")};-->

<#--import java.lang.reflect.Method;-->
<#--import java.util.ArrayList;-->
<#--import java.util.List;-->
<#--import org.springframework.web.bind.annotation.RequestMapping;-->

<#--/**-->
 <#--*-->
 <#--*/-->
<#--public class FieldWrapper {-->

    <#--public RequestMapping requestMapping;-->
    <#--public String requestMappingPath;-->
    <#---->
    <#--//类-->
    <#--public Class clazz;-->

    <#--//方法列表-->
    <#--public List<MethodWrapper> methodWrapperList = new ArrayList<>();-->

    <#--//属性列表-->
    <#--public List<FieldWrapper> fieldWrapperList = new ArrayList<>();-->
 <#---->

    <#--//权限列表-->
    <#--public List<AuthorityModel> authorityModelList = new ArrayList<>();-->

    <#--//菜单列表-->
    <#--public List<MenuModel> menuModelList = new ArrayList<>();-->


    <#--public MethodWrapper addMethodIfNotExist(Method method){-->
        <#--for (MethodWrapper methodWrapper : methodWrapperList) {-->
            <#--if (methodWrapper.getMethod().toString().equals(method.toString())) {-->
                <#--return methodWrapper;-->
            <#--}-->
        <#--}-->
        <#--MethodWrapper methodWrapper=new MethodWrapper();-->
        <#--methodWrapper.setMethod(method);-->
        <#--methodWrapperList.add(methodWrapper);-->
        <#--return methodWrapper;-->
    <#--}-->

<#--}-->
