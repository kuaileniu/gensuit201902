package ${gen.systemPackage?replace("/",".")};

public class SystemUtil {
  
    /**
     * 获取操作系统位数
     * @return 操作系统位数（64位等)
     */
    public static String systemBit() {
        return System.getProperty("sun.arch.data.model");
    }
}