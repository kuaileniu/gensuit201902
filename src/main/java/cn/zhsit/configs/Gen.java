package cn.zhsit.configs;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @NotEmpty 用在集合类上面，String类、Collection、Map、数组（String、Collection、Map的isEmpty()方法）
 * @NotBlank 用在String上面，纯空格的也抛异常
 * @NotNull 用在基本类型上, 有变量定义就不报异常
 */
@Component
@ConfigurationProperties(prefix = "zhsit.gen")
public class Gen {
    private boolean printSql = false;
    private boolean initProject = false;
    public static List<String> applicationPackages = new ArrayList<>();
    static {
        applicationPackages.add("controllers");
        applicationPackages.add("models");
        applicationPackages.add("models/vo");
        applicationPackages.add("services");
        applicationPackages.add("services/impl");
        applicationPackages.add("interceptors");
    }
    @NotNull
    private String server;
    //系统名称
    @NotNull
    private String systemName;
    //本系统编码
    @NotNull
    private String systemCode;

    //系统模板类型
    private String templateType;
    //存储到七牛CDN中
    private boolean saveQiniu = false;
    //存储到FastDFS中
    private boolean saveFastDFS = false;
    //存储到本机中
    private boolean saveLocal = false;
    //是否使用poi
    private boolean usePOI = false;
    //是否使用JFreeChart
    private boolean useJFree = false;
    //是否使用useDynamicreports
    private boolean useDynamicreports = false;

    //是否生成工作流
    private boolean workflow = false;
    // 是否使用layui
    private boolean useLayui = false;
    // 是否使用redis
    private boolean useRedis = false;
    // 是否使用alain
    private boolean useAlain = false;
    // 是否使用lua
    private boolean useLua=false;
    //生成的jar包的名称
    private String genServer = "genserver";
    //是否显示注释
    private boolean showComment = false;
    // 是否生成测试类
    private boolean createTest = false;
    //  # 是否生成数据库中所有的表
    public boolean createAll;
    // java类的最小层包路径

    @NotNull
    private String serverApplicationPackage;
    @NotNull
    private String basePackage;
    //注解的包路径
    @NotBlank
    private String annotationPackage;
    @NotBlank
    private String controllerPackage;
    @NotNull
    private String commonServicePackage;
    @NotNull
    private String commonServiceImplPackage;
    @NotNull
    private String commonControllerPackage;
    @NotBlank
    private String vcodePackage;
    @NotBlank
    private String systemPackage;
    @NotBlank
    private String utilPackage;
    @NotBlank
    private String modelPackage;
    @NotNull
    private String modelLayuiPackage;
    @NotNull
    private String modelAlainPackage;
    @NotBlank
    public String poPackage;
    // <表名,实体名>
    @NotEmpty
    public Map<String, String> tableEntity = new HashMap<>();

    // 表对象对应类后缀，词尾
    @NotBlank
    public String poPostfix;
    // query的后缀
    @NotBlank
    public String queryPostfix;
    // 删除对象后缀
    @NotBlank
    public String removePostfix;
    // 修改对象后缀
    @NotBlank
    public String modifyPostfix;
    // provider的后缀
    @NotBlank
    public String providerPostfix;
    @NotBlank
    private String managerImplPostfix;
    @NotBlank
    private String controllerPostfix;
    // query的路径
    @NotBlank
    public String queryPackage;
    // delete对象的路径
    @NotBlank
    public String removePackage;
    // update对象的路径
    @NotBlank
    public String modifyPackage;
    // provider的路径
    @NotBlank
    public String providerPackage;
    // mapper的路径
    @NotBlank
    public String mapperPackage;
    @NotBlank
    private String managerPackage;
    @NotBlank
    private String managerImplPackage;
    @NotBlank
    private String servicePackage;
    @NotBlank
    private String serviceImplPackage;
    //枚举类路径
    @NotBlank
    public String enumPackage;
    //过滤类路径
    @NotBlank
    public String filterPackage;
    //处理类路径
    @NotBlank
    public String handlerPackage;
    //io类路径
    @NotBlank
    public String ioPackage;
    public String officePackage;
    // 持久类后缀; 词尾
    @NotBlank
    public String mapperPostfix;
    //    // 持久类后缀; 词尾
//    @NotBlank
//    public String daoPostfix;
    @NotBlank
    private String managerPostfix;
    // 业务接口类后缀; 词尾
    @NotBlank
    public String servicePostfix;
    // 业务实现类后缀; 词尾
    @NotBlank
    public String serviceImplPostfix;
    // 缓存类的路径
    @NotBlank
    public String cachePackage;
    // 配置类的路径
    @NotBlank
    public String configPackage;
    // helper类的路径
    @NotBlank
    public String helperPackage;
    @NotNull
    private String dbName;
    @NotNull
    private String dfsPackage;
    // 常量包路径
    private String constantsPackage;
    //拦截器路径
    private String interceptorPackage;
    //异常路径
    private String exceptionPackage;


