package ${gen.utilPackage?replace("/",".")};

import ${gen.configPackage?replace("/",".")}.RedisConfig;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.DataType;
import org.springframework.data.redis.core.Cursor;
import org.springframework.data.redis.core.ScanOptions;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations.TypedTuple;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.commands.ProtocolCommand;
import redis.clients.jedis.util.Pool;
import redis.clients.jedis.util.SafeEncoder;

import java.util.*;
import java.util.Map.Entry;
import java.util.concurrent.TimeUnit;
import com.google.gson.Gson;

<#if (gen.showComment==true)>
/**
 * Redis工具类
 *
 <#--* @version 1.1 (GitHub文档: https://github.com/whvcse/RedisUtil )-->
 */
</#if>
@Component
public class RedisUtil {
    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private RedisConfig redisConfig;

    private Pool<Jedis> client;

	public static final String ROOT_PATH = ".";

	private static final Gson gson = new Gson();

	public void setRedisTemplate(StringRedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public StringRedisTemplate getRedisTemplate() {
        return this.redisTemplate;
    }


    /** -------------------key相关操作--------------------- */
<#if (gen.showComment==true)>
    /**
     * 删除key
     *
     * @param key
     */
</#if>
    public void delete(String key) {
        redisTemplate.delete(key);
    }

<#if (gen.showComment==true)>
    /**
     * 批量删除key
     *
     * @param keys
     */
</#if>
    public void delete(Collection<String> keys) {
        redisTemplate.delete(keys);
    }

<#if (gen.showComment==true)>
    /**
     * 序列化key
     *
     * @param key
     * @return
     */
</#if>
    public byte[] dump(String key) {
        return redisTemplate.dump(key);
    }

  <#if (gen.showComment==true)>
    /**
     * 是否存在key
     *
     * @param key
     * @return
     */
  </#if>
    public Boolean hasKey(String key) {
        return redisTemplate.hasKey(key);
    }

<#if (gen.showComment==true)>
    /**
     * 设置过期时间
     *
     * @param key
     * @param timeout
     * @param unit
     * @return
     */
</#if>
    public Boolean expire(String key, long timeout, TimeUnit unit) {
        return redisTemplate.expire(key, timeout, unit);
    }

<#if (gen.showComment==true)>
    /**
     * 设置过期时间
     *
     * @param key
     * @param date
     * @return
     */
</#if>
    public Boolean expireAt(String key, Date date) {
        return redisTemplate.expireAt(key, date);
    }

<#if (gen.showComment==true)>
    /**
     * 查找匹配的key
     *
     * @param pattern
     * @return
     */
</#if>
    public Set<String> keys(String pattern) {
        return redisTemplate.keys(pattern);
    }

<#if (gen.showComment==true)>
    /**
     * 将当前数据库的 key 移动到给定的数据库 db 当中
     *
     * @param key
     * @param dbIndex
     * @return
     */
</#if>
    public Boolean move(String key, int dbIndex) {
        return redisTemplate.move(key, dbIndex);
    }

<#if (gen.showComment==true)>
    /**
     * 移除 key 的过期时间，key 将持久保持
     *
     * @param key
     * @return
     */
</#if>
    public Boolean persist(String key) {
        return redisTemplate.persist(key);
    }

<#if (gen.showComment==true)>
    /**
     * 返回 key 的剩余的过期时间
     *
     * @param key
     * @param unit
     * @return
     */
</#if>
    public Long getExpire(String key, TimeUnit unit) {
        return redisTemplate.getExpire(key, unit);
    }

<#if (gen.showComment==true)>
    /**
     * 返回 key 的剩余的过期时间
     *
     * @param key
     * @return
     */
</#if>
    public Long getExpire(String key) {
        return redisTemplate.getExpire(key);
    }

<#if (gen.showComment==true)>
    /**
     * 从当前数据库中随机返回一个 key
     *
     * @return
     */
</#if>
    public String randomKey() {
        return redisTemplate.randomKey();
    }

<#if (gen.showComment==true)>
    /**
     * 修改 key 的名称
     *
     * @param oldKey
     * @param newKey
     */
</#if>
    public void rename(String oldKey, String newKey) {
        redisTemplate.rename(oldKey, newKey);
    }

<#if (gen.showComment==true)>
    /**
     * 仅当 newkey 不存在时，将 oldKey 改名为 newkey
     *
     * @param oldKey
     * @param newKey
     * @return
     */
</#if>
    public Boolean renameIfAbsent(String oldKey, String newKey) {
        return redisTemplate.renameIfAbsent(oldKey, newKey);
    }

<#if (gen.showComment==true)>
    /**
     * 返回 key 所储存的值的类型
     *
     * @param key
     * @return
     */
</#if>
    public DataType type(String key) {
        return redisTemplate.type(key);
    }

    /** -------------------string相关操作--------------------- */

<#if (gen.showComment==true)>
    /**
     * 设置指定 key 的值
     *
     * @param key
     * @param value
     */
</#if>
    public void set(String key, String value) {
        redisTemplate.opsForValue().set(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 获取指定 key 的值
     *
     * @param key
     * @return
     */
</#if>
    public String get(String key) {
        return redisTemplate.opsForValue().get(key);
    }

<#if (gen.showComment==true)>
    /**
     * 返回 key 中字符串值的子字符
     *
     * @param key
     * @param start
     * @param end
     * @return
     */
</#if>
    public String getRange(String key, long start, long end) {
        return redisTemplate.opsForValue().get(key, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 将给定 key 的值设为 value ，并返回 key 的旧值(old value)
     *
     * @param key
     * @param value
     * @return
     */
</#if>
    public String getAndSet(String key, String value) {
        return redisTemplate.opsForValue().getAndSet(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 对 key 所储存的字符串值，获取指定偏移量上的位(bit)
     *
     * @param key
     * @param offset
     * @return
     */
</#if>
    public Boolean getBit(String key, long offset) {
        return redisTemplate.opsForValue().getBit(key, offset);
    }

<#if (gen.showComment==true)>
    /**
     * 批量获取
     *
     * @param keys
     * @return
     */
</#if>
    public List<String> multiGet(Collection<String> keys) {
        return redisTemplate.opsForValue().multiGet(keys);
    }

<#if (gen.showComment==true)>
    /**
     * 设置ASCII码, 字符串'a'的ASCII码是97, 转为二进制是'01100001', 此方法是将二进制第offset位值变为value
     *
     * @param key
     * @param offset 位置
     * @param value  值,true为1, false为0
     * @return
     */
</#if>
    public boolean setBit(String key, long offset, boolean value) {
        return redisTemplate.opsForValue().setBit(key, offset, value);
    }

<#if (gen.showComment==true)>
    /**
     * 将值 value 关联到 key ，并将 key 的过期时间设为 timeout
     *
     * @param key
     * @param value
     * @param timeout 过期时间
     * @param unit    时间单位, 天:TimeUnit.DAYS 小时:TimeUnit.HOURS 分钟:TimeUnit.MINUTES
     *                秒:TimeUnit.SECONDS 毫秒:TimeUnit.MILLISECONDS
     */
</#if>
    public void setEx(String key, String value, long timeout, TimeUnit unit) {
        redisTemplate.opsForValue().set(key, value, timeout, unit);
    }

<#if (gen.showComment==true)>
    /**
     * 只有在 key 不存在时设置 key 的值
     *
     * @param key
     * @param value
     * @return 之前已经存在返回false, 不存在返回true
     */
</#if>
    public boolean setIfAbsent(String key, String value) {
        return redisTemplate.opsForValue().setIfAbsent(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 用 value 参数覆写给定 key 所储存的字符串值，从偏移量 offset 开始
     *
     * @param key
     * @param value
     * @param offset 从指定位置开始覆写
     */
</#if>
    public void setRange(String key, String value, long offset) {
        redisTemplate.opsForValue().set(key, value, offset);
    }

<#if (gen.showComment==true)>
    /**
     * 获取字符串的长度
     *
     * @param key
     * @return
     */
</#if>
    public Long size(String key) {
        return redisTemplate.opsForValue().size(key);
    }

<#if (gen.showComment==true)>
    /**
     * 批量添加
     *
     * @param maps
     */
</#if>
    public void multiSet(Map<String, String> maps) {
        redisTemplate.opsForValue().multiSet(maps);
    }

<#if (gen.showComment==true)>
    /**
     * 同时设置一个或多个 key-value 对，当且仅当所有给定 key 都不存在
     *
     * @param maps
     * @return 之前已经存在返回false, 不存在返回true
     */
</#if>
    public boolean multiSetIfAbsent(Map<String, String> maps) {
        return redisTemplate.opsForValue().multiSetIfAbsent(maps);
    }

<#if (gen.showComment==true)>
    /**
     * 增加(自增长), 负数则为自减
     *
     * @param key
     * @param increment
     * @return
     */
</#if>
    public Long incrBy(String key, long increment) {
        return redisTemplate.opsForValue().increment(key, increment);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param increment
     * @return
     */
</#if>
    public Double incrByFloat(String key, double increment) {
        return redisTemplate.opsForValue().increment(key, increment);
    }

<#if (gen.showComment==true)>
    /**
     * 追加到末尾
     *
     * @param key
     * @param value
     * @return
     */
</#if>
    public Integer append(String key, String value) {
        return redisTemplate.opsForValue().append(key, value);
    }

    /** -------------------hash相关操作------------------------- */

<#if (gen.showComment==true)>
    /**
     * 获取存储在哈希表中指定字段的值
     *
     * @param key
     * @param field
     * @return
     */
</#if>
    public Object hGet(String key, String field) {
        return redisTemplate.opsForHash().get(key, field);
    }

<#if (gen.showComment==true)>
    /**
     * 获取所有给定字段的值
     *
     * @param key
     * @return
     */
</#if>
    public Map<Object, Object> hGetAll(String key) {
        return redisTemplate.opsForHash().entries(key);
    }

 <#if (gen.showComment==true)>
    /**
     * 获取所有给定字段的值
     *
     * @param key
     * @param fields
     * @return
     */
</#if>
    public List<Object> hMultiGet(String key, Collection<Object> fields) {
        return redisTemplate.opsForHash().multiGet(key, fields);
    }

    public void hPut(String key, String hashKey, String value) {
        redisTemplate.opsForHash().put(key, hashKey, value);
    }

    public void hPutAll(String key, Map<String, String> maps) {
        redisTemplate.opsForHash().putAll(key, maps);
    }

<#if (gen.showComment==true)>
    /**
     * 仅当hashKey不存在时才设置
     *
     * @param key
     * @param hashKey
     * @param value
     * @return
     */
</#if>
    public Boolean hPutIfAbsent(String key, String hashKey, String value) {
        return redisTemplate.opsForHash().putIfAbsent(key, hashKey, value);
    }

<#if (gen.showComment==true)>
    /**
     * 删除一个或多个哈希表字段
     *
     * @param key
     * @param fields
     * @return
     */
</#if>
    public Long hDelete(String key, Object... fields) {
        return redisTemplate.opsForHash().delete(key, fields);
    }

<#if (gen.showComment==true)>
    /**
     * 查看哈希表 key 中，指定的字段是否存在
     *
     * @param key
     * @param field
     * @return
     */
</#if>
    public boolean hExists(String key, String field) {
        return redisTemplate.opsForHash().hasKey(key, field);
    }

<#if (gen.showComment==true)>
    /**
     * 为哈希表 key 中的指定字段的整数值加上增量 increment
     *
     * @param key
     * @param field
     * @param increment
     * @return
     */
</#if>
    public Long hIncrBy(String key, Object field, long increment) {
        return redisTemplate.opsForHash().increment(key, field, increment);
    }

<#if (gen.showComment==true)>
    /**
     * 为哈希表 key 中的指定字段的整数值加上增量 increment
     *
     * @param key
     * @param field
     * @param delta
     * @return
     */
</#if>
    public Double hIncrByFloat(String key, Object field, double delta) {
        return redisTemplate.opsForHash().increment(key, field, delta);
    }

<#if (gen.showComment==true)>
    /**
     * 获取所有哈希表中的字段
     *
     * @param key
     * @return
     */
</#if>
    public Set<Object> hKeys(String key) {
        return redisTemplate.opsForHash().keys(key);
    }

<#if (gen.showComment==true)>
    /**
     * 获取哈希表中字段的数量
     *
     * @param key
     * @return
     */
</#if>
    public Long hSize(String key) {
        return redisTemplate.opsForHash().size(key);
    }

<#if (gen.showComment==true)>
    /**
     * 获取哈希表中所有值
     *
     * @param key
     * @return
     */
</#if>
    public List<Object> hValues(String key) {
        return redisTemplate.opsForHash().values(key);
    }

<#if (gen.showComment==true)>
    /**
     * 迭代哈希表中的键值对
     *
     * @param key
     * @param options
     * @return
     */
</#if>
    public Cursor<Entry<Object, Object>> hScan(String key, ScanOptions options) {
        return redisTemplate.opsForHash().scan(key, options);
    }

    /** ------------------------list相关操作---------------------------- */

<#if (gen.showComment==true)>
    /**
     * 通过索引获取列表中的元素
     *
     * @param key
     * @param index
     * @return
     */
</#if>
    public String lIndex(String key, long index) {
        return redisTemplate.opsForList().index(key, index);
    }

<#if (gen.showComment==true)>
    /**
     * 获取列表指定范围内的元素
     *
     * @param key
     * @param start 开始位置, 0是开始位置
     * @param end   结束位置, -1返回所有
     * @return
     */
</#if>
    public List<String> lRange(String key, long start, long end) {
        return redisTemplate.opsForList().range(key, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 存储在list头部
     *
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long lLeftPush(String key, String value) {
        return redisTemplate.opsForList().leftPush(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long lLeftPushAll(String key, String... value) {
        return redisTemplate.opsForList().leftPushAll(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long lLeftPushAll(String key, Collection<String> value) {
        return redisTemplate.opsForList().leftPushAll(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 当list存在的时候才加入
     *
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long lLeftPushIfPresent(String key, String value) {
        return redisTemplate.opsForList().leftPushIfPresent(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 如果pivot存在,再pivot前面添加
     *
     * @param key
     * @param pivot
     * @param value
     * @return
     */
</#if>
    public Long lLeftPush(String key, String pivot, String value) {
        return redisTemplate.opsForList().leftPush(key, pivot, value);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long lRightPush(String key, String value) {
        return redisTemplate.opsForList().rightPush(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long lRightPushAll(String key, String... value) {
        return redisTemplate.opsForList().rightPushAll(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long lRightPushAll(String key, Collection<String> value) {
        return redisTemplate.opsForList().rightPushAll(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 为已存在的列表添加值
     *
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long lRightPushIfPresent(String key, String value) {
        return redisTemplate.opsForList().rightPushIfPresent(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 在pivot元素的右边添加值
     *
     * @param key
     * @param pivot
     * @param value
     * @return
     */
</#if>
    public Long lRightPush(String key, String pivot, String value) {
        return redisTemplate.opsForList().rightPush(key, pivot, value);
    }

<#if (gen.showComment==true)>
    /**
     * 通过索引设置列表元素的值
     *
     * @param key
     * @param index 位置
     * @param value
     */
</#if>
    public void lSet(String key, long index, String value) {
        redisTemplate.opsForList().set(key, index, value);
    }

<#if (gen.showComment==true)>
    /**
     * 移出并获取列表的第一个元素
     *
     * @param key
     * @return 删除的元素
     */
</#if>
    public String lLeftPop(String key) {
        return redisTemplate.opsForList().leftPop(key);
    }

<#if (gen.showComment==true)>
    /**
     * 移出并获取列表的第一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止
     *
     * @param key
     * @param timeout 等待时间
     * @param unit    时间单位
     * @return
     */
</#if>
    public String lBLeftPop(String key, long timeout, TimeUnit unit) {
        return redisTemplate.opsForList().leftPop(key, timeout, unit);
    }

<#if (gen.showComment==true)>
    /**
     * 移除并获取列表最后一个元素
     *
     * @param key
     * @return 删除的元素
     */
</#if>
    public String lRightPop(String key) {
        return redisTemplate.opsForList().rightPop(key);
    }

<#if (gen.showComment==true)>
    /**
     * 移出并获取列表的最后一个元素， 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止
     *
     * @param key
     * @param timeout 等待时间
     * @param unit    时间单位
     * @return
     */
</#if>
    public String lBRightPop(String key, long timeout, TimeUnit unit) {
        return redisTemplate.opsForList().rightPop(key, timeout, unit);
    }

<#if (gen.showComment==true)>
    /**
     * 移除列表的最后一个元素，并将该元素添加到另一个列表并返回
     *
     * @param sourceKey
     * @param destinationKey
     * @return
     */
</#if>
    public String lRightPopAndLeftPush(String sourceKey, String destinationKey) {
        return redisTemplate.opsForList().rightPopAndLeftPush(sourceKey, destinationKey);
    }

<#if (gen.showComment==true)>
    /**
     * 从列表中弹出一个值，将弹出的元素插入到另外一个列表中并返回它； 如果列表没有元素会阻塞列表直到等待超时或发现可弹出元素为止
     *
     * @param sourceKey
     * @param destinationKey
     * @param timeout
     * @param unit
     * @return
     */
</#if>
    public String lBRightPopAndLeftPush(String sourceKey, String destinationKey, long timeout, TimeUnit unit) {
        return redisTemplate.opsForList().rightPopAndLeftPush(sourceKey, destinationKey, timeout, unit);
    }

<#if (gen.showComment==true)>
    /**
     * 删除集合中值等于value得元素
     *
     * @param key
     * @param index index=0, 删除所有值等于value的元素; index>0, 从头部开始删除第一个值等于value的元素;
     *              index<0, 从尾部开始删除第一个值等于value的元素;
     * @param value
     * @return
     */
</#if>
    public Long lRemove(String key, long index, String value) {
        return redisTemplate.opsForList().remove(key, index, value);
    }

<#if (gen.showComment==true)>
    /**
     * 裁剪list
     *
     * @param key
     * @param start
     * @param end
     */
</#if>
    public void lTrim(String key, long start, long end) {
        redisTemplate.opsForList().trim(key, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 获取列表长度
     *
     * @param key
     * @return
     */
</#if>
    public Long lLen(String key) {
        return redisTemplate.opsForList().size(key);
    }

    /** --------------------set相关操作-------------------------- */

<#if (gen.showComment==true)>
    /**
     * set添加元素
     *
     * @param key
     * @param values
     * @return
     */
</#if>
    public Long sAdd(String key, String... values) {
        return redisTemplate.opsForSet().add(key, values);
    }

<#if (gen.showComment==true)>
    /**
     * set移除元素
     *
     * @param key
     * @param values
     * @return
     */
</#if>
    public Long sRemove(String key, Object... values) {
        return redisTemplate.opsForSet().remove(key, values);
    }

<#if (gen.showComment==true)>
    /**
     * 移除并返回集合的一个随机元素
     *
     * @param key
     * @return
     */
</#if>
    public String sPop(String key) {
        return redisTemplate.opsForSet().pop(key);
    }

<#if (gen.showComment==true)>
    /**
     * 将元素value从一个集合移到另一个集合
     *
     * @param key
     * @param value
     * @param destKey
     * @return
     */
</#if>
    public Boolean sMove(String key, String value, String destKey) {
        return redisTemplate.opsForSet().move(key, value, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合的大小
     *
     * @param key
     * @return
     */
</#if>
    public Long sSize(String key) {
        return redisTemplate.opsForSet().size(key);
    }

<#if (gen.showComment==true)>
    /**
     * 判断集合是否包含value
     *
     * @param key
     * @param value
     * @return
     */
</#if>
    public Boolean sIsMember(String key, Object value) {
        return redisTemplate.opsForSet().isMember(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 获取两个集合的交集
     *
     * @param key
     * @param otherKey
     * @return
     */
</#if>
    public Set<String> sIntersect(String key, String otherKey) {
        return redisTemplate.opsForSet().intersect(key, otherKey);
    }

<#if (gen.showComment==true)>
    /**
     * 获取key集合与多个集合的交集
     *
     * @param key
     * @param otherKeys
     * @return
     */
</#if>
    public Set<String> sIntersect(String key, Collection<String> otherKeys) {
        return redisTemplate.opsForSet().intersect(key, otherKeys);
    }

<#if (gen.showComment==true)>
    /**
     * key集合与otherKey集合的交集存储到destKey集合中
     *
     * @param key
     * @param otherKey
     * @param destKey
     * @return
     */
</#if>
    public Long sIntersectAndStore(String key, String otherKey, String destKey) {
        return redisTemplate.opsForSet().intersectAndStore(key, otherKey, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * key集合与多个集合的交集存储到destKey集合中
     *
     * @param key
     * @param otherKeys
     * @param destKey
     * @return
     */
</#if>
    public Long sIntersectAndStore(String key, Collection<String> otherKeys, String destKey) {
        return redisTemplate.opsForSet().intersectAndStore(key, otherKeys, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * 获取两个集合的并集
     *
     * @param key
     * @param otherKeys
     * @return
     */
</#if>
    public Set<String> sUnion(String key, String otherKeys) {
        return redisTemplate.opsForSet().union(key, otherKeys);
    }

<#if (gen.showComment==true)>
    /**
     * 获取key集合与多个集合的并集
     *
     * @param key
     * @param otherKeys
     * @return
     */
</#if>
    public Set<String> sUnion(String key, Collection<String> otherKeys) {
        return redisTemplate.opsForSet().union(key, otherKeys);
    }

<#if (gen.showComment==true)>
    /**
     * key集合与otherKey集合的并集存储到destKey中
     *
     * @param key
     * @param otherKey
     * @param destKey
     * @return
     */
</#if>
    public Long sUnionAndStore(String key, String otherKey, String destKey) {
        return redisTemplate.opsForSet().unionAndStore(key, otherKey, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * key集合与多个集合的并集存储到destKey中
     *
     * @param key
     * @param otherKeys
     * @param destKey
     * @return
     */
</#if>
    public Long sUnionAndStore(String key, Collection<String> otherKeys, String destKey) {
        return redisTemplate.opsForSet().unionAndStore(key, otherKeys, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * 获取两个集合的差集
     *
     * @param key
     * @param otherKey
     * @return
     */
</#if>
    public Set<String> sDifference(String key, String otherKey) {
        return redisTemplate.opsForSet().difference(key, otherKey);
    }

<#if (gen.showComment==true)>
    /**
     * 获取key集合与多个集合的差集
     *
     * @param key
     * @param otherKeys
     * @return
     */
</#if>
    public Set<String> sDifference(String key, Collection<String> otherKeys) {
        return redisTemplate.opsForSet().difference(key, otherKeys);
    }

<#if (gen.showComment==true)>
    /**
     * key集合与otherKey集合的差集存储到destKey中
     *
     * @param key
     * @param otherKey
     * @param destKey
     * @return
     */
</#if>
    public Long sDifference(String key, String otherKey, String destKey) {
        return redisTemplate.opsForSet().differenceAndStore(key, otherKey, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * key集合与多个集合的差集存储到destKey中
     *
     * @param key
     * @param otherKeys
     * @param destKey
     * @return
     */
</#if>
    public Long sDifference(String key, Collection<String> otherKeys, String destKey) {
        return redisTemplate.opsForSet().differenceAndStore(key, otherKeys, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合所有元素
     *
     * @param key
     * @return
     */
</#if>
    public Set<String> setMembers(String key) {
        return redisTemplate.opsForSet().members(key);
    }

<#if (gen.showComment==true)>
    /**
     * 随机获取集合中的一个元素
     *
     * @param key
     * @return
     */
</#if>
    public String sRandomMember(String key) {
        return redisTemplate.opsForSet().randomMember(key);
    }

<#if (gen.showComment==true)>
    /**
     * 随机获取集合中count个元素
     *
     * @param key
     * @param count
     * @return
     */
</#if>
    public List<String> sRandomMembers(String key, long count) {
        return redisTemplate.opsForSet().randomMembers(key, count);
    }

<#if (gen.showComment==true)>
    /**
     * 随机获取集合中count个元素并且去除重复的
     *
     * @param key
     * @param count
     * @return
     */
</#if>
    public Set<String> sDistinctRandomMembers(String key, long count) {
        return redisTemplate.opsForSet().distinctRandomMembers(key, count);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param options
     * @return
     */
</#if>
    public Cursor<String> sScan(String key, ScanOptions options) {
        return redisTemplate.opsForSet().scan(key, options);
    }

    /**------------------zSet相关操作--------------------------------*/

<#if (gen.showComment==true)>
    /**
     * 添加元素,有序集合是按照元素的score值由小到大排列
     *
     * @param key
     * @param value
     * @param score
     * @return
     */
</#if>
    public Boolean zAdd(String key, String value, double score) {
        return redisTemplate.opsForZSet().add(key, value, score);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param values
     * @return
     */
</#if>
    public Long zAdd(String key, Set<TypedTuple<String>> values) {
        return redisTemplate.opsForZSet().add(key, values);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param values
     * @return
     */
</#if>
    public Long zRemove(String key, Object... values) {
        return redisTemplate.opsForZSet().remove(key, values);
    }

<#if (gen.showComment==true)>
    /**
     * 增加元素的score值，并返回增加后的值
     *
     * @param key
     * @param value
     * @param delta
     * @return
     */
</#if>
    public Double zIncrementScore(String key, String value, double delta) {
        return redisTemplate.opsForZSet().incrementScore(key, value, delta);
    }

<#if (gen.showComment==true)>
    /**
     * 返回元素在集合的排名,有序集合是按照元素的score值由小到大排列
     *
     * @param key
     * @param value
     * @return 0表示第一位
     */
</#if>
    public Long zRank(String key, Object value) {
        return redisTemplate.opsForZSet().rank(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 返回元素在集合的排名,按元素的score值由大到小排列
     *
     * @param key
     * @param value
     * @return
     */
</#if>
    public Long zReverseRank(String key, Object value) {
        return redisTemplate.opsForZSet().reverseRank(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合的元素, 从小到大排序
     *
     * @param key
     * @param start 开始位置
     * @param end   结束位置, -1查询所有
     * @return
     */
</#if>
    public Set<String> zRange(String key, long start, long end) {
        return redisTemplate.opsForZSet().range(key, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合元素, 并且把score值也获取
     *
     * @param key
     * @param start
     * @param end
     * @return
     */
</#if>
    public Set<TypedTuple<String>> zRangeWithScores(String key, long start, long end) {
        return redisTemplate.opsForZSet().rangeWithScores(key, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 根据Score值查询集合元素
     *
     * @param key
     * @param min 最小值
     * @param max 最大值
     * @return
     */
</#if>
    public Set<String> zRangeByScore(String key, double min, double max) {
        return redisTemplate.opsForZSet().rangeByScore(key, min, max);
    }

<#if (gen.showComment==true)>
    /**
     * 根据Score值查询集合元素, 从小到大排序
     *
     * @param key
     * @param min 最小值
     * @param max 最大值
     * @return
     */
</#if>
    public Set<TypedTuple<String>> zRangeByScoreWithScores(String key, double min, double max) {
        return redisTemplate.opsForZSet().rangeByScoreWithScores(key, min, max);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param min
     * @param max
     * @param start
     * @param end
     * @return
     */
</#if>
    public Set<TypedTuple<String>> zRangeByScoreWithScores(String key, double min, double max, long start, long end) {
        return redisTemplate.opsForZSet().rangeByScoreWithScores(key, min, max, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合的元素, 从大到小排序
     *
     * @param key
     * @param start
     * @param end
     * @return
     */
</#if>
    public Set<String> zReverseRange(String key, long start, long end) {
        return redisTemplate.opsForZSet().reverseRange(key, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合的元素, 从大到小排序, 并返回score值
     *
     * @param key
     * @param start
     * @param end
     * @return
     */
</#if>
    public Set<TypedTuple<String>> zReverseRangeWithScores(String key, long start, long end) {
        return redisTemplate.opsForZSet().reverseRangeWithScores(key, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 根据Score值查询集合元素, 从大到小排序
     *
     * @param key
     * @param min
     * @param max
     * @return
     */
</#if>
    public Set<String> zReverseRangeByScore(String key, double min, double max) {
        return redisTemplate.opsForZSet().reverseRangeByScore(key, min, max);
    }

<#if (gen.showComment==true)>
    /**
     * 根据Score值查询集合元素, 从大到小排序
     *
     * @param key
     * @param min
     * @param max
     * @return
     */
</#if>
    public Set<TypedTuple<String>> zReverseRangeByScoreWithScores(String key, double min, double max) {
        return redisTemplate.opsForZSet().reverseRangeByScoreWithScores(key, min, max);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param min
     * @param max
     * @param start
     * @param end
     * @return
     */
</#if>
    public Set<String> zReverseRangeByScore(String key, double min,double max, long start, long end) {
        return redisTemplate.opsForZSet().reverseRangeByScore(key, min, max, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 根据score值获取集合元素数量
     *
     * @param key
     * @param min
     * @param max
     * @return
     */
</#if>
    public Long zCount(String key, double min, double max) {
        return redisTemplate.opsForZSet().count(key, min, max);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合大小
     *
     * @param key
     * @return
     */
</#if>
    public Long zSize(String key) {
        return redisTemplate.opsForZSet().size(key);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合大小
     *
     * @param key
     * @return
     */
</#if>
    public Long zZCard(String key) {
        return redisTemplate.opsForZSet().zCard(key);
    }

<#if (gen.showComment==true)>
    /**
     * 获取集合中value元素的score值
     *
     * @param key
     * @param value
     * @return
     */
</#if>
    public Double zScore(String key, Object value) {
        return redisTemplate.opsForZSet().score(key, value);
    }

<#if (gen.showComment==true)>
    /**
     * 移除指定索引位置的成员
     *
     * @param key
     * @param start
     * @param end
     * @return
     */
</#if>
    public Long zRemoveRange(String key, long start, long end) {
        return redisTemplate.opsForZSet().removeRange(key, start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 根据指定的score值的范围来移除成员
     *
     * @param key
     * @param min
     * @param max
     * @return
     */
</#if>
    public Long zRemoveRangeByScore(String key, double min, double max) {
        return redisTemplate.opsForZSet().removeRangeByScore(key, min, max);
    }

<#if (gen.showComment==true)>
    /**
     * 获取key和otherKey的并集并存储在destKey中
     *
     * @param key
     * @param otherKey
     * @param destKey
     * @return
     */
</#if>
    public Long zUnionAndStore(String key, String otherKey, String destKey) {
        return redisTemplate.opsForZSet().unionAndStore(key, otherKey, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * @param key
     * @param otherKeys
     * @param destKey
     * @return
     */
</#if>
    public Long zUnionAndStore(String key, Collection<String> otherKeys, String destKey) {
        return redisTemplate.opsForZSet().unionAndStore(key, otherKeys, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * 交集
     *
     * @param key
     * @param otherKey
     * @param destKey
     * @return
     */
</#if>
    public Long zIntersectAndStore(String key, String otherKey, String destKey) {
        return redisTemplate.opsForZSet().intersectAndStore(key, otherKey, destKey);
    }

<#if (gen.showComment==true)>
    /**
     * 交集
     *
     * @param key
     * @param otherKeys
     * @param destKey
     * @return
     */
</#if>
    public Long zIntersectAndStore(String key, Collection<String> otherKeys, String destKey) {
        return redisTemplate.opsForZSet().intersectAndStore(key, otherKeys, destKey);
    }

    public Long jsonDel(String key) {
        return jsonDel(key, ROOT_PATH);
    }

	public Long jsonDel(String key, String path) {
        byte[][] args = new byte[2][];
        args[0] = SafeEncoder.encode(key);
        args[1] = SafeEncoder.encode(path);

        try (Jedis conn = getConnection()) {
            conn.getClient().sendCommand(Command.DEL, args);
            return conn.getClient().getIntegerReply();
        }
    }

	public String jsonGet(String key) {
        return jsonGet(key, ROOT_PATH);
    }

    public String jsonGet(String key, String... paths) {
        byte[][] args = new byte[2 + paths.length][];
        int i = 0;
        args[i] = SafeEncoder.encode(key);
        args[++i] = SafeEncoder.encode("NOESCAPE");
        for (String p : paths) {
            args[++i] = SafeEncoder.encode(p);
        }

        String rep;
        try (Jedis conn = getConnection()) {
            conn.getClient().sendCommand(Command.GET, args);
            rep = conn.getClient().getBulkReply();
        }
        assertReplyNotError(rep);
        return rep;
    }

	public void jsonSet(String key, Object object, ExistenceModifier flag) {
        jsonSet(key, object, flag, ROOT_PATH);
    }

    public void jsonSet(String key, Object object) {
        jsonSet(key, object, ExistenceModifier.DEFAULT, ROOT_PATH);
    }

    public void jsonSet(String key, Object object, String path) {
        jsonSet(key, object, ExistenceModifier.DEFAULT, path);
    }

    public void jsonSet(String key, Object object, ExistenceModifier flag, String path) {
        List<byte[]> args = new ArrayList<>(4);
        args.add(SafeEncoder.encode(key));
        args.add(SafeEncoder.encode(path));
        args.add(SafeEncoder.encode(gson.toJson(object)));
        if (ExistenceModifier.DEFAULT != flag) {
            args.add(flag.getRaw());
        }

        String status;
        try (Jedis conn = getConnection()) {
            conn.getClient().sendCommand(Command.SET, args.toArray(new byte[args.size()][]));
            status = conn.getClient().getStatusCodeReply();
        }
        assertReplyOK(status);
    }

    public Class<?> jsonType(String key) {
        return jsonType(key);
    }

    public Class<?> jsonType(String key, String path) {
        List<byte[]> args = new ArrayList<>(2);
        args.add(SafeEncoder.encode(key));
        args.add(SafeEncoder.encode(path));

        String rep;
        try (Jedis conn = getConnection()) {
            conn.getClient().sendCommand(Command.TYPE, args.toArray(new byte[args.size()][]));
            rep = conn.getClient().getBulkReply();
        }

        assertReplyNotError(rep);

        switch (rep) {
            case "null":
                return null;
            case "boolean":
                return boolean.class;
            case "integer":
                return int.class;
            case "number":
                return float.class;
            case "string":
                return String.class;
            case "object":
                return Object.class;
            case "array":
                return List.class;
            default:
                throw new java.lang.RuntimeException(rep);
        }
    }

	private void init() {
		if (client == null) {
			String host = redisConfig.getHost();
			int port = redisConfig.getPort();
			int timeout = redisConfig.getTimeout();
			String password = redisConfig.getPassword();
			GenericObjectPoolConfig config = new GenericObjectPoolConfig();
			this.client = new JedisPool(config, host, port, timeout, password);
		}
    }

    private Jedis getConnection() {
        init();
        return this.client.getResource();
    }

    private static void assertReplyNotError(final String str) {
        if (str.startsWith("-ERR"))
            throw new RuntimeException(str.substring(5));
    }

	private static void assertReplyOK(final String str) {
        if (!str.equals("OK")){
		   throw new RuntimeException(str);
		}
    }

    private static String getSingleOptionalPath(String... path) {
        // check for 0, 1 or more paths
        if (1 > path.length) {   // default to root
            return ROOT_PATH;
        }
        if (1 == path.length) {  // take 1
            return path[0];
        }

        throw new RuntimeException("Only a single optional path is allowed");
    }

    private enum Command implements ProtocolCommand {
        DEL("JSON.DEL"),
        GET("JSON.GET"),
        SET("JSON.SET"),
        TYPE("JSON.TYPE");
        private final byte[] raw;

        Command(String alt) {
            raw = SafeEncoder.encode(alt);
        }
        public byte[] getRaw() {
            return raw;
        }
    }

    public enum ExistenceModifier implements ProtocolCommand {
        DEFAULT(""),
        NOT_EXISTS("NX"),
        MUST_EXIST("XX");
        private final byte[] raw;

        ExistenceModifier(String alt) {
            raw = SafeEncoder.encode(alt);
        }

        public byte[] getRaw() {
            return raw;
        }
    }
}