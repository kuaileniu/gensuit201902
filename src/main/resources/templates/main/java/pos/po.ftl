package ${packageStr};

import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonInclude;
<#if objectPropertyJavaTypeMap?exists>
    <#list objectPropertyJavaTypeMap?keys as key>
        <#if (objectPropertyJavaTypeMap[key] == 'Date')>
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import ${gen.ioPackage?replace("/",".")}.MultiDateDeserializer;
import ${gen.ioPackage?replace("/",".")}.DateTimeJsonSerializer;
        <#break >
        </#if>
    </#list>
</#if>

<#list importList as key>
import ${key};
</#list>

/**
 * ${classRemark}
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ${className} implements Serializable {
<#--构造方法-->
    <#--public ${className}() {-->
    <#--}-->

<#--属性列表-->
<#if objectPropertyJavaTypeMap?exists>
    <#list objectPropertyJavaTypeMap?keys as key>
    <#--属性注释-->
    // ${propertyRemarkMap[key]}
    <#if (objectPropertyJavaTypeMap[key] == 'Date')>
    @JsonDeserialize(using = MultiDateDeserializer.class)
    @JsonSerialize(using = DateTimeJsonSerializer.class)
    </#if>
    private ${objectPropertyJavaTypeMap[key]} ${key};

    </#list>
</#if>

<#--方法列表-->
<#if objectPropertyJavaTypeMap?exists>
    <#list objectPropertyJavaTypeMap?keys as key>
    <#--属性注释-->
    <#--/**-->
     <#--* 获取${propertyRemarkMap[key]}-->
     <#--*/-->
    public ${objectPropertyJavaTypeMap[key]} get${key?cap_first}() {
        return this.${key};
    }

    <#--/**-->
     <#--* 设置${propertyRemarkMap[key]}-->
     <#--*/-->
    public ${className} set${key?cap_first}(${objectPropertyJavaTypeMap[key]} ${key}) {
        this.${key} = ${key};
        return this;
    }

    </#list>
</#if>

    @Override
    public String toString() {
        return "${entityName}${gen.poPostfix}{" +
                <#if objectPropertyJavaTypeMap?exists>
                    <#list objectPropertyJavaTypeMap?keys as javaProperty>
                    <#--属性-->
                    "${javaProperty}='"  + ${javaProperty}  + '\'' <#if javaProperty_has_next> + ", " </#if> +
                    </#list>
                </#if>
                '}';
    }
}