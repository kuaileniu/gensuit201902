package cn.zhsit.configs;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/3/19.
 */
@Component
@ConfigurationProperties(prefix = "zhsit.rdb")
public class RDB {
    public String database;
    public String schemaPattern;

    public String getDatabase() {
        return database;
    }

    public RDB setDatabase(String database) {
        this.database = database;
        return this;
    }

    public String getSchemaPattern() {
        return schemaPattern;
    }

    public RDB setSchemaPattern(String schemaPattern) {
        this.schemaPattern = schemaPattern;
        return this;
    }
}
