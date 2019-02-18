package ${gen.providerPackage?replace("/",".")};

import org.apache.ibatis.annotations.Param;
import java.util.Map;

public class SqlProvider {

    public String nativeSql(String sql, @Param("p") Map<String, Object> params) {
        return sql;
    }

}