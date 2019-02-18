package cn.zhsit.utils;


import cn.zhsit.constants.GenConstants;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.StringWriter;
import java.util.Map;

/**
 * Created by Administrator on 2017/11/10.
 */
public class FreeMarkerUtil {
    private static Logger log = LoggerFactory.getLogger(FreeMarkerUtil.class);
    public static Configuration configuration;

    static {
        try {
            configuration = new Configuration(Configuration.VERSION_2_3_23);
            configuration.setObjectWrapper(Configuration.getDefaultObjectWrapper(Configuration.VERSION_2_3_23));
            configuration.setDefaultEncoding(GenConstants.UTF8);
            configuration.setDirectoryForTemplateLoading(new File(GenConstants.templateDirectory));
        } catch (Exception e) {
            log.error("初始化freemarker配置时异常", e);
        }
    }

    /**
     * 获取解析后的值.
     *
     * @param param
     * @return
     */
    public static String getProcessValue(Map<String, Object> param, String ftlName) {
        try {
            Template template = configuration.getTemplate(ftlName);
            StringWriter sw = new StringWriter();
            template.process(param, sw);
            return sw.toString();
        } catch (Exception e) {
            log.error("使用freemaker生成数据时异常", e);
            return null;
        }
    }

}
