package ${gen.interceptorPackage?replace("/",".")};

public interface PermissionHandler {
<#if (gen.showComment==true)>
    /**
     * 判断是否具有权限
     * @return true 有权限；
     */
</#if>
    default boolean havePermission(String userId, String code) {
<#if (gen.showComment==true)>
        System.out.println("生产环境需要覆盖此接口实现；此处默认具有全部权限，userId：" + userId + "  ,code:" + code);
</#if>
        return true;
    }
}