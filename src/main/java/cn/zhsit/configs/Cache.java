package cn.zhsit.configs;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/3/19.
 */
@Component
@ConfigurationProperties(prefix = "zhsit.cache")
public class Cache {
    //#serializer type(kryo or jdk with jdk being default)
    @NotBlank
    private String redisSerializer;
    //#缓存有效时间，单位毫秒，默认长久有效,8640000为24小时
    @NotBlank
    private Long timeToLive;

    public String getRedisSerializer() {
        return redisSerializer;
    }

    public void setRedisSerializer(String redisSerializer) {
        this.redisSerializer = redisSerializer;
    }

    public Long getTimeToLive() {
        return timeToLive;
    }

    public void setTimeToLive(Long timeToLive) {
        this.timeToLive = timeToLive;
    }
}
