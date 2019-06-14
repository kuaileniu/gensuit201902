package ${gen.configPackage?replace("/",".")};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 
import org.springframework.context.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
<#--import org.springframework.data.redis.cache.RedisCacheManager;-->
import org.springframework.data.redis.cache.RedisCacheWriter;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStringCommands;
import org.springframework.data.redis.core.RedisConnectionUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.types.Expiration;
<#--import org.springframework.data.redis.cache.RedisCacheConfiguration;-->
<#--import org.springframework.data.redis.serializer.RedisSerializationContext;-->
import org.springframework.lang.Nullable;
<#--import ${gen.ioPackage?replace("/",".")}.*;-->

import javax.annotation.Resource;
import java.time.Duration;
import java.util.*;

<#if (gen.showComment==true)>
/**
 * redis缓存的配置
 */
</#if>
@Configuration
<#--@ConfigurationProperties(prefix = "zhsit.cache")-->
@ConfigurationProperties(prefix = "spring.redis")
public class RedisConfig {
    private Logger log = LoggerFactory.getLogger(this.getClass());
    private String host;
    private int port;
    private String password;
    private int timeout;
<#if (gen.showComment==true)>
    //秒,24小时
</#if>
    private long timeToLive = 86400;
    <#--@Autowired-->
    <#--private RedisCacheWriter cacheWriter;-->
    <#--@Resource-->
    @Resource(name="stringRedisTemplate")
    private RedisTemplate redisTemplate;

    <#--@Bean-->
    <#--public RedisCacheManager session() {-->
        <#--&lt;#&ndash;RedisCacheManager manager = RedisCacheManager.RedisCacheManagerBuilder.fromCacheWriter(new SessionRedisCacheWriter()).build();&ndash;&gt;-->
        <#--RedisCacheConfiguration configuration = RedisCacheConfiguration.defaultCacheConfig();-->
        <#--&lt;#&ndash;configuration = configuration.serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(JDKSerializer.INSTANCE));&ndash;&gt;-->
        <#--configuration = configuration.serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(KryoSerializer.INSTANCE));-->
        <#--RedisCacheManager manager = new RedisCacheManager(cacheWriter, configuration);-->
        <#--manager.setTransactionAware(true);-->
        <#--return manager;-->
    <#--}-->

    @Bean("cacheWriter")
    public RedisCacheWriter createRedisCacheWriter(){
        return new SessionRedisCacheWriter();
    }

    private class SessionRedisCacheWriter implements RedisCacheWriter {
<#if (gen.showComment==true)>
        //#1800#1800
        //以#号分割，每个#号后面都需要有整型数字；第一个是失效时间(单位是秒),小于0时为永久不过期,等于0时采用系统默认最大存活时间;第二个是重新计时多长时间失效(取出后重新计时),若为0，不重新计时;
</#if>
        private static final String separator = "#";
        RedisConnectionFactory factory = redisTemplate.getConnectionFactory();
        RedisConnection redisConnection = factory.getConnection();

        public void put(String name, byte[] key, byte[] value, @Nullable Duration ttl) {
            try {
                long second = timeToLive;
                if (null != name) {
                    String[] vs = name.split(separator);
                    second = Long.parseLong(vs[1]);
                }
                if (second < 0){
                    redisConnection.set(key, value, Expiration.persistent(), RedisStringCommands.SetOption.UPSERT);
                } else if (second == 0) {
                    redisConnection.set(key, value, Expiration.seconds(timeToLive), RedisStringCommands.SetOption.UPSERT);
                } else {
                    redisConnection.set(key, value, Expiration.seconds(second), RedisStringCommands.SetOption.UPSERT);
                }
            } catch (Exception ex) {
                log.error("SessionRedisCacheWriter.put:", ex);
            } finally {
                RedisConnectionUtils.releaseConnection(redisConnection, factory);
            }
        }

        public byte[] get(String name, byte[] key) {
            try {
                boolean resetExpire = false;
                long second = 0;
                byte[] bs = null;
                if (null != name) {
                    String[] vs = name.split(separator);
                    if (vs.length >= 3) {
                        second = Long.parseLong(vs[2]);
                        if (second > 0) {
                            resetExpire = true;
                        }
                    }
                }
                if (resetExpire) {
                    redisConnection.expire(key, second);
                }
                return redisConnection.get(key);
            } catch (Exception ex) {
                log.error("SessionRedisCacheWriter.get:", ex);
                return null;
            } finally {
                RedisConnectionUtils.releaseConnection(redisConnection, factory);
            }
        }

        public byte[] putIfAbsent(String name, byte[] key, byte[] value, @Nullable Duration ttl) {
            try {
                long second = timeToLive;
                if (null != name) {
                    String[] vs = name.split(separator);
                    second = Long.parseLong(vs[1]);
                }
                if (second < 0) {
                    redisConnection.set(key, value, Expiration.persistent(), RedisStringCommands.SetOption.SET_IF_ABSENT);
                } else if (second == 0) {
                    redisConnection.set(key, value, Expiration.seconds(timeToLive), RedisStringCommands.SetOption.SET_IF_ABSENT);
                } else {
                    redisConnection.set(key, value, Expiration.seconds(second), RedisStringCommands.SetOption.SET_IF_ABSENT);
                }
                return redisConnection.get(key);
            } catch (Exception ex) {
                log.error("SessionRedisCacheWriter.put:", ex);
                return null;
            } finally {
                RedisConnectionUtils.releaseConnection(redisConnection, factory);
            }
        }

        public void remove(String name, byte[] key) {
            try {
                redisConnection.del(key);
            } catch (Exception ex) {
                log.error("SessionRedisCacheWriter.remove:", ex);
            } finally {
                RedisConnectionUtils.releaseConnection(redisConnection, factory);
            }
        }

        public void clean(String name, byte[] pattern) {
            try {
                Set<byte[]> keys = redisConnection.keys(pattern);
                if (keys != null && keys.size() > 0) {
                    byte[][] kk = keys.toArray(new byte[0][]);
                    redisConnection.del(kk);
                }
            } catch (Exception ex) {
                log.error("SessionRedisCacheWriter.remove:", ex);
            } finally {
                RedisConnectionUtils.releaseConnection(redisConnection, factory);
            }
        }
    }

    public void setTimeToLive(long timeToLive) {
        this.timeToLive = timeToLive;
    }

    public RedisConfig setHost(String host) {
        this.host = host;
        return this;
    }

    public RedisConfig setPort(int port) {
        this.port = port;
        return this;
    }

    public RedisConfig setPassword(String password) {
        this.password = password;
        return this;
    }

    public RedisConfig setTimeout(int timeout) {
        this.timeout = timeout;
        return this;
    }

    public String getHost() {
        return host;
    }

    public int getPort() {
        return port;
    }

    public String getPassword() {
        return password;
    }

    public int getTimeout() {
        return timeout;
    }
}
