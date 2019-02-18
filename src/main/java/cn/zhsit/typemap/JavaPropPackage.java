package cn.zhsit.typemap;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/19.
 */
public class JavaPropPackage {
    private static final Map<String, String> javaPropPackage = new HashMap<>();

    static {
        javaPropPackage.put("String", String.class.getName());
        javaPropPackage.put("Byte", Byte.class.getName());
        javaPropPackage.put("Date", Date.class.getName());
        javaPropPackage.put("Integer", Integer.class.getName());
        javaPropPackage.put("Long", Long.class.getName());
        javaPropPackage.put("BigDecimal", BigDecimal.class.getName());
        javaPropPackage.put("byte[]","");
        javaPropPackage.put("Boolean",Boolean.class.getName());
        javaPropPackage.put("Object",Object.class.getName());
    }

    public static String packageStr(String javaObjectSimple) {
        String packageStr=javaPropPackage.get(javaObjectSimple);
        if (null == packageStr) {
            throw new RuntimeException("JavaPropPackage 中未对"+javaObjectSimple+" 做类全路径映射");
        }
        return packageStr;
    }
}
