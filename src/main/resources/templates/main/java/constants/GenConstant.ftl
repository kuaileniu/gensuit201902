package ${gen.constantsPackage?replace("/",".")};

public class GenConstant {

    public static final String utf8 = "UTF-8";

    //web token
    public static final String zToken = "ztoken";

    //http header Content-Type
    public static final String contentType = "Content-Type";

    //http header Content-Type 值为 formdata
    public static final String formDataHeader = "multipart/form-data";

    //http header Content-Type 值为 x-www-form-urlencoded
    public static final String wwwFormUrlencodedHeader = "application/x-www-form-urlencoded";
    public static final String xmlApplicationHeader = "application/xml";
    public static final String xmlTextHeader = "text/xml";
    public static final String textPlainHeader = "text/plain";
    public static final String textHtmlHeader = "text/html";

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
    public static final String point = ".";

    //逗号
    public static final String comma = ",";

    // 所有的id
    public static final String allId="allids";

    //分布式session
    public static final String dsession = "dsession";

    //系统编码key值
    public static final String sysCode = "syscode";

    //验证码
    public static final String verifyCode = "verifyCode";

    //发送验证码cache的前缀
    public static final String verifyCodeMsg = "sendmsg";
    //用户名
//    public static final String userName = "userName";

    //密码
//    public static final String password = "password";

    //数据默认组大查询条数
    public static final int defaultMaxResults = 2000;

    //session有效时间
    public static final int sessionSecond = 30 * 60;

    //未登录
    public static final int noLogin = 401;

    //数据重复
    public static final String repeat = "数据重复";
}