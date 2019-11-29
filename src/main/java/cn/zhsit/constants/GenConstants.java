package cn.zhsit.constants;

import cn.zhsit.utils.ZhsStringUtil;

import java.io.File;

/**
 * Created by Administrator on 2018/3/18.
 */
public class GenConstants {
    public static final String UTF8 = "UTF-8";

    //    项目的根路径。例如 D:\src\gensuite
    public final static String RootPath = new File("").getAbsolutePath();
    //    项目上级路径。例如 D:\src
    public final static String RootParentPath = ZhsStringUtil.beforeLast(RootPath, File.separator);
    private final static String main_java_ftl = "main/java/";
    private final static String test_java_ftl = "test/java/";
    //maven工程的java类文件路径
    public static final String mavenMain = "src/main/";
    public static final String mavenTest = "src/test/";
    public static final String mavenMainJava = "src/main/java/";
    public static final String mavenTestJava = "src/test/java/";
    public static final String mavenMainResources = "src/main/resources/";
    public static final String mavenTestResources = "src/test/resources/";


    //生成文件所用的模板存放位置
//    public static final String templateDirectory = "src/test/resources/templates/";
    public static final String templateDirectory = "src/main/resources/templates/";
    //权限码风格符
    public static final String AuthoritySeparator = "_";

    //空字符串
    public final static String EMPTY_STR = "";
    public final static String PERCENT = "%";
    public final static String annotationSeparator = ",";
    public final static String annotationEqualSeparator = "=";
    public final static String annotationTableFieldSeparator = ".";
    public final static String annotationPreFix = "[![";
    public final static String annotationPostFix = "]!]";
    //文件后缀
    public static String JAVA_POSTFIX = ".java";

    //枚举类名
    public static final String enum_order = "OrderBy";
    public static final String enum_Province = "Province";
    public static final String enum_WhereRelate = "WhereRelate";
    public static final String enum_ResponseCode = "ResponseCode";
    public static final String enum_Func = "Func";
    public static final String enum_WhereType = "WhereType";
    public static final String enum_Op = "Op";
    public static final String enum_SrcType = "SrcType";
    public static final String enum_UserType = "UserType";
    public static final String enum_DFSGroupEnum = "DFSGroupEnum";


    // 表主键注解类
//    public static final String annotation_table_key = "TableKey";
    public static final String annotation_primary_column = "PrimaryColumn";
    public static final String annotation_foreign_column = "ForeignColumn";
    public static final String annotation_ALogin = "ALogin";
    public static final String annotation_AXss = "AXss";
    public static final String annotation_authority = "Authority";
    //    public static final String annotation_menu = "Menu";
    public static final String annotation_AMenu = "AMenu";
    public static final String annotation_show = "Show";
    public static final String annotation_Mine = "Mine";
    public static final String annotation_Hidden = "Hidden";
    public static final String annotation_Pwd = "Pwd";
    public static final String annotation_Rong = "Rong";
    public static final String annotation_SameColumn = "SameColumn";
    public static final String annotation_Download = "Download";
    public static final String annotation_AFile = "AFile";
    public static final String annotation_ARole = "ARole";
    public static final String annotation_AUser = "AUser";
    public static final String annotation_AOrg = "AOrg";
    public static final String annotation_ALessee = "ALessee";
    public static final String annotation_ADict = "ADict";
    public static final String annotation_ADictModule = "ADictModule";
    public static final String annotation_APermission = "APermission";

    public static final String annotation_VirtualController = "VirtualController";
    public static final String annotation_Interceptor = "Interceptor";
    public static final String annotation_IndexMessage = "IndexMessage";


