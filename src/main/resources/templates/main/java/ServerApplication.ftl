package ${gen.serverApplicationPackage?replace("/",".")};

import ${gen.filterPackage?replace("/",".")}.MapperInclude;
<#if (gen.workflow == true)>
import org.activiti.spring.boot.SecurityAutoConfiguration;
</#if>
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

<#if (gen.showComment==true)>
/**
 * 项目启动类
 */
</#if>
<#if (gen.workflow == true)>
@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
</#if>
<#if (gen.workflow == false)>
@SpringBootApplication
</#if>
@SpringBootApplication
public class ServerApplication {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    public static void main(String[] args) {
        SpringApplication.run(ServerApplication.class, args);
    }

    static {
        MapperInclude.include.add("/api/common/verifycode");
    }
}
