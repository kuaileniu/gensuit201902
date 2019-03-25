package cn.zhsit.orm;

import cn.zhsit.configs.Gen;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.enums.FileType;
import cn.zhsit.models.*;
import cn.zhsit.models.dbinfo.Table;
import cn.zhsit.orm.handler.*;
import cn.zhsit.orm.helpers.*;
import cn.zhsit.rdb.DBCollection;
import cn.zhsit.utils.ZFileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Component
public class JavaManager implements ApplicationContextAware {
    private Logger log = LoggerFactory.getLogger(this.getClass());
    private ApplicationContext applicationContext;
    @Autowired
    ProviderHelper providerHelper;
    @Autowired
    JavaCollection javaCollection;
    @Autowired
    QueryHelper queryHelper;
    @Autowired
    RemoveHelper removeHelper;
    @Autowired
    ModifyHelper modifyHelper;
    @Autowired
    POHelper poHelper;
    @Autowired
    MapperHelper mapperHelper;
    @Autowired
    ManagerHelper managerHelper;
    @Autowired
    ServiceHelper serviceHelper;
    @Autowired
    ServiceImplHelper serviceImplHelper;
    @Autowired
    ControllerHelper controllerHelper;
    @Autowired
    ManagerImplHelper managerImplHelper;
    @Autowired
    SolidHandler solidHandler;
    @Autowired
    AnnotationHelper annotationHelper;
    @Autowired
    DBCollection dbCollection;
    @Autowired
    Gen gen;

    public void translateAnnotation() throws Exception {
        Map<String, List<POProperty>> annotationMapList = javaCollection.getAllAnnotationPO();

        annotationMapList.forEach((annotationName, pOPropertyList) -> {
            annotationHelper.translate(annotationName, pOPropertyList);
        });
    }