    public boolean isCreateAll() {
        return createAll;
    }

    public void setCreateAll(boolean createAll) {
        this.createAll = createAll;
    }

    public String getBasePackage() {
        return basePackage;
    }

    public void setBasePackage(String basePackage) {
        this.basePackage = basePackage;
    }

    public String getPoPackage() {
        return poPackage;
    }

    public void setPoPackage(String poPackage) {
        this.poPackage = poPackage;
    }

    public Map<String, String> getTableEntity() {
        return tableEntity;
    }

    public void setTableEntity(Map<String, String> tableEntity) {
        this.tableEntity = tableEntity;
    }

    public String getEntityByTableName(String tableName) {
        return tableEntity.get(tableName);
    }

    public String getPoPostfix() {
        return poPostfix;
    }

    public void setPoPostfix(String poPostfix) {
        this.poPostfix = poPostfix;
    }

    public String getQueryPostfix() {
        return queryPostfix;
    }

    public void setQueryPostfix(String queryPostfix) {
        this.queryPostfix = queryPostfix;
    }

    public String getRemovePostfix() {
        return removePostfix;
    }

    public void setRemovePostfix(String removePostfix) {
        this.removePostfix = removePostfix;
    }

    public String getModifyPostfix() {
        return modifyPostfix;
    }

    public void setModifyPostfix(String modifyPostfix) {
        this.modifyPostfix = modifyPostfix;
    }

    public String getProviderPostfix() {
        return providerPostfix;
    }

    public void setProviderPostfix(String providerPostfix) {
        this.providerPostfix = providerPostfix;
    }

    public String getQueryPackage() {
        return queryPackage;
    }

    public void setQueryPackage(String queryPackage) {
        this.queryPackage = queryPackage;
    }

    public String getRemovePackage() {
        return removePackage;
    }

    public void setRemovePackage(String removePackage) {
        this.removePackage = removePackage;
    }

    public String getModifyPackage() {
        return modifyPackage;
    }

    public void setModifyPackage(String modifyPackage) {
        this.modifyPackage = modifyPackage;
    }

    public String getProviderPackage() {
        return providerPackage;
    }

    public void setProviderPackage(String providerPackage) {
        this.providerPackage = providerPackage;
    }

    public String getMapperPackage() {
        return mapperPackage;
    }

    public void setMapperPackage(String mapperPackage) {
        this.mapperPackage = mapperPackage;
    }

    public String getEnumPackage() {
        return enumPackage;
    }

    public void setEnumPackage(String enumPackage) {
        this.enumPackage = enumPackage;
    }

    public String getMapperPostfix() {
        return mapperPostfix;
    }

    public void setMapperPostfix(String mapperPostfix) {
        this.mapperPostfix = mapperPostfix;
    }

    public String getServicePostfix() {
        return servicePostfix;
    }

    public void setServicePostfix(String servicePostfix) {
        this.servicePostfix = servicePostfix;
    }

    public String getServiceImplPostfix() {
        return serviceImplPostfix;
    }

    public void setServiceImplPostfix(String serviceImplPostfix) {
        this.serviceImplPostfix = serviceImplPostfix;
    }

    public boolean isPrintSql() {
        return printSql;
    }

    public void setPrintSql(boolean printSql) {
        this.printSql = printSql;
    }

    public String getAnnotationPackage() {
        return annotationPackage;
    }

    public void setAnnotationPackage(String annotationPackage) {
        this.annotationPackage = annotationPackage;
    }

    public String getManagerPostfix() {
        return managerPostfix;
    }

    public void setManagerPostfix(String managerPostfix) {
        this.managerPostfix = managerPostfix;
    }

