package ${gen.basePackage?replace("/",".")};

<#--import ${gen.filterPackage?replace("/",".")}.MapperInclude;-->
<#if (gen.workflow == true)>
import org.activiti.spring.boot.SecurityAutoConfiguration;
</#if>
import org.springframework.cache.annotation.EnableCaching;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

<#if (gen.showComment==true)>
/**
 * 加载过滤器，持久化接口
 */
</#if>
<#if (gen.workflow == true)>
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
</#if>
<#if (gen.workflow == false)>
@SpringBootApplication
</#if>
@ServletComponentScan({"${gen.filterPackage?replace("/",".")}"})
@MapperScan("${gen.mapperPackage?replace("/",".")}")
@EnableCaching
public class GenApplication {
    private  Logger log = LoggerFactory.getLogger(this.getClass());

//    public static void main(String[] args) {
//         SpringApplication.run(GenApplication.class, args);
//    }

    static {
        <#--MapperInclude.include.add("/api/common/verifycode");-->
        <#--MapperInclude.api.put("PermissionHandler", new PermissionHandler() {-->
        <#--});-->
    }
}