    public static final String annotation_Qiniu = "Qiniu";
    public static final String annotation_ZFastDFS = "ZFastDFS";
    public static final String annotation_DefaultEqual = "DefaultEqual";
    public static final String annotation_LesseeId = "LesseeId";
    public static final String annotation_UserId = "UserId";
    public static final String annotation_DictModuleCode = "DictModuleCode";
    public static final String annotation_SystemCode = "SystemCode";
    public static final String comment_Mine_prefix = annotationPreFix + annotation_Mine;
    public static final String comment_Hidden_prefix = annotationPreFix + annotation_Hidden;
    public static final String comment_Pwd_prefix = annotationPreFix + annotation_Pwd;
    public static final String comment_Rong_prefix = annotationPreFix + annotation_Rong;
    public static final String comment_ZFastDFS_prefix = annotationPreFix + annotation_ZFastDFS;
    public static final String comment_DefaultEqual_prefix = annotationPreFix + annotation_DefaultEqual;
    public static final String comment_LesseeId_prefix = annotationPreFix + annotation_LesseeId;
    public static final String comment_UserId_prefix = annotationPreFix + annotation_UserId;
    public static final String comment_DictModuleCode_prefix = annotationPreFix + annotation_DictModuleCode;
    public static final String comment_SystemCode_prefix = annotationPreFix + annotation_SystemCode;
    public static final String comment_AFile_prefix = annotationPreFix + annotation_AFile;
    public static final String comment_ARole_prefix = annotationPreFix + annotation_ARole;
    public static final String comment_AUser_prefix = annotationPreFix + annotation_AUser;
    public static final String comment_AOrg_prefix = annotationPreFix + annotation_AOrg;
    public static final String comment_ALessee_prefix = annotationPreFix + annotation_ALessee;
    public static final String comment_ADict_prefix = annotationPreFix + annotation_ADict;
    public static final String comment_ADictModule_prefix = annotationPreFix + annotation_ADictModule;
    public static final String comment_APermission_prefix = annotationPreFix + annotation_APermission;
    public static final String comment_IndexMessage_prefix = annotationPreFix + annotation_IndexMessage;