    public String getManagerPackage() {
        return managerPackage;
    }

    public void setManagerPackage(String managerPackage) {
        this.managerPackage = managerPackage;
    }

    public String getManagerImplPackage() {
        return managerImplPackage;
    }

    public void setManagerImplPackage(String managerImplPackage) {
        this.managerImplPackage = managerImplPackage;
    }

    public String getServicePackage() {
        return servicePackage;
    }

    public void setServicePackage(String servicePackage) {
        this.servicePackage = servicePackage;
    }

    public String getServiceImplPackage() {
        return serviceImplPackage;
    }

    public void setServiceImplPackage(String serviceImplPackage) {
        this.serviceImplPackage = serviceImplPackage;
    }

    public String getManagerImplPostfix() {
        return managerImplPostfix;
    }

    public void setManagerImplPostfix(String managerImplPostfix) {
        this.managerImplPostfix = managerImplPostfix;
    }

    public String getModelPackage() {
        return modelPackage;
    }

    public void setModelPackage(String modelPackage) {
        this.modelPackage = modelPackage;
    }

    public String getModelLayuiPackage() {
        return modelLayuiPackage;
    }

    public Gen setModelLayuiPackage(String modelLayuiPackage) {
        this.modelLayuiPackage = modelLayuiPackage;
        return this;
    }

    public String getModelAlainPackage() {
        return modelAlainPackage;
    }

    public Gen setModelAlainPackage(String modelAlainPackage) {
        this.modelAlainPackage = modelAlainPackage;
        return this;
    }

    public String getUtilPackage() {
        return utilPackage;
    }

    public void setUtilPackage(String utilPackage) {
        this.utilPackage = utilPackage;
    }

    public String getVcodePackage() {
        return vcodePackage;
    }

    public void setVcodePackage(String vcodePackage) {
        this.vcodePackage = vcodePackage;
    }

    public String getControllerPackage() {
        return controllerPackage;
    }

    public void setControllerPackage(String controllerPackage) {
        this.controllerPackage = controllerPackage;
    }

    public String getControllerPostfix() {
        return controllerPostfix;
    }

    public void setControllerPostfix(String controllerPostfix) {
        this.controllerPostfix = controllerPostfix;
    }

    public String getHandlerPackage() {
        return handlerPackage;
    }

    public void setHandlerPackage(String handlerPackage) {
        this.handlerPackage = handlerPackage;
    }

    public String getFilterPackage() {
        return filterPackage;
    }

    public void setFilterPackage(String filterPackage) {
        this.filterPackage = filterPackage;
    }

    public String getIoPackage() {
        return ioPackage;
    }

    public void setIoPackage(String ioPackage) {
        this.ioPackage = ioPackage;
    }

    public String getCachePackage() {
        return cachePackage;
    }

    public void setCachePackage(String cachePackage) {
        this.cachePackage = cachePackage;
    }

    public String getConfigPackage() {
        return configPackage;
    }

    public void setConfigPackage(String configPackage) {
        this.configPackage = configPackage;
    }

    public String getHelperPackage() {
        return helperPackage;
    }

    public void setHelperPackage(String helperPackage) {
        this.helperPackage = helperPackage;
    }

    public String getServer() {
        return server;
    }

    public Gen setServer(String server) {
        this.server = server;
        return this;
    }

    public String getServerApplicationPackage() {
        return serverApplicationPackage;
    }

    public Gen setServerApplicationPackage(String serverApplicationPackage) {
        this.serverApplicationPackage = serverApplicationPackage;
        return this;
    }

    public boolean isInitProject() {
        return initProject;
    }

    public Gen setInitProject(boolean initProject) {
        this.initProject = initProject;
        return this;
    }

    public String getGenServer() {
        return genServer;
    }

    public Gen setGenServer(String genServer) {
        this.genServer = genServer;
        return this;
    }

    public String getCommonControllerPackage() {
        return commonControllerPackage;
    }

    public Gen setCommonControllerPackage(String commonControllerPackage) {
        this.commonControllerPackage = commonControllerPackage;
        return this;
    }

    public String getCommonServicePackage() {
        return commonServicePackage;
    }

    public Gen setCommonServicePackage(String commonServicePackage) {
        this.commonServicePackage = commonServicePackage;
        return this;
    }

