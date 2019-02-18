package ${gen.utilPackage?replace("/",".")};

import java.util.*;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

/**
 *
 */
public class JdbcUtil {

    /**
     * 映射转换
     * @param source 源数据 <user_name,张三>
     * @param rule   转换规则<user_name,userName>
     * @return 转换之后的映射 <userName,张三>
     */
    public static Map convert(Map source, Map rule) {
        if (source.isEmpty()) {
            return source;
        }
        Map result = new HashMap<>();
        source.forEach((key, val) -> {
            Object newKey = rule.get(key);
            if (newKey == null) {
                newKey = key;
            }
            result.put(newKey, val);
        });
        return result;
    }
    
    public static List<Map<String, Object>> resultSetToList(ResultSet rs) throws SQLException {
        List<Map<String, Object>> results = new ArrayList<>();
        ResultSetMetaData rsmd = rs.getMetaData();
        int colCount = rsmd.getColumnCount();
        List<String> colNameList = new ArrayList<String>();
        for (int i = 0; i < colCount; i++) {
            colNameList.add(rsmd.getColumnName(i + 1));
//            String typeName = rsmd.getColumnTypeName((i+1));
//            System.out.println("typeName:"+typeName);  //typeName:VARCHAR
        }
        while (rs.next()) {
            Map map = new HashMap<String, Object>();
            results.add(map);
            for (int i = 0; i < colCount; i++) {
                String key = colNameList.get(i);
                Object value = rs.getObject(colNameList.get(i));
//                System.out.println(value.getClass().getName());  //
                map.put(key, value);
            }
        }
        return results;
    }

}