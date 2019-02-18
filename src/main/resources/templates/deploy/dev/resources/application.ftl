server:
   port: 88
   servlet:
     session:
       cookie:
         http-only: false
         
         
spring:
  cache:
    redis:
#缓存有效时间，单位毫秒，默认长久有效,8640000为24小时
      time-to-live: 8640000
  servlet:
    multipart:
      enabled: true
      max-file-size:  128MB
      max-request-size: 128MB

  redis:
# Redis数据库索引（默认为0）
    database: 0
    host: dev-application-redis
    port: 6379
    password:
# 连接超时时间（毫秒）
    timeout: 10000
    lettuce.pool:
# 连接池最大连接数（使用负值表示没有限制）
      max-active: 1
# 连接池最大阻塞等待时间（使用负值表示没有限制）
      max-wait: 10000
#  连接池中的最大空闲连接
      max-idle: 1
# 连接池中的最小空闲连接
      min-idle: 0

  jackson:
    date-format:  yyyy-MM-dd HH:mm:ss
    time-zone: GMT+8

  devtools:
    restart:
      additional-paths: src/main/java,src/main/resources
      exclude: static/**,public/**

  datasource:
    name: ${gen.dbName}
    url: jdbc:mysql://dev-application-mysql:3306/${gen.dbName}?useUnicode=true&characterEncoding=UTF-8&useSSL=false&createDatabaseIfNotExist=true
    username: root
    password:
    type: com.alibaba.druid.pool.DruidDataSource
    driver-class-name: com.mysql.jdbc.Driver
    filters: stat
    maxActive: 500
    initialSize: 10
    maxWait: 600000
    minIdle: 1
    timeBetweenEvictionRunsMillis: 60000
    minEvictableIdleTimeMillis: 300000
    validationQuery: select 'x'
    testWhileIdle: true
    testOnBorrow: false
    testOnReturn: false
    poolPreparedStatements: true
    maxOpenPreparedStatements: 20

    
zhsit:
  rdb:
    database: mysql
    schemaPattern: root
  cache:
#serializer type(kryo or jdk with jdk being default)
    redisSerializer: kryo
#缓存有效时间，单位秒，默认长久有效,86400为24小时
    timeToLive: 86400
gen:
    runEnv: dev
    filterLog: true
    # 系统名称，为做系统级别权限控制等使用，一个租户可能有多个系统
    systemName: ${gen.systemName}
    # 系统编码，{domain}:{port}/{systemCode,url中有可能不存在此编码}/api
    systemCode: ${gen.systemCode}
    # 系统模板类型
    templateType: ${gen.templateType}
#启动图形界面
spring.banner.location:  zhsit.cn.txt
