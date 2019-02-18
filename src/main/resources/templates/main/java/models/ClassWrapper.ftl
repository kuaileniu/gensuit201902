<#--package ${gen.modelPackage?replace("/",".")};-->

<#--import java.lang.reflect.Method;-->
<#--import java.util.ArrayList;-->
<#--import java.util.List;-->
<#--import org.springframework.web.bind.annotation.RequestMapping;-->

<#--/**-->
 <#--* 类包装-->
 <#--*/-->
<#--public class ClassWrapper {-->

    <#--private RequestMapping requestMapping;-->
    <#--private String requestMappingPath;-->

    <#--//类-->
    <#--private Class clazz;-->

    <#--//方法列表-->
    <#--private final List<MethodWrapper> methodWrapperList = new ArrayList<>();-->

    <#--//属性列表-->
    <#--private final List<FieldWrapper> fieldWrapperList = new ArrayList<>();-->
 <#---->

    <#--//权限列表-->
    <#--private final List<AuthorityModel> authorityModelList = new ArrayList<>();-->

    <#--//菜单列表-->
    <#--private final List<MenuModel> menuModelList = new ArrayList<>();-->


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

    <#--public RequestMapping getRequestMapping() {-->
        <#--return requestMapping;-->
    <#--}-->

    <#--public ClassWrapper setRequestMapping(RequestMapping requestMapping) {-->
        <#--this.requestMapping = requestMapping;-->
        <#--return this;-->
    <#--}-->

    <#--public String getRequestMappingPath() {-->
        <#--return requestMappingPath;-->
    <#--}-->

    <#--public ClassWrapper setRequestMappingPath(String requestMappingPath) {-->
        <#--this.requestMappingPath = requestMappingPath;-->
        <#--return this;-->
    <#--}-->

    <#--public Class getClazz() {-->
        <#--return clazz;-->
    <#--}-->

    <#--public ClassWrapper setClazz(Class clazz) {-->
        <#--this.clazz = clazz;-->
        <#--return this;-->
    <#--}-->
    <#---->
    <#--public List<MethodWrapper> getMethodWrapperList() {-->
        <#--return methodWrapperList;-->
    <#--}-->

    <#--public List<FieldWrapper> getFieldWrapperList() {-->
        <#--return fieldWrapperList;-->
    <#--}-->

    <#--public List<AuthorityModel> getAuthorityModelList() {-->
        <#--return authorityModelList;-->
    <#--}-->

    <#--public List<MenuModel> getMenuModelList() {-->
        <#--return menuModelList;-->
    <#--}-->
<#--}-->
