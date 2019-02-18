package ${gen.utilPackage?replace("/",".")};
import java.util.*;

/**
 * Created by Administrator on 2018/4/28.
 */
public class StringConvert {

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
}