    /**
     * 生成SqlMapper,SqlProvider
     *
     * @throws Exception
     */
    public void createSolid() throws Exception {
        List<SolidObject> solidObjectsList = new ArrayList<>();
        if (gen.isInitProject()) {
            solidObjectsList.add(new SolidObject(GenConstants.ServerApplication, GenConstants.ServerApplication_FTL, gen.getServerApplicationPackage(), FileType.MavenMainJava));
        } else {
            solidObjectsList.add(new SolidObject(GenConstants.GenApplication, GenConstants.GenApplication_FTL, gen.getBasePackage(), FileType.MavenMainJava));
        }
        solidObjectsList.add(new SolidObject(GenConstants.SqlMapper, GenConstants.SqlMapper_FTL, gen.getMapperPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.SqlProvider, GenConstants.SQL_PROVIDER_FTL, gen.getProviderPackage(), FileType.MavenMainJava));

//        solidObjectsList.add(new SolidObject(GenConstants.JdbcMapper, GenConstants.JdbcMapper_FTL, gen.getMapperPackage(), FileType.MavenMainJava));

        solidObjectsList.add(new SolidObject(GenConstants.annotation_primary_column, GenConstants.PRIMARY_COLUMN_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_foreign_column, GenConstants.FOREIGN_COLUMN_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_ALogin, GenConstants.ALOGIN_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_authority, GenConstants.AUTHORITY_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_AMenu, GenConstants.AMENU_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_show, GenConstants.SHOW_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_Mine, GenConstants.MINE_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_Hidden, GenConstants.Hidden_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_Pwd, GenConstants.Pwd_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_Rong, GenConstants.Rong_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_SameColumn, GenConstants.SameColumn_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_Download, GenConstants.Download_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_AFile, GenConstants.AFile_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_ARole, GenConstants.ARole_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_AUser, GenConstants.AUser_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_APermission, GenConstants.APermission_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_AOrg, GenConstants.AOrg_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_VirtualController, GenConstants.VirtualController_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.annotation_Interceptor, GenConstants.Interceptor_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        if (gen.isSaveQiniu()) {
            solidObjectsList.add(new SolidObject(GenConstants.annotation_Qiniu, GenConstants.Qiniu_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        }
        if (gen.isSaveFastDFS()) {
            solidObjectsList.add(new SolidObject(GenConstants.annotation_ZFastDFS, GenConstants.ZFastDFS_FTL, gen.getAnnotationPackage(), FileType.MavenMainJava));
        }
        solidObjectsList.add(new SolidObject(GenConstants.enum_order, GenConstants.ORDER_FTL, gen.getEnumPackage(), FileType.MavenMainJava));
//        solidObjectsList.add(new SolidObject(GenConstants.enum_comparative, GenConstants.COMPARATIVE_FTL, gen.getEnumPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.enum_WhereRelate, GenConstants.WhereRelate_FTL, gen.getEnumPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.enum_Province, GenConstants.Province_FTL, gen.getEnumPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.enum_Op, GenConstants.Op_FTL, gen.getEnumPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.enum_SrcType, GenConstants.SrcType_FTL, gen.getEnumPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.enum_UserType, GenConstants.UserType_FTL, gen.getEnumPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.enum_DFSGroupEnum, GenConstants.DFSGroupEnum_FTL, gen.getEnumPackage(), FileType.MavenMainJava));

        solidObjectsList.add(new SolidObject(GenConstants.base_manager, GenConstants.BASE_MANAGER_FTL, gen.getManagerImplPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.base_service, GenConstants.BASE_SERVICE_FTL, gen.getServiceImplPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.base_controller, GenConstants.BASE_CONTROLLER_FTL, gen.getControllerPackage(), FileType.MavenMainJava));
//        solidObjectsList.add(new SolidObject(GenConstants.common_controller, GenConstants.COMMON_CONTROLLER_FTL, gen.getControllerPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ViewPermission, GenConstants.ViewPermission_FTL, gen.getControllerPackage(), FileType.MavenMainJava));


        solidObjectsList.add(new SolidObject(GenConstants.data_page, GenConstants.DATA_PAGE_FTL, gen.getModelPackage(), FileType.MavenMainJava));
//        solidObjectsList.add(new SolidObject(GenConstants.response_bo, GenConstants.RESPONSE_BO_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.Response, GenConstants.Response_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.Session, GenConstants.SESSION_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.JwtToken, GenConstants.JwtToken_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ClientBrowser, GenConstants.ClientBrowser_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.RequestModel, GenConstants.RequestModel_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.JwtAccount, GenConstants.JwtAccount_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.Request, GenConstants.Request_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ResponseModel, GenConstants.ResponseModel_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ControllerClassContext, GenConstants.ControllerClassContext_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.AuthorityModel, GenConstants.AuthorityModel_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.MenuModel, GenConstants.MenuModel_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        if (gen.isUseLayui()) {
            solidObjectsList.add(new SolidObject(GenConstants.LayMenu, GenConstants.LayMenu_FTL, gen.getModelLayuiPackage(), FileType.MavenMainJava));
            solidObjectsList.add(new SolidObject(GenConstants.LayRequestModel, GenConstants.LayRequestModel_FTL, gen.getModelLayuiPackage(), FileType.MavenMainJava));
            solidObjectsList.add(new SolidObject(GenConstants.LayResponseModel, GenConstants.LayResponseModel_FTL, gen.getModelLayuiPackage(), FileType.MavenMainJava));
        }
        if (gen.isUseAlain()) {
            solidObjectsList.add(new SolidObject(GenConstants.AlainRequestModel, GenConstants.AlainRequestModel_FTL, gen.getModelAlainPackage(), FileType.MavenMainJava));
        }
        solidObjectsList.add(new SolidObject(GenConstants.ClassWrapper, GenConstants.ClassWrapper_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.MethodWrapper, GenConstants.MethodWrapper_FTL, gen.getModelPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.FieldWrapper, GenConstants.FieldWrapper_FTL, gen.getModelPackage(), FileType.MavenMainJava));


        solidObjectsList.add(new SolidObject(GenConstants.Captcha, GenConstants.vcode_Captcha_FTL, gen.getVcodePackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.Encoder, GenConstants.vcode_Encoder_FTL, gen.getVcodePackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.GifCaptcha, GenConstants.vcode_GifCaptcha_FTL, gen.getVcodePackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.GifEncoder, GenConstants.vcode_GifEncoder_FTL, gen.getVcodePackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.Quant, GenConstants.vcode_Quant_FTL, gen.getVcodePackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.Randoms, GenConstants.vcode_Randoms_FTL, gen.getVcodePackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.SpecCaptcha, GenConstants.vcode_SpecCaptcha_FTL, gen.getVcodePackage(), FileType.MavenMainJava));

        solidObjectsList.add(new SolidObject(GenConstants.Unique, GenConstants.Unique_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ValidateUtils, GenConstants.ValidateUtils_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.Encrypt, GenConstants.Encrypt_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ConvertUtil, GenConstants.ConvertUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.WebUtil, GenConstants.WebUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.StringUtil, GenConstants.StringUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        if (gen.isUseRedis()) {
            solidObjectsList.add(new SolidObject(GenConstants.RedisUtil, GenConstants.RedisUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        }
        solidObjectsList.add(new SolidObject(GenConstants.Zset, GenConstants.Zset_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ExpireMap, GenConstants.ExpireMap_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.TimeUtilZhs, GenConstants.TimeUtilZhs_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.JdbcUtil, GenConstants.JdbcUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ClazzUtil, GenConstants.ClazzUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.RandomUtil, GenConstants.RandomUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
//        solidObjectsList.add(new SolidObject(GenConstants.JWTUtil, GenConstants.JWTUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.AESUtil, GenConstants.AESUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ByteUtil, GenConstants.ByteUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.XssUtil, GenConstants.XssUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));

//        solidObjectsList.add(new SolidObject(GenConstants.SqlMapperUtil, GenConstants.SqlMapperUtil_FTL, gen.getUtilPackage(), FileType.MavenMainJava));

        if (gen.isUseRedis()) {
            solidObjectsList.add(new SolidObject(GenConstants.JDKSerializer, GenConstants.JDKSerializer_FTL, gen.getIoPackage(), FileType.MavenMainJava));
//            solidObjectsList.add(new SolidObject(GenConstants.KryoSerializer, GenConstants.KryoSerializer_FTL, gen.getIoPackage(), FileType.MavenMainJava));
        }
        solidObjectsList.add(new SolidObject(GenConstants.ProtoBufSerializer, GenConstants.ProtoBufSerializer_FTL, gen.getIoPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.Serializer, GenConstants.Serializer_FTL, gen.getIoPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.MultiDateDeserializer, GenConstants.MultiDateDeserializer_FTL, gen.getIoPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.DateJsonSerializer, GenConstants.DateJsonSerializer_FTL, gen.getIoPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.DateHanZiJsonSerializer, GenConstants.DateHanZiJsonSerializer_FTL, gen.getIoPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.DateTimeJsonSerializer, GenConstants.DateTimeJsonSerializer_FTL, gen.getIoPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ContextHandler, GenConstants.ContextHandler_FTL, gen.getHandlerPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.MybatisJsonTypeHandler, GenConstants.MybatisJsonTypeHandler_FTL, gen.getHandlerPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ContextFilter, GenConstants.ContextFilter_FTL, gen.getFilterPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.BodyReaderHttpServletRequestWrapper, GenConstants.BodyReaderHttpServletRequestWrapper_FTL, gen.getFilterPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ResponseWrapper, GenConstants.ResponseWrapper_FTL, gen.getFilterPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.A001MappedFilter, GenConstants.A001MappedFilter_FTL, gen.getFilterPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.MapperInclude, GenConstants.MapperInclude_FTL, gen.getFilterPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.A005XssFilter, GenConstants.A005XssFilter_FTL, gen.getFilterPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.XssHttpServletRequestWrapper, GenConstants.XssHttpServletRequestWrapper_FTL, gen.getFilterPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.GenMapperInclude, GenConstants.GenMapperInclude_FTL, gen.getFilterPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.JavaClass2ProtoBuf, GenConstants.JavaClass2ProtoBuf_FTL, gen.getIoPackage(), FileType.MavenMainJava));

        solidObjectsList.add(new SolidObject(GenConstants.SystemUtil, GenConstants.SystemUtil_FTL, gen.getSystemPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.OS, GenConstants.OS_FTL, gen.getSystemPackage(), FileType.MavenMainJava));
        if (gen.isUseRedis()) {
            solidObjectsList.add(new SolidObject(GenConstants.RedisConfig, GenConstants.RedisConfig_FTL, gen.getConfigPackage(), FileType.MavenMainJava));
        }
        solidObjectsList.add(new SolidObject(GenConstants.WebConfig, GenConstants.WebConfig_FTL, gen.getConfigPackage(), FileType.MavenMainJava));
        if (gen.isWorkflow()) {
            solidObjectsList.add(new SolidObject(GenConstants.ActivitiConfig, GenConstants.ActivitiConfig_FTL, gen.getConfigPackage(), FileType.MavenMainJava));
        }
        solidObjectsList.add(new SolidObject(GenConstants.InterceptorConfig, GenConstants.InterceptorConfig_FTL, gen.getConfigPackage(), FileType.MavenMainJava));


        solidObjectsList.add(new SolidObject(GenConstants.ALoginInterceptor, GenConstants.ALoginInterceptor_FTL, gen.getInterceptorPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.PermissionHandler, GenConstants.PermissionHandler_FTL, gen.getInterceptorPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.CacheHandler, GenConstants.CacheHandler_FTL, gen.getInterceptorPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.APermissionInterceptor, GenConstants.APermissionInterceptor_FTL, gen.getInterceptorPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.TokenInterceptor, GenConstants.TokenInterceptor_FTL, gen.getInterceptorPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.RequestParamInterceptor, GenConstants.RequestParamInterceptor_FTL, gen.getInterceptorPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ResponseParamInterceptor, GenConstants.ResponseParamInterceptor_FTL, gen.getInterceptorPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ErrorInterceptor, GenConstants.ErrorInterceptor_FTL, gen.getInterceptorPackage(), FileType.MavenMainJava));

        if (gen.isUseRedis()) {
            solidObjectsList.add(new SolidObject(GenConstants.CacheHelper, GenConstants.CacheHelper_FTL, gen.getHelperPackage(), FileType.MavenMainJava));
        }
        solidObjectsList.add(new SolidObject(GenConstants.JsonHelper, GenConstants.JsonHelper_FTL, gen.getHelperPackage(), FileType.MavenMainJava));
        solidObjectsList.add(new SolidObject(GenConstants.ContextException, GenConstants.ContextException_FTL, gen.getExceptionPackage(), FileType.MavenMainJava));
        if (gen.isSaveFastDFS()) {
            solidObjectsList.add(new SolidObject(GenConstants.FastDFSComponent, GenConstants.FastDFSComponent_FTL, gen.getDfsPackage(), FileType.MavenMainJava));
        }

        if (gen.isUsePOI()) {
//            solidObjectsList.add(new SolidObject(GenConstants.ZWordUtil, GenConstants.ZWordUtil_FTL, gen.getOfficePackage() , FileType.MavenMainJava));
            solidObjectsList.add(new SolidObject(GenConstants.ZOfficeUtil, GenConstants.ZOfficeUtil_FTL, gen.getOfficePackage(), FileType.MavenMainJava));
        }
        //常量
        solidObjectsList.add(new SolidObject(GenConstants.GenConstant, GenConstants.GenConstant_FTL, gen.getConstantsPackage(), FileType.MavenMainJava));

        if (gen.isCreateTest()) { //测试类

            if (gen.isSaveFastDFS()) {
                solidObjectsList.add(new SolidObject(GenConstants.FastDFSTest, GenConstants.FastDFSTest_FTL, gen.getDfsPackage(), FileType.MavenTestJava));
                solidObjectsList.add(new SolidObject(GenConstants.FastDFSComponentTest, GenConstants.FastDFSComponentTest_FTL, gen.getDfsPackage(), FileType.MavenTestJava));

            }
            solidObjectsList.add(new SolidObject(GenConstants.SqlMapperTest, GenConstants.SqlMapperTest_FTL, gen.getMapperPackage(), FileType.MavenTestJava));
            solidObjectsList.add(new SolidObject(GenConstants.DataSourceTest, GenConstants.DataSourceTest_FTL, gen.getMapperPackage(), FileType.MavenTestJava));
            solidObjectsList.add(new SolidObject(GenConstants.JsonHelperTest, GenConstants.JsonHelperTest_FTL, gen.getHelperPackage(), FileType.MavenTestJava));
            solidObjectsList.add(new SolidObject(GenConstants.RequestModelTest, GenConstants.RequestModelTest_FTL, gen.getModelPackage(), FileType.MavenTestJava));
            solidObjectsList.add(new SolidObject(GenConstants.ResponseTest, GenConstants.ResponseTest_FTL, gen.getModelPackage(), FileType.MavenTestJava));
//            solidObjectsList.add(new SolidObject(GenConstants.LesseeTest, GenConstants.LesseeTest_FTL, gen.getModelPackage(), FileType.MavenTestJava));
            solidObjectsList.add(new SolidObject(GenConstants.RequestTest, GenConstants.RequestTest_FTL, gen.getModelPackage(), FileType.MavenTestJava));

            solidObjectsList.add(new SolidObject(GenConstants.BaseTest, GenConstants.BaseTest_FTL, gen.getBasePackage(), FileType.MavenTestJava));
            solidObjectsList.add(new SolidObject(GenConstants.CreateAllTest, GenConstants.CreateAllTest_FTL, gen.getBasePackage(), FileType.MavenTestJava));
            solidObjectsList.add(new SolidObject(GenConstants.UserMapperTest, GenConstants.UserMapperTest_FTL, gen.getMapperPackage(), FileType.MavenTestJava));
//            solidObjectsList.add(new SolidObject(GenConstants.BaseControllerTest, GenConstants.BaseControllerTest_FTL, gen.getControllerPackage(), FileType.MavenTestJava));
//            solidObjectsList.add(new SolidObject(GenConstants.UserControllerTest, GenConstants.UserControllerTest_FTL, gen.getControllerPackage(), FileType.MavenTestJava));
//            solidObjectsList.add(new SolidObject(GenConstants.LesseeControllerTest, GenConstants.LesseeControllerTest_FTL, gen.getControllerPackage(), FileType.MavenTestJava));
//            solidObjectsList.add(new SolidObject(GenConstants.CommonControllerTest, GenConstants.CommonControllerTest_FTL, gen.getControllerPackage(), FileType.MavenTestJava));


        }

        for (SolidObject solidObject : solidObjectsList) {
            SolidHandler handler = applicationContext.getBean(SolidHandler.class).setInfo(solidObject);
            handler.execute();
        }

    }

    public void createConfig() throws Exception {
        List<ConfigObject> configObjects = new ArrayList<>();
//        ConfigObject[] configObjects = new ConfigObject[]{
        configObjects.add(new ConfigObject("pom.xml", "pom.ftl", ""));
        configObjects.add(new ConfigObject("package.cmd", "package.cmd.ftl", ""));
        configObjects.add(new ConfigObject("assembly.xml", "deploy/assembly.ftl", "deploy"));
        configObjects.add(new ConfigObject("README.md", "doc/README.ftl", "doc"));
        configObjects.add(new ConfigObject("README.md", "lib/README.ftl", "lib"));
        configObjects.add(new ConfigObject("genserver.jar", "lib/README.ftl", "lib"));

        configObjects.add(new ConfigObject("application.yml", "deploy/dev/resources/application.ftl", "deploy/dev/resources"));
        configObjects.add(new ConfigObject("zhsit.cn.txt", "deploy/dev/resources/banner.ftl", "deploy/dev/resources"));
        if (gen.isSaveFastDFS()) {
            configObjects.add(new ConfigObject("fastdfs-client.properties", "deploy/dev/resources/fastdfs-client.properties", "deploy/dev/resources"));
        }
        configObjects.add(new ConfigObject("README.md", "deploy/dev/script/README.ftl", "deploy/dev/script"));
        if (gen.isWorkflow()) {
            configObjects.add(new ConfigObject("demo.bpmn", "deploy/dev/resources/processes/demo.bpmn", "deploy/dev/resources/processes"));
        }
        configObjects.add(new ConfigObject("application.yml", "deploy/local/resources/application.ftl", "deploy/local/resources"));
        configObjects.add(new ConfigObject("zhsit.cn.txt", "deploy/local/resources/banner.ftl", "deploy/local/resources"));
        if (gen.isSaveFastDFS()) {
            configObjects.add(new ConfigObject("fastdfs-client.properties", "deploy/local/resources/fastdfs-client.properties", "deploy/local/resources"));
        }
        configObjects.add(new ConfigObject("README.md", "deploy/local/script/README.ftl", "deploy/local/script"));
        if (gen.isWorkflow()) {
            configObjects.add(new ConfigObject("demo.bpmn", "deploy/local/resources/processes/demo.bpmn", "deploy/local/resources/processes"));
        }
        configObjects.add(new ConfigObject("application.yml", "deploy/prod/resources/application.ftl", "deploy/prod/resources"));
        configObjects.add(new ConfigObject("zhsit.cn.txt", "deploy/prod/resources/banner.ftl", "deploy/prod/resources"));
        if (gen.isSaveFastDFS()) {
            configObjects.add(new ConfigObject("fastdfs-client.properties", "deploy/prod/resources/fastdfs-client.properties", "deploy/prod/resources"));
        }
        configObjects.add(new ConfigObject("README.md", "deploy/prod/script/README.ftl", "deploy/prod/script"));
        if (gen.isWorkflow()) {
            configObjects.add(new ConfigObject("demo.bpmn", "deploy/prod/resources/processes/demo.bpmn", "deploy/prod/resources/processes"));
        }
        configObjects.add(new ConfigObject("startup.sh", "deploy/prod/script/startup.ftl", "deploy/prod/script"));
        configObjects.add(new ConfigObject("shutdown.sh", "deploy/prod/script/shutdown.ftl", "deploy/prod/script"));
        configObjects.add(new ConfigObject("lookpid.sh", "deploy/prod/script/lookpid.ftl", "deploy/prod/script"));
        configObjects.add(new ConfigObject("application.yml", "deploy/test/resources/application.ftl", "deploy/test/resources"));
        configObjects.add(new ConfigObject("zhsit.cn.txt", "deploy/test/resources/banner.ftl", "deploy/test/resources"));
        if (gen.isSaveFastDFS()) {
            configObjects.add(new ConfigObject("fastdfs-client.properties", "deploy/test/resources/fastdfs-client.properties", "deploy/test/resources"));
        }
        configObjects.add(new ConfigObject("README.md", "deploy/test/script/README.ftl", "deploy/test/script"));
        if (gen.isWorkflow()) {
            configObjects.add(new ConfigObject("demo.bpmn", "deploy/test/resources/processes/demo.bpmn", "deploy/test/resources/processes"));
        }
        for (ConfigObject configObject : configObjects) {
            ConfigHandler handler = applicationContext.getBean(ConfigHandler.class).setInfo(configObject);
            handler.execute();
        }
    }

    public void copyFiles() throws Exception {
        List<FileObject> fileObjects = new ArrayList();
        if (gen.isSaveFastDFS()) {
            if (gen.isInitProject()) {
                fileObjects.add(new FileObject("src\\main\\resources\\templates\\lib", gen.getServer() + "\\lib", "fastdfs-client-java-1.27-SNAPSHOT.jar"));
            } else {
                fileObjects.add(new FileObject("src\\main\\resources\\templates\\lib", gen.getGenServer() + "\\lib", "fastdfs-client-java-1.27-SNAPSHOT.jar"));
            }
        }
//        fileObjects.add(new FileObject("src\\main\\resources\\templates\\test\\java\\controllers",gen.getGenServer()+"\\src\\test\\java\\"+gen.getControllerPackage(),"user.json"));
//        fileObjects.add(new FileObject("src\\main\\resources\\templates\\test\\java\\controllers",gen.getGenServer()+"\\src\\test\\java\\"+gen.getControllerPackage(),"lessee.json"));
        fileObjects.add(new FileObject("src\\main\\resources\\templates\\deploy\\test\\resources", gen.getGenServer() + "\\deploy\\test\\resources", "webserver.keystore"));

        for (FileObject fileObject : fileObjects) {
            ZFileUtil.copyFile(fileObject.getSourcePath(), fileObject.getTargetPath(), fileObject.getFileName());
        }
    }

    public void createAllPO() throws Exception {
        List<Table> tableList = dbCollection.findAllTables();
        for (Table table : tableList) {
            PO po = poHelper.createPO(table);
            javaCollection.addPO(po);
        }
        List<PO> allPO = javaCollection.findAllPO();
        for (PO po : allPO) {
            POHandler handler = applicationContext.getBean(POHandler.class).setInfo(po);
            handler.execute();
        }
    }

    public void createAllQuery() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO po : allPO) {
            Query query = queryHelper.createQuery(po);
            javaCollection.addQuery(query);
        }
        List<Query> allQuery = javaCollection.findAllQuery();
        for (Query query : allQuery) {
            QueryHandler handler = applicationContext.getBean(QueryHandler.class).setInfo(query);
            handler.execute();
        }
    }

    public void createAllRemove() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO po : allPO) {
            Remove remove = removeHelper.createRemove(po);
            javaCollection.addRemove(remove);
        }
        List<Remove> allRemove = javaCollection.findAllRemove();
        for (Remove remove : allRemove) {
            RemoveHandler handler = applicationContext.getBean(RemoveHandler.class).setInfo(remove);
            handler.execute();
        }
    }

    public void createAllModify() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO po : allPO) {
            Modify modify = modifyHelper.createModify(po);
            javaCollection.addModify(modify);
        }
        List<Modify> allUpdate = javaCollection.findAllModify();
        for (Modify modify : allUpdate) {
            ModifyHandler handler = applicationContext.getBean(ModifyHandler.class).setInfo(modify);
            handler.execute();
        }
    }

    public void createProvider() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO po : allPO) {
            Provider provider = providerHelper.createProvider(po);
            javaCollection.addProvider(provider);
        }
        List<Provider> allProvider = javaCollection.findAllProvider();
        for (Provider provider : allProvider) {
            ProviderHandler handler = applicationContext.getBean(ProviderHandler.class).setInfo(provider);
            handler.execute();
        }
    }

    public void createMapper() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO po : allPO) {
            Mapper mapper = mapperHelper.createMapper(po);
            javaCollection.addMapper(mapper);
        }
        List<Mapper> allMapper = javaCollection.findAllMapper();
        for (Mapper mapper : allMapper) {
            MapperHandler handler = applicationContext.getBean(MapperHandler.class).setInfo(mapper);
            handler.execute();
        }
    }

    public void createManager() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO entity : allPO) {
            Manager o = managerHelper.create(entity);
            javaCollection.addManager(o);
        }
        List<Manager> allEntity = javaCollection.findAllManager();
        for (Manager entity : allEntity) {
            ManagerHandler handler = applicationContext.getBean(ManagerHandler.class).setInfo(entity);
            handler.execute();
        }
    }

    public void createService() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO entity : allPO) {
            Service o = serviceHelper.create(entity);
            javaCollection.addService(o);
        }
        List<Service> allEntity = javaCollection.findAllService();
        for (Service entity : allEntity) {
            ServiceHandler handler = applicationContext.getBean(ServiceHandler.class).setInfo(entity);
            handler.execute();
        }
    }

    public void createServiceImpl() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO entity : allPO) {
            ServiceImpl o = serviceImplHelper.create(entity);
            javaCollection.addServiceImpl(o);
        }
        List<ServiceImpl> allEntity = javaCollection.findAllServiceImpl();
        for (ServiceImpl entity : allEntity) {
            ServiceImplHandler handler = applicationContext.getBean(ServiceImplHandler.class).setInfo(entity);
            handler.execute();
        }
    }

    public void createController() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO entity : allPO) {
            Controller o = controllerHelper.create(entity);
            javaCollection.addController(o);
        }
        List<Controller> allEntity = javaCollection.findAllController();
        for (Controller entity : allEntity) {
            ControllerHandler handler = applicationContext.getBean(ControllerHandler.class).setInfo(entity);
            handler.execute();
        }
    }

    public void createManagerImpl() throws Exception {
        List<PO> allPO = javaCollection.findAllPO();
        for (PO entity : allPO) {
            ManagerImpl o = managerImplHelper.create(entity);
            javaCollection.addManagerImpl(o);
        }
        List<ManagerImpl> allEntity = javaCollection.findAllManagerImpl();
        for (ManagerImpl entity : allEntity) {
            ManagerImplHandler handler = applicationContext.getBean(ManagerImplHandler.class).setInfo(entity);
            handler.execute();
        }
    }


    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        if (applicationContext == null) {
            applicationContext = context;
        }
    }
}