    //
    public static final String SqlMapper = "SqlMapper";
    public static final String SqlProvider = "SqlProvider";
    public static final String JdbcMapper = "JdbcMapper";
    public static final String base_manager = "BaseManager";
    public static final String base_service = "BaseService";
    public static final String base_controller = "BaseController";
    public static final String common_controller = "CommonController";
    public static final String ViewPermission = "ViewPermission";
    public static final String files_controller = "FilesController";
    public static final String files_service = "FilesService";
    public static final String files_service_impl = "FilesServiceImpl";
    public static final String data_page = "DataPage";
    public static final String Response = "Response";
    public static final String Session = "Session";
    public static final String JwtToken = "JwtToken";
    public static final String ClientBrowser = "ClientBrowser";
    public static final String RequestModel = "RequestModel";
    public static final String JwtAccount = "JwtAccount";
    public static final String Request = "Request";
    public static final String ResponseModel = "ResponseModel";
    public static final String ControllerClassContext = "ControllerClassContext";
    public static final String ZCallable = "ZCallable";
    public static final String AuthorityModel = "AuthorityModel";
    public static final String ClassWrapper = "ClassWrapper";
    public static final String MenuModel = "MenuModel";
    public static final String LayMenu = "LayMenu";
    public static final String AlainRequestModel = "AlainRequestModel";
    public static final String LayRequestModel = "LayRequestModel";
    public static final String LayResponseModel = "LayResponseModel";
    public static final String MethodWrapper = "MethodWrapper";
    public static final String FieldWrapper = "FieldWrapper";
    public static final String ResponseTest = "ResponseTest";
    public static final String LesseeTest = "LesseeTest";
    public static final String RequestTest = "RequestTest";
    public static final String BaseTest = "BaseTest";
    public static final String CreateAllTest = "CreateAllTest";
    public static final String UserMapperTest = "UserMapperTest";
    public static final String BaseControllerTest = "BaseControllerTest";
    public static final String UserControllerTest = "UserControllerTest";
    public static final String LesseeControllerTest = "LesseeControllerTest";
    public static final String CommonControllerTest = "CommonControllerTest";
    public static final String WebUtil = "WebUtil";
    public static final String Captcha = "Captcha";
    public static final String Encoder = "Encoder";
    public static final String GifCaptcha = "GifCaptcha";
    public static final String GifEncoder = "GifEncoder";
    public static final String Quant = "Quant";
    public static final String Randoms = "Randoms";
    public static final String SpecCaptcha = "SpecCaptcha";
    public static final String Unique = "Unique";
    public static final String ValidateUtils = "ValidateUtils";
    public static final String Encrypt = "Encrypt";
    public static final String ConvertUtil = "ConvertUtil";
    public static final String StringUtil = "StringUtil";
    public static final String RedisUtil = "RedisUtil";
    public static final String Sequence = "Sequence";
    public static final String SystemClock = "SystemClock";
    public static final String Zset = "Zset";
    public static final String ExpireMap = "ExpireMap";
    public static final String TimeUtilZhs = "TimeUtilZhs";
    public static final String JdbcUtil = "JdbcUtil";
    public static final String ClazzUtil = "ClazzUtil";
    public static final String RandomUtil = "RandomUtil";
    public static final String JWTUtil = "JWTUtil";
    public static final String AESUtil = "AESUtil";
    public static final String ByteUtil = "ByteUtil";
    public static final String XssUtil = "XssUtil";
    public static final String SqlMapperUtil = "SqlMapperUtil";
    public static final String JDKSerializer = "JDKSerializer";
    //    public static final String ZWordUtil = "ZWordUtil";
    public static final String ZOfficeUtil = "ZOfficeUtil";
    public static final String KryoSerializer = "KryoSerializer";
    public static final String ProtoBufSerializer = "ProtoBufSerializer";
    public static final String Serializer = "Serializer";
    public static final String MultiDateDeserializer = "MultiDateDeserializer";
    public static final String DateJsonSerializer = "DateJsonSerializer";
    public static final String DateHanZiJsonSerializer = "DateHanZiJsonSerializer";
    public static final String DateTimeJsonSerializer = "DateTimeJsonSerializer";
    public static final String ContextHandler = "ContextHandler";
    public static final String MybatisJsonTypeHandler = "MybatisJsonTypeHandler";
    public static final String ContextFilter = "ContextFilter";
    public static final String BodyReaderHttpServletRequestWrapper = "BodyReaderHttpServletRequestWrapper";
    public static final String ResponseWrapper = "ResponseWrapper";
    public static final String A001MappedFilter = "A001MappedFilter";
    public static final String MapperInclude = "MapperInclude";
    public static final String A005XssFilter = "A005XssFilter";
    public static final String XssHttpServletRequestWrapper = "XssHttpServletRequestWrapper";
    public static final String GenMapperInclude = "GenMapperInclude";
    public static final String JavaClass2ProtoBuf = "JavaClass2ProtoBuf";
    public static final String SystemUtil = "SystemUtil";
    public static final String OS = "OS";
    public static final String RedisConfig = "RedisConfig";
    public static final String WebConfig = "WebConfig";
    public static final String ActivitiConfig = "ActivitiConfig";
    public static final String InterceptorConfig = "InterceptorConfig";
    public static final String ALoginInterceptor = "ALoginInterceptor";
    public static final String HeaderInterceptor = "HeaderInterceptor";
    public static final String AXssInterceptor = "AXssInterceptor";
    public static final String PermissionHandler = "PermissionHandler";
    public static final String CacheHandler = "CacheHandler";
    public static final String APermissionInterceptor = "APermissionInterceptor";
    public static final String TokenInterceptor = "TokenInterceptor";
    public static final String RequestParamInterceptor = "RequestParamInterceptor";
    public static final String ResponseParamInterceptor = "ResponseParamInterceptor";
    public static final String ErrorInterceptor = "ErrorInterceptor";
    public static final String CacheHelper = "CacheHelper";
    public static final String JsonHelper = "JsonHelper";
    public static final String ContextException = "ContextException";
    public static final String GenApplication = "GenApplication";
    public static final String ServerApplication = "ServerApplication";
    public static final String FastDFSTest = "FastDFSTest";
    public static final String FastDFSComponent = "FastDFSComponent";
    public static final String StaffRoleChange = "StaffRoleChange";
    public static final String RoleMenuChange = "RoleMenuChange";
    public static final String RolePermissionChange = "RolePermissionChange";

