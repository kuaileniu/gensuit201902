package ${gen.configPackage?replace("/",".")};

import ${gen.utilPackage?replace("/",".")}.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.web.bind.support.ConfigurableWebBindingInitializer;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import javax.annotation.PostConstruct;
import java.text.SimpleDateFormat;
import java.util.Date;

<#if (gen.showComment==true)>
/**
 * web时间格式转换的配置
 */
</#if>
@Configuration
public class WebConfig {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private RequestMappingHandlerAdapter handlerAdapter;

    @PostConstruct
    public void initEditableValidation() {
        ConfigurableWebBindingInitializer initializer = (ConfigurableWebBindingInitializer) handlerAdapter.getWebBindingInitializer();
        if (initializer.getConversionService() != null) {
            GenericConversionService genericConversionService = (GenericConversionService) initializer.getConversionService();
            genericConversionService.addConverter(new StringToDateConverter());
        }
    }


    <#--@Bean-->
    <#--public FilterRegistrationBean corsFilter() {-->
        <#--UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();-->
        <#--source.registerCorsConfiguration("/**", buildConfig());-->
        <#--FilterRegistrationBean bean = new FilterRegistrationBean(new CorsFilter(source));-->
        <#--bean.setOrder(Ordered.HIGHEST_PRECEDENCE);-->
        <#--return bean;-->
    <#--}-->

    <#--private CorsConfiguration buildConfig() {-->
        <#--CorsConfiguration corsConfiguration = new CorsConfiguration();-->
        <#--corsConfiguration.addAllowedOrigin("*");-->
        <#--corsConfiguration.addAllowedHeader("*");-->
        <#--corsConfiguration.addAllowedMethod("*");-->
        <#--corsConfiguration.setAllowCredentials(true);-->
        <#--return corsConfiguration;-->
    <#--}-->

    private class StringToDateConverter implements Converter<String, Date> {
        private static final String dateFormat = "yyyy-MM-dd HH:mm:ss";
        private static final String shortDateFormat = "yyyy-MM-dd";
        private static final String dateFormat2 = "yyyy/MM/dd HH:mm:ss";
        private static final String shortDateFormat2 = "yyyy/MM/dd";

        @Override
        public Date convert(String source) {
            if (StringUtil.isBlank(source)) {
                return null;
            }
            source = source.trim();
            try {
                SimpleDateFormat formatter;
                if (source.contains("-")) {
                    if (source.contains(":")) {
                        formatter = new SimpleDateFormat(dateFormat);
                    } else {
                        formatter = new SimpleDateFormat(shortDateFormat);
                    }
                    Date dtDate = formatter.parse(source);
                    return dtDate;
                } else if (source.contains("/")) {
                    if (source.contains(":")) {
                        formatter = new SimpleDateFormat(dateFormat2);
                    } else {
                        formatter = new SimpleDateFormat(shortDateFormat2);
                    }
                    Date dtDate = formatter.parse(source);
                    return dtDate;
                }
            } catch (Exception e) {
                throw new RuntimeException(String.format("parser %s to Date fail", source));
            }

            throw new RuntimeException(String.format("parser %s to Date fail", source));

        }
    }
}
