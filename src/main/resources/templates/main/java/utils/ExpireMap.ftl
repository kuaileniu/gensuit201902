package ${gen.utilPackage?replace("/",".")};


import java.util.*;

/**
 * 带有效期map 简单实现 实现了基本的方法
 */
public class ExpireMap<K, V> extends HashMap<K, V> {
    private static final long serialVersionUID = 1L;

    /**
     * default expire time 100年
     */
    private long EXPIRE = 1000 * 60 * 60 * 24 * 365 * 100;

    private HashMap<K, Long> expireMap = new HashMap<>();

    public ExpireMap() {
        super();
    }

    public ExpireMap(long defaultExpireTime) {
        this(1 << 4, defaultExpireTime);
    }

    public ExpireMap(int initialCapacity, long defaultExpireTime) {
        super(initialCapacity);
        this.EXPIRE = defaultExpireTime;
    }

    public V put(K key, V value) {
        expireMap.put(key, System.currentTimeMillis() + EXPIRE);
        return super.put(key, value);
    }

    public boolean containsKey(Object key) {
        return !checkExpiry(key, true) && super.containsKey(key);
    }

    /**
     * @param key
     * @param value
     * @param expireTime 键值对有效期 毫秒
     * @return
     */
    public V put(K key, V value, long expireTime) {
        expireMap.put(key, System.currentTimeMillis() + expireTime);
        return super.put(key, value);
    }

    public int size() {
        return entrySet().size();
    }

    public boolean isEmpty() {
        return entrySet().size() == 0;
    }

    public boolean containsValue(Object value) {
        if (value == null) return Boolean.FALSE;
        Set<java.util.Map.Entry<K, V>> set = super.entrySet();
        Iterator<java.util.Map.Entry<K, V>> iterator = set.iterator();
        while (iterator.hasNext()) {
            java.util.Map.Entry<K, V> entry = iterator.next();
            if (value.equals(entry.getValue())) {
                if (checkExpiry(entry.getKey(), false)) {
                    iterator.remove();
                    return Boolean.FALSE;
                } else return Boolean.TRUE;
            }
        }
        return Boolean.FALSE;
    }

    public Collection<V> values() {
        Collection<V> values = super.values();
        if (values == null || values.size() < 1) return values;
        Iterator<V> iterator = values.iterator();
        while (iterator.hasNext()) {
            V next = iterator.next();
            if (!containsValue(next)) {
                iterator.remove();
            }
        }
        return values;
    }

    public V get(Object key) {
        if (key == null) {
            return null;
        }
        if (checkExpiry(key, true)) {
            return null;
        }
        return super.get(key);
    }

    /**
     * @param key
     * @return null:不存在或key为null -1:过期  存在且没过期返回value 因为过期的不是实时删除，所以稍微有点作用
     * @Description: 是否过期
     */
    public Object isInvalid(Object key) {
        if (key == null) {
            return null;
        }
        if (!expireMap.containsKey(key)) {
            return null;
        }
        long expireTime = expireMap.get(key);

        boolean flag = System.currentTimeMillis() > expireTime;

        if (flag) {
            super.remove(key);
            expireMap.remove(key);
            return -1;
        }
        return super.get(key);
    }

    public void putAll(Map<? extends K, ? extends V> m) {
        for (Map.Entry<? extends K, ? extends V> e : m.entrySet()) {
            expireMap.put(e.getKey(), System.currentTimeMillis() + EXPIRE);
        }
        super.putAll(m);
    }

    public Set<Map.Entry<K, V>> entrySet() {
        Set<java.util.Map.Entry<K, V>> set = super.entrySet();
        Iterator<java.util.Map.Entry<K, V>> iterator = set.iterator();
        while (iterator.hasNext()) {
            java.util.Map.Entry<K, V> entry = iterator.next();
            if (checkExpiry(entry.getKey(), false)) {
                iterator.remove();
            }
        }

        return set;
    }

    /**
     * @param isRemoveSuper true super删除
     * @return
     * @Description: 是否过期
     */
    private boolean checkExpiry(Object key, boolean isRemoveSuper) {
        if (!expireMap.containsKey(key)) {
            return Boolean.FALSE;
        }
        long expireTime = expireMap.get(key);
        boolean flag = System.currentTimeMillis() > expireTime;
        if (flag) {
            if (isRemoveSuper) {
                super.remove(key);
            }
            expireMap.remove(key);
        }
        return flag;
    }

}