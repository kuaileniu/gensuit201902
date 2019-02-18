210.12.230.128 北京市北京市 联通

query.and()未完成
分页
In
HAVING

后续功能
       通过界面设计配置文件（分环境dev，test，prod）默认生成java语言，可以选择生成groovy，scala，go，C#等
       通过Html界面设计枚举类，
       通过Html界面设置数据库类型mysql,mysql5.6,myqql5.7,oracle10g,oracle12c等，
       选择生成mybaits，Jfinal 的dao
       选择Html部分使用什么模版，freemark，velocity，thymeleaf，
       选择是否使用报表，选择报表产品

       勾选生成的Html中包含哪些功能，table、tab、
       通过Html界面设计表，表名，表注释，字段名，字段注释，字段类型（下拉）根据数据库类型过滤，字段的长度等,数据类型范围为RDB数据类型+powerdesinger中的物理模型数据类型
       通过Html界面设计普通的java文件（非完全根据表等生成的），常量类，注解，拦截器，枚举类等等
       通过Html界面设置选择生成单个java文件、单条线的java代码，全部线的代码，每条线的代码包含dao，service，controller,H5界面、
       根据json生成js对象代码，js代码，接口文档，test代码，初始化数据代码
       Mapper文件，service文件等可以自定义文件名称，可以统一加前缀
       冗余字段（数据库冗余字段需要有标记，生成代码时对此标记进行过滤加工），生成对应的冗余处理代码，
       总表界面，展示所有的表和枚举类Item，按小块展示，点击小块上的详细，进入单表界面，单表界面有连接点击生成单表对应的代码（下拉生成单个java文件或单线或所有线）
       通过Html界面设置是否生成注释，是否生成接口文档，
       通过界面设置是否生成websocket接口
       下载：可下载单个java文件、所有java文件，表sql文件
       可以在根据rdb生成的.java文件中植入现有的代码
       可以上传已有的代码，配置文件，pom.xml文件，assembly.xml文件

       生成的代码中提供上传文件接口
       可以删除上传代码、配置文件中的注释。
       可以修改上传java文件的package，
       将来要支持app代码生成
       支持setVal(null);
       支持排序 varchar  数字排序    100  98    (order by varcharNum+0)


       生成manager层，Service层，Controller层，View层。
       Controller返回给View的提示语使用Consts常量（或配置）代替
       Manager层做BaseManger，使用Factory.getBean（“beanName"）获取本层所有将被引人的Mapp等依赖，在Manager中使用时 BaseManger.UserMapper
       在设计数据库时，表注释中添加生成po的package path，例如 @packagePath(cn.zhsit.models.po)
       入库之前的数据校验 数据范围 字符串长度，数值大小等等校验

       结合ignite
       生成权限控制代码，注解，拦截器
       生成分页
       生成js代码
       生成html代码
       生成测试代码
       生成文档
       查询sql可以自定义查出字段也可以select 全部
       本query与另一query组合查询
       配置是否使用缓存
       配置是否使用工作流
       配置是否生成注释
       配置是否使用MQ
       配置是否使用Redis，EHCache等。
       配置使用何种数据库
       报表
       一键导出excel（可只导出当前页，可导出所有页），按表头导出,类似元方的一种导出
       Excel导入时，可以对应Html中的表格重新调整列对应关系，类似建筑行业的广联达的导入excel功能和数据库管理软件导入excel时的功能
       导出时可以让用户自己选择导出的Html表格的列，并能重新定义导出后Excel的表头名称

      多个系统之间通过websocket推送同步数据，定时将自己的ip和端口发送到数据库，定期从数据库查询时间段内的所有websocket伙伴的ip和端口，与伙伴机器相互关联。
      考虑 可否通过广播形式自动找群（同网段内），能否支持 云<->公司不固定IP 互联
      当需要修改自己cache数据时，给伙伴们发送通知，伙伴接到通知删除各自内的同key的cache。拦截器拦截cache变化，通知伙伴。
      积累代码库，编写代码时可选择代码库中的文件


ERP
       加入评标系统
       加入OA
       权限控制平台，单点登录，跨计算机语言
       聊天功能(跨子系统聊天),聊天界面可以只有一个标识，显示未查看消息条数。
       企业培训


使用JDBC获取各数据库的Meta信息——表以及对应的列   http://blog.csdn.net/renfufei/article/details/39316751


一个java代码生成器的简单实现 http://blog.csdn.net/qiyongkang520/article/details/50822010
对应的代码 https://github.com/zhoulychn/winit-mybatis-generator/tree/michael
D:\src\test\winit-mybatis-generator-michael

	/** 列名转换成Java属性名 */
	public static String columnToJava(String columnName) {
		return org.apache.commons.lang.WordUtils.capitalizeFully(columnName, new char[] { '_' }).replace("_", "");
	}


wapplication的run（）{}之中

当注释掉 pom.xml中的<resource> 时，test下application包却数据库配置，因为没有将application.yml文件copy到class下，
springboot找不到。

po主键用注解标志

Mybatis中注解@MapKey的使用 查询多个表的数据时使用   http://www.jb51.net/article/95688.htm
@Many
@One
@Property
@Lang
@Case
自定义 ResultHandler


        /*
         * statement="select max(empNo)+1 as myNo from emp":表示定义的子查询语句
         * before=true：表示在之前执行，booler类型的,所以为true
         * keyColumn="myNo":表示查询所返回的类名
         * resultType=int.class：表示返回值得类型
         * keyProperty="empNo" ：表示将该查询的属性设置到某个列中，此处设置到empNo中
         */
        //使用注解
        @SelectKey(statement="select max(empNo)+1 as myNo from emp" , before=true,keyColumn="myNo",resultType=int.class,keyProperty="empNo")
        //使用注解进行数据库的插入操作
        @Insert(value="insert into emp(empNo,ename,sal) values(#{empNo},#{ename},#{sal})")
        public void selectEmp1(Map map);


        https://stackoverflow.com/questions/29803628/how-to-use-foreach-statement-in-selectprovider-class-with-mybatis3


