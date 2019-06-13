package ${gen.utilPackage?replace("/",".")};

import java.util.*;

/**
 *
 */
public class SqlMapperUtil {
<#if (gen.showComment==true)>
     //未生成
</#if>
    public String param(String paramName, Object paramVal, Map params) {
        params.put(paramName, paramVal);
        return "${r"#"}{p." + paramName + "}";
    }

}