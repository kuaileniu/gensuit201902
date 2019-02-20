package ${gen.filterPackage?replace("/",".")};

import ${gen.interceptorPackage?replace("/",".")}.*;
import java.util.HashSet;
import java.util.Set;
import java.util.HashMap;
import java.util.Map;

/**
 * 在类加载时add进 include中
 * @Component
 * public class GenMapperInclude {
 *    static {
 *       MapperInclude.include.add("/api/order/getbyid/{id}");
 *    }
 * }
 */
public enum MapperInclude {
    Instance;

    public static final String PermissionHandler = "PermissionHandler";
    public static final String CacheHandler = "CacheHandler";

    public final static Set<String> include = new HashSet<>();

    //<"PermissionHandler",PermissionHandler>
    //<"XXXHandler",XXXObject>
    public final static Map<String,Object> api = new HashMap<>();

    static {
        include.add("/api/common/verifycode");

        api.put(PermissionHandler, new PermissionHandler() {});
        api.put(CacheHandler, new CacheHandler() {});

    }
}