I am trying to use @SelectProvider to create dynamic SQL by including the use of the tag foreach for a IN clause. I know how to use it using the @Select annotation into my mapper.

The problem is that when I translate the SQL into the SQLProvider it seem that the use it of the tag directly is not processed for the proxy that invoke SQLProvider method to get the SQL.

Here is the code example by using the @Select:

// imports...

public interface MyMapper {
    @Select({"<script>",
        "SELECT col_1, col_2",
        "FROM table_1",
        "WHERE col_3 IN",
            "<foreach item='item' index='index' collection='items'",
                "open='(' separator=',' close=')'>",
                "#{item}",
            "</foreach>",
        "</script>"})
    HashMap<String, Object> select(@Param("items") String[] items);
}
The code above actually works, but when I try to use the @SelectProvider it doesn't works.

This is the code when I use @SelectProvider:

// imports...

public interface MyMapper {
    @SelectProvider(type = MySQLProvider.class, method = "select")
    HashMap<String, Object> select(@Param("items") String[] items);
}

public class MySQLProvider {
    public String select() {
        SQL sql = new SQL();
        sql.SELECT("col_1");
        sql.SELECT("col_2");
        sql.FROM("table_1");
        sql.WHERE("col_3 IN"
            + "<foreach item='item' index='index' collection='items'"
                + "open='(' separator=',' close=')'>"
                + "#{item}"
            + "</foreach>");
        return "<script>" + sql.toString() + "</script>";
    }
}

是不是provider 的 select() 方法内应该加 items参数？ select(@Param("items") String[] items)
provider生成的sql与 @Select的不同，缺少逗号. 可以用StringJoiner 连接成与@Select相同的
生成的sql：

<script>SELECT col_1, col_2
FROM table_1
WHERE (col_3 IN<foreach item='item' index='index' collection='items'open='(' separator=',' close=')'>#{item}</foreach>)</script>

 通过设置两个参数(需是map,map的key需是String类型)，provider可以读取出其中的参数
 - 对mapper下面加一层mapper
 public List<Order> selectOne2(@Param("o") final OrderQuery query,@Param("p")final Map<String,Object> map);


CommonMapper CommonProvider  CommonQuery  CommonRemove  CommonModify    CommonTables  后缀采用与普通表同名 Query等，在application.yml张配置的postFix
CommonMapper：
    Map params = new HashMap();
    map设置参数，例如 select sum(yun_dan) total 时，params.put("sm","sum(yun_dan) total)
    SELECT(#{sm}}
    List<Map> select(CommonQuery,param)
    long count(CommonQuery,)
    int del(CommonRemove,)
    int update(CommonModify,)


CommonQuery  CommonRemove  CommonModify 含所有表的表名的枚举,
CommonQuery: 含group by ,having
CommonTables: 所有表的枚举  可以不要

只做单主键，不做组合主键,组合主键使用组合索引解决

做一套外键等关联关系缓存，在manager中判断关联关系，动态调用（生成硬编码）相关的mapper

做oracle的映射
工具类汇集
不可被前端显示的字段；通过注解，取对象中的数据，放到HashMap中，转换工具写成Util工具类

Blog 字段处理，判断是否含byte[] 字段，若有，controller，service，调用noblog的方法，
Mapper生成时判断是否有blob字段

PO内含有哪些关键字：@Foreign  @Mine等，根据关键字生成 delMine等方法.
gen做关键字结构跟踪


服务器端校验  @Valid,根据数据库字段属性进行校验，逆向生成时生成

整合springboot + Activiti  Excel 解析，导出

service接口异常处理 返回 Response时分别做处理

getlist接口前端传送数据
zhsqtype为数据类型:where为查询条件，column为查询字段,orderby 排序字段，limit 分页
[{   "zhsqtype":"where"
	"column":"name",
	"comparative":"=",
	"val":"feng"
},{
	"zhsqtype":"where"
	"column":"id",
	"comparative":"=",
	"val":"1"
}]


操作员ID[![Mine('code')]!],一对一关系  返回： 操作员ID,一对一关系

冗余字段，全部表都更新

HttpSession对象存储到redis的Map中，通过protobuf序列化反序列化，
springboot cglib


自定义缓存失效时间 https://blog.csdn.net/huanghongfei1/article/details/61195650
  ((HttpServletResponse) response).setStatus( HttpStatus.NOT_FOUND.value());
  ((HttpServletResponse) response).setStatus(HttpServletResponse.SC_NOT_FOUND);


request.getServletContext().getContextPath():/oa
request.getServletContext().getServletContextName():application
request.getServerInfo():Undertow - 1.4.22.Final
request.getVirtualServerName():localhost
request.getProtocol():HTTP/1.1
request.getLocalName():127.0.0.1
request.getServerName():127.0.0.1
((HttpServletRequest) request).getServletPath():/api/order/getbyid/1
((HttpServletRequest) request).getContextPath():/oa
((HttpServletRequest) request).getPathInfo():null
((HttpServletRequest) request).getRequestURI():/oa/api/order/getbyid/1
((HttpServletRequest) request).getRequestURL():http://127.0.0.1:8080/oa/api/order/getbyid/1

生成的java代码到另一个工程。

FastDFS 和nginx整合 https://www.cnblogs.com/tc520/p/6822412.html

兼容自定义工作流，自定义报表