    public String getCommonServiceImplPackage() {
        return commonServiceImplPackage;
    }

    public Gen setCommonServiceImplPackage(String commonServiceImplPackage) {
        this.commonServiceImplPackage = commonServiceImplPackage;
        return this;
    }

    public boolean isSaveQiniu() {
        return saveQiniu;
    }

    public Gen setSaveQiniu(boolean saveQiniu) {
        this.saveQiniu = saveQiniu;
        return this;
    }

    public boolean isSaveFastDFS() {
        return saveFastDFS;
    }

    public Gen setSaveFastDFS(boolean saveFastDFS) {
        this.saveFastDFS = saveFastDFS;
        return this;
    }

    public String getDfsPackage() {
        return dfsPackage;
    }

    public Gen setDfsPackage(String dfsPackage) {
        this.dfsPackage = dfsPackage;
        return this;
    }

    public String getDbName() {
        return dbName;
    }

    public Gen setDbName(String dbName) {
        this.dbName = dbName;
        return this;
    }

    public boolean isShowComment() {
        return showComment;
    }

    public Gen setShowComment(boolean showComment) {
        this.showComment = showComment;
        return this;
    }

    public boolean isCreateTest() {
        return createTest;
    }

    public Gen setCreateTest(boolean createTest) {
        this.createTest = createTest;
        return this;
    }

    public boolean isSaveLocal() {
        return saveLocal;
    }

    public Gen setSaveLocal(boolean saveLocal) {
        this.saveLocal = saveLocal;
        return this;
    }

    public boolean isWorkflow() {
        return workflow;
    }

    public Gen setWorkflow(boolean workflow) {
        this.workflow = workflow;
        return this;
    }

    public String getSystemName() {
        return systemName;
    }

    public Gen setSystemName(String systemName) {
        this.systemName = systemName;
        return this;
    }

    public String getSystemCode() {
        return systemCode;
    }

    public Gen setSystemCode(String systemCode) {
        this.systemCode = systemCode;
        return this;
    }

    public String getConstantsPackage() {
        return constantsPackage;
    }

    public Gen setConstantsPackage(String constantsPackage) {
        this.constantsPackage = constantsPackage;
        return this;
    }

    public String getInterceptorPackage() {
        return interceptorPackage;
    }

    public Gen setInterceptorPackage(String interceptorPackage) {
        this.interceptorPackage = interceptorPackage;
        return this;
    }

    public String getExceptionPackage() {
        return exceptionPackage;
    }

    public Gen setExceptionPackage(String exceptionPackage) {
        this.exceptionPackage = exceptionPackage;
        return this;
    }

    public String getTemplateType() {
        return templateType;
    }

    public Gen setTemplateType(String templateType) {
        this.templateType = templateType;
        return this;
    }

    public boolean isUsePOI() {
        return usePOI;
    }

    public Gen setUsePOI(boolean usePOI) {
        this.usePOI = usePOI;
        return this;
    }

    public boolean isUseJFree() {
        return useJFree;
    }

    public Gen setUseJFree(boolean useJFree) {
        this.useJFree = useJFree;
        return this;
    }

    public boolean isUseDynamicreports() {
        return useDynamicreports;
    }

    public Gen setUseDynamicreports(boolean useDynamicreports) {
        this.useDynamicreports = useDynamicreports;
        return this;
    }

    public boolean isUseLayui() {
        return useLayui;
    }

    public Gen setUseLayui(boolean useLayui) {
        this.useLayui = useLayui;
        return this;
    }

    public boolean isUseAlain() {
        return useAlain;
    }

    public Gen setUseAlain(boolean useAlain) {
        this.useAlain = useAlain;
        return this;
    }

    public String getSystemPackage() {
        return systemPackage;
    }

    public Gen setSystemPackage(String systemPackage) {
        this.systemPackage = systemPackage;
        return this;
    }

    public boolean isUseRedis() {
        return useRedis;
    }

    public Gen setUseRedis(boolean useRedis) {
        this.useRedis = useRedis;
        return this;
    }

    public String getOfficePackage() {
        return officePackage;
    }

    public void setOfficePackage(String officePackage) {
        this.officePackage = officePackage;
    }

    public boolean isUseLua() {
        return useLua;
    }

    public Gen setUseLua(boolean useLua) {
        this.useLua = useLua;
        return this;
    }
}
