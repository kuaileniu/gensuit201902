package ${gen.annotationPackage?replace("/",".")};

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

<#if (gen.showComment==true)>
/**
 * 外键字段,数据库设计时在注释中亦采用此标志 @ForeignColumn(t_根表)
 */
</#if>
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface ForeignColumn {
<#if (gen.showComment==true)>
    //外键指向的table
</#if>
    String table();

<#if (gen.showComment==true)>
    //外键指向的table的主键，或与主键同时存在但可以替代主键的列；指向的表的主键名称叫id时 为default id，其它的需明确列出来
</#if>
    String column() default "id";


}