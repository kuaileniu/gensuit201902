package cn.zhsit.models;

/**
 * 配置文件对象对象
 */
public class ConfigObject extends ClassBase {
    private String configName;
    private String path;

    public ConfigObject(String configName, String ftlName, String path) {
        this.configName = configName;
        this.setFtlName(ftlName);
        this.path = path;
    }

    public String getConfigName() {
        return configName;
    }

    public String getPath() {
        return path;
    }
}
