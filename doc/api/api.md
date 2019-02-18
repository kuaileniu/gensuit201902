# 关系数据库部分
## 说明

注解写在数据库表结构的注释中

前缀为[![，后缀为 ]!]，当同一位置出现多个注解时，注解与注解之间直接罗列，之间无空隙，无分号，无逗号。

定义： [![注解名称(json数组)]!]，内容说明通过json数组实现。当无内容时格式为[![注解名称()]!]。

数据库英文名称： 采用小写下划线串名设计。例 ,表名:t_user,字段名 user_name;表名前缀t_

主键:每张表有一个主键,并且主键名称为id;

关联表表名定义： 用户角色管理，用户在前角色在后，t_user_role

## Hidden

例：[![Hidden()]!]

名称：隐藏

作用：保密，不给前端展示

使用范围：字段

内容：无

## Pwd

例：[![Pwd()]!]

名称：密码

作用：入库前，需对用户的这个数据进行加密

使用范围：字段

内容：无


## CurrentDateTime

例：[![CurrentDateTime()]!]

名称：当前日期时间

作用：设置此字段值为系统的当前日期时间

使用范围：字段

内容：无

## CurrentDate

例：[![CurrentDate()]!]

名称：当前日期

作用：设置此字段值为系统的当前日期

使用范围：字段

内容：无

## CurrentTime

例：[![CurrentTime()]!]

名称：当前时间

作用：设置此字段值为系统的当前时间

使用范围：字段

内容：无

## DefaultVal

例：[![DefaultVal([{"success":"status"}])]!]

名称：默认值

作用：当没有赋值时，系统给与默认值

使用范围：字段

内容：{值:字段}，例中将status字段的值设置为success

## DefaultEqual

例：[![DefaultEqual([{"code":"id"}])]!]

名称：默认等于

作用：当没有赋值时，系统给与默认值，并且默认值等于指定的字段的值

使用范围：字段，只在同一个表中。

内容：{target:source}  target为目标字段，source为源字段，将源字段赋值给目标字段，例中将id的值赋值给code
注意事项：target字段和source字段，数据类型需相同，例:同是 varchar。

## Rong

例：[![Rong([{"same":"t_user.name=t_login_log.user_name","key":"t_user.id=t_login_log.user_id"}])]!]

名称：冗余

作用：字段间冗余的关联关系

使用范围：字段(源表中）

内容：same为冗余字段,表.字段；key为关联字段，表.字段；json数组方式表示

## AOrg
例：[![AOrg()]!]

名称：单位

作用：此表存储单位（组织机构、部门）等信息

使用范围：表,一个系统中最多一张表可使用。

内容：无

## ARole

例：[![ARole()]!]

名称：角色

作用：此表存储角色信息

使用范围：表,一个系统中最多一张表可使用。

内容：无

## APermission

例：[![APermission()]!]

名称：权限（菜单、虚拟菜单、链接也是权限)。虚拟菜单包含前后端分离的架构时的前端菜单。链接为 RequestMapping。

作用：此表存储权限（菜单、虚拟菜单）等信息,不需要权限控制的controller方法无需标此注解

使用范围：表,一个系统中最多一张表可使用。

内容：无

## AUser
例：[![AUser()]!]

名称：用户

作用：此表存储用户信息

使用范围：表,一个系统中最多一张表可使用。

内容：无

## ADict
例：[![ADict()]!]

名称：字典

作用：此表存储字典信息

使用范围：表,一个系统中最多一张表可使用。

内容：无

## ADictModule
例：[![ADictModule()]!]

名称：字典模块

作用：此表存储字典模块信息

使用范围：表,一个系统中最多一张表可使用。

内容：无

## IndexMessage

## ALessee
例：[![ALessee()]!]

名称：租户

作用：此表存储租户信息

使用范围：表,一个系统中最多一张表可使用。

内容：无

## LesseeId

例：[![LesseeId()]!]

名称：租户ID

作用：自动给当前字段赋值租户id

使用范围：字段。

## UserId

例：[![UserId()]!]

名称：当前用户ID

作用：自动给当前字段赋值当前用户的id

使用范围：字段。

## DictModuleCode

例：[![DictModuleCode([{"t_dict.dict_module_code":"area_code"}])]!]

名称：字典模块编号

作用：此字典模块编号对应的字典表中相应的值（字典的值与应用此注解的表的字段的值相同),主要在转化成VO时使用

使用范围：字段。

内容：json数组格式，[{"字典表名.字典模块字段名":"字段模块值"}]

## SystemCode

