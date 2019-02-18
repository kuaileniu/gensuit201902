package cn.zhsit.typemap;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/11/10.
 */
public class Jdbc2JavaTypeMap {
    //<jdbc type,Java type>
    private static final Map<String, String> jdbc2java = new HashMap<>();

    static {
        jdbc2java.put("ENUM", "String");
        jdbc2java.put("XML", "String");
        jdbc2java.put("JSON", "String");
        jdbc2java.put("DOUBLE", "Double");
        jdbc2java.put("FLOAT", "Float");
        jdbc2java.put("LONGBLOB", "byte[]");
        jdbc2java.put("BLOB", "byte[]");
        jdbc2java.put("VARBINARY", "byte[]");
        jdbc2java.put("CHAR", "String");
        jdbc2java.put("VARCHAR", "String");
        jdbc2java.put("VARCHAR2", "String");
        jdbc2java.put("SET", "String");
        jdbc2java.put("TEXT", "String");
        jdbc2java.put("TINYINT", "Byte");
        jdbc2java.put("TIME", "Date");
        jdbc2java.put("DATE", "Date");
        jdbc2java.put("DATETIME", "Date");
        jdbc2java.put("TIMESTAMP", "Date");
        jdbc2java.put("INT", "Integer");
        jdbc2java.put("BIGINT", "Long");
        jdbc2java.put("DECIMAL", "BigDecimal");
        jdbc2java.put("BIT", "Boolean");
    }

    public static String getJavaTypeByJdbcType(String jdbcType) {
        String prop=jdbc2java.get(jdbcType.toUpperCase());
        if(prop==null){
            throw new RuntimeException("TypeMap jdbc2java 对此jdbc类型未定义:" + jdbcType);
        }
        return prop;
    }
}