    public static final String GenConstant = "GenConstant";

    public static final String FastDFSComponentTest = "FastDFSComponentTest";
    public static final String SqlMapperTest = "SqlMapperTest";
    public static final String DataSourceTest = "DataSourceTest";
    public static final String JsonHelperTest = "JsonHelperTest";
    public static final String RequestModelTest = "RequestModelTest";


    // 模板名称
//    public static final String PO_FTL = main_java_ftl + "pos/pos.ftl";
    public static final String PO_FTL = main_java_ftl + "models/pos/po.ftl";
    public static final String PRIMARY_COLUMN_FTL = main_java_ftl + "annotations/primaryColumn.ftl";
    public static final String FOREIGN_COLUMN_FTL = main_java_ftl + "annotations/foreignColumn.ftl";
    public static final String ALOGIN_FTL = main_java_ftl + "annotations/ALogin.ftl";
    public static final String AXss_FTL = main_java_ftl + "annotations/AXss.ftl";
    public static final String AUTHORITY_FTL = main_java_ftl + "annotations/Authority.ftl";
    //    public static final String MENU_FTL = main_java_ftl + "annotations/menu.ftl";
    public static final String AMENU_FTL = main_java_ftl + "annotations/AMenu.ftl";
    public static final String SHOW_FTL = main_java_ftl + "annotations/show.ftl";
    public static final String MINE_FTL = main_java_ftl + "annotations/Mine.ftl";
    public static final String Hidden_FTL = main_java_ftl + "annotations/Hidden.ftl";
    public static final String Pwd_FTL = main_java_ftl + "annotations/Pwd.ftl";
    public static final String Rong_FTL = main_java_ftl + "annotations/Rong.ftl";
    public static final String SameColumn_FTL = main_java_ftl + "annotations/SameColumn.ftl";
    public static final String Download_FTL = main_java_ftl + "annotations/Download.ftl";
    public static final String AFile_FTL = main_java_ftl + "annotations/AFile.ftl";
    public static final String ARole_FTL = main_java_ftl + "annotations/ARole.ftl";
    public static final String AUser_FTL = main_java_ftl + "annotations/AUser.ftl";
    public static final String APermission_FTL = main_java_ftl + "annotations/APermission.ftl";
    public static final String AOrg_FTL = main_java_ftl + "annotations/AOrg.ftl";
    public static final String VirtualController_FTL = main_java_ftl + "annotations/VirtualController.ftl";
    public static final String Interceptor_FTL = main_java_ftl + "annotations/Interceptor.ftl";
    public static final String Qiniu_FTL = main_java_ftl + "annotations/Qiniu.ftl";
    public static final String ZFastDFS_FTL = main_java_ftl + "annotations/ZFastDFS.ftl";

    public static final String ORDER_FTL = main_java_ftl + "enums/order.ftl";
    public static final String WhereRelate_FTL = main_java_ftl + "enums/WhereRelate.ftl";
    public static final String ResponseCode_FTL = main_java_ftl + "enums/ResponseCode.ftl";
    public static final String Func_FTL = main_java_ftl + "enums/Func.ftl";
    public static final String WhereType_FTL = main_java_ftl + "enums/WhereType.ftl";
    public static final String Province_FTL = main_java_ftl + "enums/Province.ftl";
    public static final String Op_FTL = main_java_ftl + "enums/Op.ftl";
    public static final String SrcType_FTL = main_java_ftl + "enums/SrcType.ftl";
    public static final String UserType_FTL = main_java_ftl + "enums/UserType.ftl";
    public static final String DFSGroupEnum_FTL = main_java_ftl + "enums/DFSGroupEnum.ftl";