例：[![SystemCode()]!]

名称：系统编码

作用：当前字段赋值系统编码(系统编码从前端设置进去--存在隐患)

使用范围：字段。每张表只能使用一次。


## IndexMessage

例：[![IndexMessage([{"t_user.index_union_login_name":"登录名重复"}])]!]

名称：索引消息。

作用：当违法索引规则时，发给前端的提示信息。

使用范围：表

内容：json数组格式，[{"表名.索引名":"消息文本"}]

## DataIs

例：[![DataIs([{"t_user.img_id":"t_z_file.id"}])]!]

名称：数据是。

作用：类似外键。

使用范围：表

内容：json数组格式，[{"表名.字段名":"指向的表名.字段名"}]

# Java代码部分

## 说明
Controller 层补充信息，例，补充用户当前的租户，部门等信息到查询条件中。
个性化的东西做到具体项目中（不要做在genserver.jar中)，例如，登录，添加同租户的xx信息等。

## 注解
- @APermission  在Controller方法上配合@RequestMapping及其子注解使用

## 添加虚拟菜单

在项目中添加类，在类加载时add进 ViewPermission的静态变量viewPermissions中。
参考 GenViewPermission，注意有@Component。
``` java
   @Component
   public class GenViewPermission {
      static {
        ViewPermission.viewPermissions.add(new Permission().setCode("").setLink("").setText("").setDescr(""));
      }
   }
```

## 缓存

使用kryo序列化与反序列化，存储到redis中

@Cacheable(value = "session#30#30", key = "#sessionId", unless = "#result == null")

value值 session#30#30，//以#号分割，每个#号后面都需要有整型数字；第一个是失效时间(单位是秒),小于0时为永久不过期,等于0时采用系统默认最大存活时间;第二个是重新计时多长时间失效(取出后重新计时),若为0，不重新计时;

## Http接口

### Http接口说明

访问路径{域名}/{端口}/{api}/{实体名称}/{相对路径}

注意：访问路径全部小写。例：http://127.0.0.1/api/user/counts

提交数据以Content-Type为 application/json格式放到 HttpBody 当中。例：[{"proto":"1","code":"u-c","relates":[{"prop":"id","whereRelate":"In","vals":["a","b"]}]}]。token数据放到HttpHead中，token=abc123

如图

 ![](https://github.com/kuaileniu/files/blob/master/web/gensuite-http-request-header.png?raw=true)

![](https://github.com/kuaileniu/files/blob/master/web/gensuite-http-request-body-array.png?raw=true)

HttpGet方式的参数可以在相对路径内，其他方式的参数在HttpBody中。

### 暴露接口设置

在类加载时add进 MapperInclude的静态Set变量include中。参考MapperIncludeXXXX，注意有@Component。
```java
@Component
public class MapperIncludeXXXX {
    static {
       MapperInclude.include.add("/api/order/getbyid/{id}");
    }
}
```

A001MappedFilter.class中当filterLog=true（application.yml可配置）时，输出Controller默认注册的所有RequestMappingInfo映射，
应用项目（非gensuite）启动时控制台  System.out.println("MapperInclude.include.add(\"" + path + "\");"); 所有映射，选择要留下的映射，将其copy到项目中的类MapperIncludeXXXX 的static方法中

### 整理系统权限接口

HttpMethod： POST

相对路径： api/common/collectauthority

参数：无

### 获取验证码图片接口

HttpMethod： GET

相对路径： api/common/verifycode

参数：无

### login-(@AUser对应的controller接口)（已经废除）

HttpMethod： POST

说明：登录

相对路径：login

请求数据：{"proto":"1","code":"u-c","relates":[{"prop":"id","whereRelate":"In","vals":["a","b"]}]}

### count-(controller接口)

HttpMethod： POST

说明：自定义条件，查询xx总数

相对路径：count

请求数据：{"proto":"1","code":"u-c","relates":[{"prop":"id","whereRelate":"In","vals":["a","b"]}]}


# 获取图片等文件接口(无权限要求)
## 获取图片等文件接口(无权限要求)说明

通过HttpGet方式，用Nginx代理FastDFS获取
### 样例
http://{文件域名}/{端口}/{文件相对路径}.{文件后缀}?{给用户显示的文件名}

## 具体项目中的controller（非gen下的controller) 
Controller、Service、Manager文件前缀Alone
url路径映射api后加alone
例
@Controller
@RequestMapping("api/alone/customer")
public class AloneCustomerController {
}


# H5代码部分

# Android代码部分

# IOS代码部分