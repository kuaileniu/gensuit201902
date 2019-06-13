package ${gen.systemPackage?replace("/",".")};

public class SystemUtil {

<#if (gen.showComment==true)>
    /**
     * 获取操作系统位数
     * @return 操作系统位数（64位等)
     */
</#if>
    public static String systemBit() {
        return System.getProperty("sun.arch.data.model");
    }
}