    public static final String QUERY_FTL = main_java_ftl + "mappers/query.ftl";
    public static final String REMOVE_FTL = main_java_ftl + "mappers/remove.ftl";
    public static final String MODIFY_FTL = main_java_ftl + "mappers/modify.ftl";
    public static final String PROVIDER_FTL = main_java_ftl + "mappers/provider.ftl";
    public static final String MAPPER_FTL = main_java_ftl + "mappers/mapper.ftl";
    public static final String SqlMapper_FTL = main_java_ftl + "mappers/sqlmapper.ftl";
    public static final String SQL_PROVIDER_FTL = main_java_ftl + "mappers/sqlprovider.ftl";
    public static final String JdbcMapper_FTL = main_java_ftl + "mappers/JdbcMapper.ftl";

    public static final String SERVICE_FTL = main_java_ftl + "services/service.ftl";
    public static final String SERVICE_IMPL_FTL = main_java_ftl + "services/serviceImpl.ftl";
    public static final String CONTROLLER_FTL = main_java_ftl + "controllers/Controller.ftl";
    public static final String MANAGER_IMPL_FTL = main_java_ftl + "managers/managerImpl.ftl";


    public static final String MANAGER_FTL = main_java_ftl + "managers/manager.ftl";
    public static final String BASE_MANAGER_FTL = main_java_ftl + "managers/BaseManager.ftl";
    public static final String BASE_SERVICE_FTL = main_java_ftl + "services/BaseService.ftl";
    public static final String BASE_CONTROLLER_FTL = main_java_ftl + "controllers/BaseController.ftl";
    public static final String COMMON_CONTROLLER_FTL = main_java_ftl + "controllers/CommonController.ftl";
    public static final String ViewPermission_FTL = main_java_ftl + "controllers/ViewPermission.ftl";
    public static final String Files_CONTROLLER_FTL = main_java_ftl + "controllers/common/FilesController.ftl";
    public static final String FILES_SERVICE_FTL = main_java_ftl + "services/common/FilesService.ftl";
    public static final String FILES_SERVICE_IMPL_FTL = main_java_ftl + "services/impl/common/FilesServiceImpl.ftl";
    public static final String DATA_PAGE_FTL = main_java_ftl + "models/dataPage.ftl";
    //    public static final String RESPONSE_BO_FTL = main_java_ftl + "models/responseBo.ftl";
    public static final String Response_FTL = main_java_ftl + "models/Response.ftl";
    public static final String SESSION_FTL = main_java_ftl + "models/Session.ftl";
    public static final String JwtToken_FTL = main_java_ftl + "models/JwtToken.ftl";
    public static final String ClientBrowser_FTL = main_java_ftl + "models/ClientBrowser.ftl";
    public static final String RequestModel_FTL = main_java_ftl + "models/RequestModel.ftl";
    public static final String JwtAccount_FTL = main_java_ftl + "models/JwtAccount.ftl";
    public static final String Request_FTL = main_java_ftl + "models/Request.ftl";
    public static final String ResponseModel_FTL = main_java_ftl + "models/ResponseModel.ftl";
    public static final String ControllerClassContext_FTL = main_java_ftl + "models/ControllerClassContext.ftl";
    public static final String ZCallable_FTL = main_java_ftl + "parallels/ZCallable.ftl";
    public static final String AuthorityModel_FTL = main_java_ftl + "models/AuthorityModel.ftl";
    public static final String ClassWrapper_FTL = main_java_ftl + "models/ClassWrapper.ftl";
    public static final String MenuModel_FTL = main_java_ftl + "models/MenuModel.ftl";
    public static final String LayMenu_FTL = main_java_ftl + "models/layui/LayMenu.ftl";
    public static final String LayRequestModel_FTL = main_java_ftl + "models/layui/LayRequestModel.ftl";
    public static final String LayResponseModel_FTL = main_java_ftl + "models/layui/LayResponseModel.ftl";
    public static final String AlainRequestModel_FTL = main_java_ftl + "models/alain/AlainRequestModel.ftl";
    public static final String MethodWrapper_FTL = main_java_ftl + "models/MethodWrapper.ftl";
    public static final String FieldWrapper_FTL = main_java_ftl + "models/FieldWrapper.ftl";
    public static final String StaffRoleChange_FTL = main_java_ftl + "models/dtos/StaffRoleChange.ftl";
    public static final String RoleMenuChange_FTL = main_java_ftl + "models/dtos/RoleMenuChange.ftl";
    public static final String RolePermissionChange_FTL = main_java_ftl + "models/dtos/RolePermissionChange.ftl";

