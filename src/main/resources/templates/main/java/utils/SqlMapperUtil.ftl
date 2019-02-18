package ${gen.utilPackage?replace("/",".")};

import java.util.*;

/**
 *
 */
public class SqlMapperUtil {

     未生成

    public String param(String paramName, Object paramVal, Map params) {
        params.put(paramName, paramVal);
        return "${r"#"}{p." + paramName + "}";
    }

}