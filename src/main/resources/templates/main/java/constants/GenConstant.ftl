package ${gen.constantsPackage?replace("/",".")};

public class GenConstant {

    public static final String utf8 = "UTF-8";
<#if (gen.showComment==true)>
    //web token
</#if>
    public static final String zToken = "ztoken";

<#if (gen.showComment==true)>
    //http header Content-Type
</#if>
    public static final String contentType = "Content-Type";

<#if (gen.showComment==true)>
    //http header Content-Type 值为 formdata
</#if>
    public static final String formDataHeader = "multipart/form-data";
<#if (gen.showComment==true)>
    //http header Content-Type 值为 x-www-form-urlencoded
</#if>
    public static final String wwwFormUrlencodedHeader = "application/x-www-form-urlencoded";
    public static final String xmlApplicationHeader = "application/xml";
    public static final String jsonApplicationHeader = "application/json";
    public static final String xmlTextHeader = "text/xml";
    public static final String textPlainHeader = "text/plain";
    public static final String textHtmlHeader = "text/html";
<#if (gen.showComment==true)>
//    text/html ： HTML格式
//    text/plain ：纯文本格式
//    text/xml ： XML格式
//    image/gif ：gif图片格式
//    image/jpeg ：jpg图片格式
//    image/png：png图片格式以application开头的媒体格式类型：
//    application/xhtml+xml ：XHTML格式
//    application/xml ： XML数据格式
//    application/atom+xml ：Atom XML聚合格式
//    application/json ： JSON数据格式
//    application/pdf ：pdf格式
//    application/msword ： Word文档格式
//    application/octet-stream ： 二进制流数据（如常见的文件下载）
//    application/x-www-form-urlencoded ： 中默认的encType，form表单数据被编码为key/value格式发送到服务器（表单默认的提交数据的格式）
//
//    另外一种常见的媒体格式是上传文件之时使用的：
//
//    multipart/form-data ： 需要在表单中进行文件上传时，就需要使用该格式
    //点
</#if>
    public static final String point = ".";
<#if (gen.showComment==true)>
    //逗号
</#if>
    public static final String comma = ",";
<#if (gen.showComment==true)>
    // 所有的id
</#if>
    public static final String allId="allids";
<#if (gen.showComment==true)>
    //分布式session
</#if>
    public static final String dsession = "dsession";
<#if (gen.showComment==true)>
    //系统编码key值
</#if>
    public static final String sysCode = "syscode";
<#if (gen.showComment==true)>
    //验证码
</#if>
    public static final String verifyCode = "verifyCode";
<#if (gen.showComment==true)>
    //发送验证码cache的前缀
</#if>
    public static final String verifyCodeMsg = "sendmsg";
<#if (gen.showComment==true)>
    //用户名
</#if>
//    public static final String userName = "userName";
<#if (gen.showComment==true)>
    //密码
</#if>
//    public static final String password = "password";
<#if (gen.showComment==true)>
    //数据默认组大查询条数
</#if>
    public static final int defaultMaxResults = 2000;
<#if (gen.showComment==true)>
    //session有效时间
</#if>
    public static final int sessionSecond = 30 * 60;
<#if (gen.showComment==true)>
    //未登录
</#if>
    public static final int noLogin = 401;
<#if (gen.showComment==true)>
    //数据重复
</#if>
    public static final String repeat = "数据重复";

    //微信小程序accesstoken redis缓存key
    public static final String weChatAccessToken = "wechat_access_token";

    public static final String noneId = "_";
    public static final String blank = "";

    public static final String staffRoleMenuPermissionChange = "staffRoleMenuPermissionChange";

}