    public static final String vcode_Captcha_FTL = main_java_ftl + "utils/vcode/Captcha.ftl";
    public static final String vcode_GifEncoder_FTL = main_java_ftl + "utils/vcode/GifEncoder.ftl";
    public static final String vcode_Encoder_FTL = main_java_ftl + "utils/vcode/Encoder.ftl";
    public static final String vcode_GifCaptcha_FTL = main_java_ftl + "utils/vcode/GifCaptcha.ftl";
    public static final String vcode_Quant_FTL = main_java_ftl + "utils/vcode/Quant.ftl";
    public static final String vcode_Randoms_FTL = main_java_ftl + "utils/vcode/Randoms.ftl";
    public static final String vcode_SpecCaptcha_FTL = main_java_ftl + "utils/vcode/SpecCaptcha.ftl";
    public static final String Unique_FTL = main_java_ftl + "utils/Unique.ftl";
    public static final String ValidateUtils_FTL = main_java_ftl + "utils/ValidateUtils.ftl";
    public static final String Encrypt_FTL = main_java_ftl + "utils/Encrypt.ftl";
    public static final String ConvertUtil_FTL = main_java_ftl + "utils/ConvertUtil.ftl";
    public static final String WebUtil_FTL = main_java_ftl + "utils/WebUtil.ftl";
    public static final String StringUtil_FTL = main_java_ftl + "utils/StringUtil.ftl";
    public static final String RedisUtil_FTL = main_java_ftl + "utils/RedisUtil.ftl";
    public static final String Sequence_FTL = main_java_ftl + "utils/Sequence.ftl";
    public static final String SystemClock_FTL = main_java_ftl + "utils/SystemClock.ftl";
    public static final String Zset_FTL = main_java_ftl + "utils/Zset.ftl";
    public static final String ExpireMap_FTL = main_java_ftl + "utils/ExpireMap.ftl";
    public static final String TimeUtilZhs_FTL = main_java_ftl + "utils/TimeUtilZhs.ftl";
    public static final String JdbcUtil_FTL = main_java_ftl + "utils/JdbcUtil.ftl";
    public static final String ClazzUtil_FTL = main_java_ftl + "utils/ClazzUtil.ftl";
    public static final String RandomUtil_FTL = main_java_ftl + "utils/RandomUtil.ftl";
    public static final String JWTUtil_FTL = main_java_ftl + "utils/JWTUtil.ftl";
    public static final String AESUtil_FTL = main_java_ftl + "utils/AESUtil.ftl";
    public static final String ByteUtil_FTL = main_java_ftl + "utils/ByteUtil.ftl";
    public static final String XssUtil_FTL = main_java_ftl + "utils/XssUtil.ftl";
    public static final String SqlMapperUtil_FTL = main_java_ftl + "utils/SqlMapperUtil.ftl";
    public static final String JavaClass2ProtoBuf_FTL = main_java_ftl + "utils/io/JavaClass2ProtoBuf.ftl";
    public static final String JDKSerializer_FTL = main_java_ftl + "utils/io/JDKSerializer.ftl";
    //    public static final String ZWordUtil_FTL = main_java_ftl + "utils/office/ZWordUtil.ftl";
    public static final String ZOfficeUtil_FTL = main_java_ftl + "utils/office/ZOfficeUtil.ftl";
    public static final String KryoSerializer_FTL = main_java_ftl + "utils/io/KryoSerializer.ftl";
    public static final String ProtoBufSerializer_FTL = main_java_ftl + "utils/io/ProtoBufSerializer.ftl";
    public static final String Serializer_FTL = main_java_ftl + "utils/io/Serializer.ftl";
    public static final String MultiDateDeserializer_FTL = main_java_ftl + "utils/io/MultiDateDeserializer.ftl";
    public static final String DateJsonSerializer_FTL = main_java_ftl + "utils/io/DateJsonSerializer.ftl";
    public static final String DateHanZiJsonSerializer_FTL = main_java_ftl + "utils/io/DateHanZiJsonSerializer.ftl";
    public static final String DateTimeJsonSerializer_FTL = main_java_ftl + "utils/io/DateTimeJsonSerializer.ftl";
    public static final String SystemUtil_FTL = main_java_ftl + "utils/system/SystemUtil.ftl";
    public static final String OS_FTL = main_java_ftl + "utils/system/OS.ftl";
    public static final String ContextHandler_FTL = main_java_ftl + "handlers/ContextHandler.ftl";
    public static final String MybatisJsonTypeHandler_FTL = main_java_ftl + "handlers/MybatisJsonTypeHandler.ftl";
    public static final String ContextFilter_FTL = main_java_ftl + "filters/ContextFilter.ftl";
    public static final String BodyReaderHttpServletRequestWrapper_FTL = main_java_ftl + "filters/BodyReaderHttpServletRequestWrapper.ftl";
    public static final String ResponseWrapper_FTL = main_java_ftl + "filters/ResponseWrapper.ftl";
    public static final String A001MappedFilter_FTL = main_java_ftl + "filters/A001MappedFilter.ftl";
    public static final String MapperInclude_FTL = main_java_ftl + "filters/MapperInclude.ftl";
    public static final String A005XssFilter_FTL = main_java_ftl + "filters/A005XssFilter.ftl";
    public static final String XssHttpServletRequestWrapper_FTL = main_java_ftl + "filters/XssHttpServletRequestWrapper.ftl";
    public static final String GenMapperInclude_FTL = main_java_ftl + "filters/GenMapperInclude.ftl";

