package ${gen.helperPackage?replace("/",".")};

import ${gen.modelPackage?replace("/",".")}.DataPage;
import ${gen.modelPackage?replace("/",".")}.Session;
import ${gen.ioPackage?replace("/",".")}.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.annotation.*;
import org.springframework.data.redis.connection.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStringCommands;
import org.springframework.data.redis.core.RedisConnectionUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.types.Expiration;
import javax.annotation.*;
import java.nio.charset.Charset;
import java.util.*;

@Component
@ConfigurationProperties(prefix = "zhsit.cache")
public class CacheHelper {
    private static Logger log = LoggerFactory.getLogger(CacheHelper.class);
    // redis 常用操作 https://www.cnblogs.com/start-fxw/p/6163939.html
// 002-Redis五种数据类型-设置key的过期时间 https://blog.csdn.net/kiss199203/article/details/73549091
    @Autowired
    private RedisTemplate redisTemplate;

    private CacheAssistant cacheAssistant = null;

    //秒,24小时
    private long timeToLive = 86400;

    @PostConstruct
    public void init() {
        cacheAssistant = new CacheAssistant(redisTemplate);
    }

    @Cacheable(value = "session#30#30", key = "#sessionId", unless = "#result == null")
    public Session getSession(String sessionId) {
        log.info("新生成Session:" + sessionId);
        return new Session().setSessionId(sessionId);
    }

    //    @CacheEvict(value = "#30#30", allEntries = true)
    @CacheEvict(value = "#30#30", key = "#sessionId")
    public void cleanSession(String sessionId) {
    }

    @CachePut(value = "session#30#30", key = "#dSession.sessionId", unless = "#result == null")
    public Session reset(Session dSession) {
        return dSession;
    }


    /**
     * 将obj放入缓存中
     */
    public boolean put(String key, Object val, int expireSecond) {
        return cacheAssistant.put(key, val, expireSecond);
    }

    /**
     * 数据放入缓存的有序集合中
     */
    public boolean sortSetReset(String key, Map<Object, Double> val, int expireSecond) {
        return cacheAssistant.zReload(key, val, expireSecond);
    }

    /**
     * 有序集合的容量
     */
    public Long sortSetCount(String key) {
        return cacheAssistant.zCard(key);
    }

    public DataPage findPage(String key, int pageNo, int pageSize) {
        if (pageSize < 1) {
            pageSize = 1;
        }
        long offset = (pageNo - 1) * pageSize;
        long startIndex = offset >= 0 ? offset : 0;
        long endIndexInclude = offset + pageSize - 1;
        endIndexInclude = endIndexInclude < 0 ? 0 : endIndexInclude;
        Long total = cacheAssistant.zCard(key);
        if (total == null || total < 1) {
            return null;
        }
        List<Object> objectList = cacheAssistant.zRange(key, startIndex, endIndexInclude);
        DataPage page = new DataPage();
        page.setData(objectList);
        page.setTotal(total);
        return page;
    }

    /**
     * 移除缓存
     */
    public boolean remove(String key) {
        return cacheAssistant.remove(key);
    }

    /**
     * 获取缓存
     */
    public Object get(String key) {
        return cacheAssistant.get(key);
    }

    private class CacheAssistant {

        private RedisTemplate redisTemplate = null;
        private RedisConnectionFactory factory = null;
        private RedisConnection redisConnection = null;
        private Charset charset = Charset.forName("UTF-8");

        public CacheAssistant(RedisTemplate redisTemplate) {
            this.redisTemplate = redisTemplate;
            factory = redisTemplate.getConnectionFactory();
            redisConnection = factory.getConnection();
        }

        /**
         * zset集合
         * https://blog.csdn.net/loophome/article/details/50373202
         *
         * @param key
         * @return
         */
        public List<Object> zRange(String key, long startIndex, long endIndexInclude) {
            try {
                byte[] byteKey = key.getBytes(charset);
                Set<byte[]> sets = redisConnection.zRange(byteKey, startIndex, endIndexInclude);
                List<Object> objectList = new ArrayList<>();
                for (byte[] set : sets) {
                    Object obj = JDKSerializer.INSTANCE.deserialize(set);
                    objectList.add(obj);
                }
                return objectList;
            } catch (Exception e) {
                log.error("redis zRange操作异常", e);
                return null;
            }
        }

        /**
         * zset集合 删除并重新设置数据
         *
         * @param key
         * @param expireSecond
         * @param data
         * @return
         */
        public boolean zReload(String key, Map<Object, Double> data, int expireSecond) {
            try {
                byte[] byteKey = key.getBytes(charset);
                redisConnection.del(byteKey);
                Set<RedisZSetCommands.Tuple> tuplesSet = new HashSet<>();
                for (Object val : data.keySet()) {
                    Double score = data.get(val);
                    byte[] byteDataVal = JDKSerializer.INSTANCE.serialize(val);
                    RedisZSetCommands.Tuple tuple = new DefaultTuple(byteDataVal, score);
                    tuplesSet.add(tuple);
                }
                if (tuplesSet.size() < 1) {
                    return false;
                }
                redisConnection.zAdd(byteKey, tuplesSet);
                redisConnection.expire(byteKey, expireSecond);
            } catch (Exception e) {
                log.error("redis zset操作异常", e);
                return false;
            }
            return true;
        }

