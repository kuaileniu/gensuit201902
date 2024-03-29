<?xml version="1.0" encoding="UTF-8"?>
<configuration debug="false">
    <!--<property name="LOG_HOME" value="/home"/>-->
    <property name="LOG_HOME" value="./logs"/>
    <!-- 控制台输出 -->
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出,%d:日期;%thread:线程名;%-5level：级别,从左显示5个字符宽度;%msg:日志消息;%n:换行符 -->
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} - %msg%n</pattern>
        </encoder>
    </appender>
    <!-- 按照每天生成日志文件 -->
    <appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <!--日志文件输出的文件名 -->
            <!--<FileNamePattern>${LOG_HOME}/zhsit.log.%d{yyyy-MM-dd}.log</FileNamePattern>-->
            <FileNamePattern>${LOG_HOME}/zhsit.cn-${gen.systemCode}.%d{yyyy-MM-dd}.log</FileNamePattern>
            <!--日志文件保留天数 -->
            <MaxHistory>30</MaxHistory>
        </rollingPolicy>
        <encoder class="ch.qos.logback.classic.encoder.PatternLayoutEncoder">
            <!--格式化输出,%d:日期;%thread:线程名;%-5level：级别,从左显示5个字符宽度;%msg:日志消息;%n:换行符 -->
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} -%msg%n</pattern>
        </encoder>
        <!--日志文件最大的大小 -->
        <triggeringPolicy class="ch.qos.logback.core.rolling.SizeBasedTriggeringPolicy">
            <MaxFileSize>10MB</MaxFileSize>
        </triggeringPolicy>
    </appender>


    <appender name="ERROR-FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <append>true</append>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>${LOG_HOME}/zhsit.cn-${gen.systemCode}.error.%d{yyyy-MM-dd}.log</fileNamePattern>
            <MaxHistory>72</MaxHistory>
        </rollingPolicy>
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>error</level>
            <onMatch>ACCEPT</onMatch>
            <onMismatch>DENY</onMismatch>
        </filter>

        <encoder>
            <pattern>%d{yyyy-MM-dd HH:mm:ss.SSS} [%thread] %-5level %logger{50} -%msg%n</pattern>
        </encoder>
    </appender>
    <!-- show parameters for hibernate sql 专为 Hibernate 定制 -->
    <!--<logger name="org.hibernate.type.descriptor.sql.BasicBinder" level="TRACE"/>-->
    <!--<logger name="org.hibernate.type.descriptor.sql.BasicExtractor" level="DEBUG"/>-->
    <!--<logger name="org.hibernate.SQL" level="DEBUG"/>-->
    <!--<logger name="org.hibernate.engine.QueryParameters" level="DEBUG"/>-->
    <!--<logger name="org.hibernate.engine.query.HQLQueryPlan" level="DEBUG"/>-->

    <!--myibatis log configure -->
    <logger name="com.apache.ibatis" level="TRACE"/>
    <logger name="java.sql.Connection" level="DEBUG"/>
    <logger name="java.sql.Statement" level="DEBUG"/>
    <logger name="java.sql.PreparedStatement" level="DEBUG"/>
	<logger name="cn.zhsit.hotel.daos" level="DEBUG">
        <appender-ref ref="STDOUT" />
    </logger>
    <logger name="java.sql" level="debug">  
	    <appender-ref ref="STDOUT"/>  
	</logger>   
    <!-- 日志输出级别 TRACE DEBUG INFO  ERROR-->
    <root level="INFO">
        <appender-ref ref="STDOUT"/>
        <appender-ref ref="FILE"/>
        <appender-ref ref="ERROR-FILE" />
    </root>
    <!--日志异步到数据库 -->
    <!--<appender name="DB" class="ch.qos.logback.classic.db.DBAppender">-->
    <!--&lt;!&ndash;日志异步到数据库 &ndash;&gt;-->
    <!--<connectionSource-->
    <!--class="ch.qos.logback.core.db.DriverManagerConnectionSource">-->
    <!--&lt;!&ndash;连接池 &ndash;&gt;-->
    <!--<dataSource class="com.mchange.v2.c3p0.ComboPooledDataSource">-->
    <!--<driverClass>com.mysql.jdbc.Driver</driverClass>-->
    <!--<url>jdbc:mysql://127.0.0.1:3306/databaseName</url>-->
    <!--<person>root</person>-->
    <!--<password>root</password>-->
    <!--</dataSource>-->
    <!--</connectionSource>-->
    <!--</appender>-->
</configuration>