    public static final String RedisConfig_FTL = main_java_ftl + "configs/RedisConfig.ftl";
    public static final String WebConfig_FTL = main_java_ftl + "configs/WebConfig.ftl";
    public static final String ActivitiConfig_FTL = main_java_ftl + "configs/ActivitiConfig.ftl";
    public static final String InterceptorConfig_FTL = main_java_ftl + "configs/InterceptorConfig.ftl";
    public static final String ALoginInterceptor_FTL = main_java_ftl + "interceptors/ALoginInterceptor.ftl";
    public static final String HeaderInterceptor_FTL = main_java_ftl + "interceptors/HeaderInterceptor.ftl";
    public static final String AXssInterceptor_FTL = main_java_ftl + "interceptors/AXssInterceptor.ftl";
    public static final String PermissionHandler_FTL = main_java_ftl + "interceptors/PermissionHandler.ftl";
    public static final String CacheHandler_FTL = main_java_ftl + "interceptors/CacheHandler.ftl";
    public static final String APermissionInterceptor_FTL = main_java_ftl + "interceptors/APermissionInterceptor.ftl";
    public static final String TokenInterceptor_FTL = main_java_ftl + "interceptors/TokenInterceptor.ftl";
    public static final String RequestParamInterceptor_FTL = main_java_ftl + "interceptors/RequestParamInterceptor.ftl";
    public static final String ResponseParamInterceptor_FTL = main_java_ftl + "interceptors/ResponseParamInterceptor.ftl";
    public static final String ErrorInterceptor_FTL = main_java_ftl + "interceptors/ErrorInterceptor.ftl";
    public static final String CacheHelper_FTL = main_java_ftl + "helpers/CacheHelper.ftl";
    public static final String JsonHelper_FTL = main_java_ftl + "helpers/JsonHelper.ftl";
    public static final String ContextException_FTL = main_java_ftl + "exceptions/ContextException.ftl";