        /**
         * zset集合 的总数,相当于sql中的 count(1)
         *
         * @param key
         * @return
         */
        public Long zCard(String key) {
            try {
                byte[] byteKey = key.getBytes(charset);
                //key不存在时，仍然返回0，而不是null；
                return redisConnection.zCard(byteKey);
            } catch (Exception e) {
                log.error("redis zset zCard操作异常", e);
                return null;
            }
        }

        /**
         * 判断是否存在
         *
         * @param key
         * @return
         */
        public Boolean exits(String key) {
            try {
                byte[] byteKey = key.getBytes(charset);
                return redisConnection.exists(byteKey);
            } catch (Exception e) {
                log.error("redis exits操作异常", e);
                return false;
            }
        }

        /**
         * 判断data是否是key集合(Set)的元素
         *
         * @param key
         * @param data
         * @return
         */
        public Boolean sIsMember(String key, Object data) {
            try {
                byte[] byteKey = key.getBytes(charset);
                byte[] valArray = JDKSerializer.INSTANCE.serialize(data);
                return redisConnection.sIsMember(byteKey, valArray);
            } catch (Exception e) {
                log.error("redis set操作异常", e);
                return false;
            }
        }

        /**
         * set集合
         *
         * @param key
         * @param expireSecond
         * @param data
         * @return
         */
        public boolean sadd(String key, int expireSecond, Object... data) {
            try {
                byte[] byteKey = key.getBytes(charset);
                byte[][] valArray = new byte[data.length][];
                for (int i = 0; i < data.length; i++) {
                    Object val = data[i];
                    byte[] byteDataVal = JDKSerializer.INSTANCE.serialize(val);
                    valArray[i] = byteDataVal;
                }
                redisConnection.sAdd(byteKey, valArray);
                redisConnection.expire(byteKey, expireSecond);
            } catch (Exception e) {
                log.error("redis set操作异常", e);
                return false;
            }
            return true;
        }

        /**
         * list集合
         *
         * @param key
         * @param expireSecond
         * @param data
         * @return
         */
        public boolean lSet(String key, int expireSecond, Object... data) {
            try {
                byte[] byteKey = key.getBytes(charset);
                byte[][] valArray = new byte[data.length][];
                for (int i = 0; i < data.length; i++) {
                    Object val = data[i];
                    byte[] byteDataVal = JDKSerializer.INSTANCE.serialize(val);
                    valArray[i] = byteDataVal;
                }
                redisConnection.lPush(byteKey, valArray);
                redisConnection.expire(byteKey, expireSecond);
            } catch (Exception e) {
                log.error("redis list操作异常", e);
                return false;
            }
            return true;
        }

        public boolean hmSet(String key, Map<Object, Object> data, int expireSecond) {
            try {
                byte[] byteKey = key.getBytes(charset);
                Map<byte[], byte[]> byteData = new HashMap<>();
                data.forEach((dataKey, dataVal) -> {
                    byte[] byteDataKey = JDKSerializer.INSTANCE.serialize(dataKey);
                    byte[] byteDataVal = JDKSerializer.INSTANCE.serialize(dataVal);
                    byteData.put(byteDataKey, byteDataVal);
                });
                redisConnection.hMSet(byteKey, byteData);
                redisConnection.expire(byteKey, expireSecond);
            } catch (Exception e) {
                log.error("redis hmset异常", e);
                return false;
            }
            return true;
        }

        /**
         * @param expireSecond 过期时长; 当小于0时，永久不过期；等于0时采用配置时间;
         */
        public boolean put(String key, Object val, int expireSecond) {
            byte[] byteKey = key.getBytes(charset);
            byte[] byteVal = JDKSerializer.INSTANCE.serialize(val);
            try {
                if (expireSecond < 0) {
                    redisConnection.set(byteKey, byteVal, Expiration.persistent(), RedisStringCommands.SetOption.UPSERT);
                } else if (expireSecond == 0) {
                    redisConnection.set(byteKey, byteVal, Expiration.seconds(timeToLive), RedisStringCommands.SetOption.UPSERT);
                } else {
                    redisConnection.set(byteKey, byteVal, Expiration.seconds(expireSecond), RedisStringCommands.SetOption.UPSERT);
                }
                return true;
            } catch (Exception ex) {
                log.error("SessionRedisCacheWriter.put:", ex);
                return false;
            } finally {
                RedisConnectionUtils.releaseConnection(redisConnection, factory);
            }
        }

        public Object get(String key) {
            byte[] byteKey = key.getBytes(charset);
            byte[] val = null;
            try {
                val = redisConnection.get(byteKey);
            } catch (Exception ex) {
                log.error("CacheAssistant.get:", ex);
            } finally {
                RedisConnectionUtils.releaseConnection(redisConnection, factory);
            }
            if (val != null) {
                return JDKSerializer.INSTANCE.deserialize(val);
            }
            return null;
        }

        public boolean remove(String key) {
            byte[] byteKey = key.getBytes(charset);
            try {
                redisConnection.del(byteKey);
                return true;
            } catch (Exception ex) {
                log.error("CacheAssistant.remove:", ex);
                return false;
            } finally {
                RedisConnectionUtils.releaseConnection(redisConnection, factory);
            }
        }
    }

    public CacheHelper setTimeToLive(long timeToLive) {
        this.timeToLive = timeToLive;
        return this;
    }
}
