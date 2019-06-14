package ${gen.interceptorPackage?replace("/",".")};

import ${gen.utilPackage?replace("/",".")}.ExpireMap;

public interface CacheHandler {

    final ExpireMap<String, Object> cache = new ExpireMap<>();

    default Object put(String key, Object val) {
<#if (gen.showComment==true)>
        System.out.println("生产环境需要覆盖此接口实现；此处默认存放到虚拟机的ExpireMap中");
</#if>
        return cache.put(key, val);
    }

    default Object put(String key, Object val, Integer expireSecond) {
<#if (gen.showComment==true)>
        System.out.println("生产环境需要覆盖此接口实现；此处默认存放到虚拟机的ExpireMap中");
</#if>
        return cache.put(key, val, expireSecond * 1000);
    }

    default Object get(String key) {
<#if (gen.showComment==true)>
        System.out.println("生产环境需要覆盖此接口实现；此处默认从虚拟机的ExpireMap中获取");
</#if>
        return cache.get(key);
    }

    default Object remove(String key) {
<#if (gen.showComment==true)>
        System.out.println("生产环境需要覆盖此接口实现；此处默认从虚拟机的ExpireMap中删除");
</#if>
        return cache.remove(key);
    }

<#if (gen.showComment==true)>
    /**
     * @return true 刷新成功;
     */
</#if>
    default boolean refreshCache() {
<#if (gen.showComment==true)>
        System.out.println("生产环境需要覆盖此接口，真正刷新缓存");
</#if>
        return true;
    }
}