    public static final String GenApplication_FTL = main_java_ftl + "GenApplication.ftl";
    public static final String ServerApplication_FTL = main_java_ftl + "ServerApplication.ftl";
    public static final String FastDFSComponent_FTL = main_java_ftl + "dfs/FastDFSComponent.ftl";
    public static final String GenConstant_FTL = main_java_ftl + "constants/GenConstant.ftl";

    //test目录
    public static final String FastDFSTest_FTL = test_java_ftl + "dfs/FastDFSTest.ftl";
    public static final String FastDFSComponentTest_FTL = test_java_ftl + "dfs/FastDFSComponentTest.ftl";
    public static final String SqlMapperTest_FTL = test_java_ftl + "mappers/SqlMapperTest.ftl";
    public static final String DataSourceTest_FTL = test_java_ftl + "mappers/DataSourceTest.ftl";
    public static final String JsonHelperTest_FTL = test_java_ftl + "helpers/JsonHelperTest.ftl";
    public static final String RequestModelTest_FTL = test_java_ftl + "models/RequestModelTest.ftl";
    public static final String ResponseTest_FTL = test_java_ftl + "models/ResponseTest.ftl";
    public static final String LesseeTest_FTL = test_java_ftl + "models/LesseeTest.ftl";
    public static final String RequestTest_FTL = test_java_ftl + "models/RequestTest.ftl";
    public static final String BaseTest_FTL = test_java_ftl + "BaseTest.ftl";
    public static final String CreateAllTest_FTL = test_java_ftl + "CreateAllTest.ftl";
    public static final String UserMapperTest_FTL = test_java_ftl + "mappers/UserMapperTest.ftl";
    public static final String BaseControllerTest_FTL = test_java_ftl + "controllers/BaseControllerTest.ftl";
    public static final String CommonControllerTest_FTL = test_java_ftl + "controllers/CommonControllerTest.ftl";
    public static final String UserControllerTest_FTL = test_java_ftl + "controllers/UserControllerTest.ftl";
    public static final String LesseeControllerTest_FTL = test_java_ftl + "controllers/LesseeControllerTest.ftl";


    public static final String info = "info";
    //不含po后缀的部分 ，例：UserPO中的User部分，由配置文件 tableEntity配置产生
    public static final String gen = "gen";
    public static final String rdb = "rdb";
    public static final String cache = "cache";
    //    public static final String comparative = "comparative";
    public static final String WhereRelate = "WhereRelate";
    public static final String order = "order";

    public static final String entityName = "entityName";
    public static final String packageStr = "packageStr";
    public static final String importList = "importList";
    public static final String className = "className";
    public static final String classRemark = "classRemark";
    //    public static final String methodStr = "methodStr";
    public static final String allAnnotationPO = "allAnnotationPO";
    public static final String AAnnotationMap = "AAnnotationMap";
    public static final String objectPropertyJavaTypeMap = "objectPropertyJavaTypeMap";
    public static final String propertyRemarkMap = "propertyRemarkMap";

    public static final String allPO = "allPO";
    public static final String allManager = "allManager";
    public static final String allService = "allService";
    public static final String allController = "allController";
    public static final String javaCollection = "javaCollection";
}
