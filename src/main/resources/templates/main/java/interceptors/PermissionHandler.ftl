package ${gen.interceptorPackage?replace("/",".")};

public interface PermissionHandler {

    /**
     * 判断是否具有权限
     * @return true 有权限；
     */
    default boolean havePermission(String userId, String code) {
        System.out.println("生产环境需要覆盖此接口实现；此处默认具有全部权限，userId：" + userId + "  ,code:" + code);
        return true;
    }
}