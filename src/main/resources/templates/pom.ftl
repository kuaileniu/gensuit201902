<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">

    <modelVersion>4.0.0</modelVersion>
    <packaging>jar</packaging>
<#if (gen.initProject == false)>
    <groupId>cn.zhsit.gen</groupId>
    <artifactId>genserver</artifactId>
</#if>
<#if (gen.initProject == true)>
    <groupId>cn.zhsit</groupId>
    <artifactId>${gen.server}</artifactId>
</#if>
    <version>1.0</version>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        <java.version>11</java.version>
        <project.version>1.0</project.version>
        <#--<thymeleaf.version>3.0.6.RELEASE</thymeleaf.version>-->
        <#--<thymeleaf-layout-dialect.version>2.1.1</thymeleaf-layout-dialect.version>-->
    <#if (gen.usePOI == true)>
    ${r"<poiVersion>3.17</poiVersion>"}
    </#if>
    </properties>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.0.0.RELEASE</version>
    </parent>

    <dependencies>

        <!-- web -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <exclusions>
                <exclusion>
                    <groupId>org.springframework.boot</groupId>
                    <artifactId>spring-boot-starter-tomcat</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
        <!-- Web 容器 undertow -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-undertow</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-aop</artifactId>
        </dependency>
        <!-- 持久层 -->
        <dependency>
            <groupId>org.mybatis.spring.boot</groupId>
            <artifactId>mybatis-spring-boot-starter</artifactId>
            <version>1.3.2</version>
        </dependency>


        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.40</version>
        </dependency>
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>druid</artifactId>
            <version>1.0.31</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        <#--<dependency>-->
            <#--<groupId>io.rest-assured</groupId>-->
            <#--<artifactId>spring-mock-mvc</artifactId>-->
            <#--<version>3.1.0</version>-->
            <#--<scope>test</scope>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>io.rest-assured</groupId>-->
            <#--<artifactId>rest-assured</artifactId>-->
            <#--<version>3.1.0</version>-->
            <#--<scope>test</scope>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>io.rest-assured</groupId>-->
            <#--<artifactId>json-schema-validator</artifactId>-->
            <#--<version>3.1.0</version>-->
            <#--<scope>test</scope>-->
        <#--</dependency>-->

        <#--<dependency>-->
            <#--<groupId>org.databene</groupId>-->
            <#--<artifactId>contiperf</artifactId>-->
            <#--<version>2.3.4</version>-->
            <#--<scope>test</scope>-->
        <#--</dependency>-->

        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-cache</artifactId>
        </dependency>
        <#--<dependency>-->
            <#--<groupId>net.sf.ehcache</groupId>-->
            <#--<artifactId>ehcache</artifactId>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>com.google.code.gson</groupId>-->
            <#--<artifactId>gson</artifactId>-->
            <#--<version>2.8.1</version>-->
        <#--</dependency>-->


<#if (gen.useRedis == true)>
    ${r"
        <!--
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-redis</artifactId>
            <version>1.4.7.RELEASE</version>
        </dependency>
         -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-redis</artifactId>
            <version>2.0.0.RELEASE</version>
        </dependency>


        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-pool2</artifactId>
            <version>2.6.0</version>
        </dependency>

        <dependency>
            <groupId>redis.clients</groupId>
            <artifactId>jedis</artifactId>
            <version>3.0.0</version>
        </dependency>
    "}
</#if>
        <#--<dependency>-->
            <#--<groupId>io.springfox</groupId>-->
            <#--<artifactId>springfox-swagger2</artifactId>-->
            <#--<version>2.6.1</version>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>io.springfox</groupId>-->
            <#--<artifactId>springfox-swagger-ui</artifactId>-->
            <#--<version>2.6.1</version>-->
        <#--</dependency>-->
        <dependency>
            <groupId>commons-io</groupId>
            <artifactId>commons-io</artifactId>
            <version>2.2</version>
        </dependency>
        <dependency>
            <groupId>com.google.code.gson</groupId>
            <artifactId>gson</artifactId>
            <version>2.8.4</version>
        </dependency>
        <#--<dependency>-->
            <#--<groupId>org.springframework.boot</groupId>-->
            <#--<artifactId>spring-boot-starter-freemarker</artifactId>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>com.alibaba</groupId>-->
            <#--<artifactId>fastjson</artifactId>-->
            <#--<version>1.2.28</version>-->
        <#--</dependency>-->
<#if (gen.saveQiniu == true)>
        <dependency>
            <groupId>com.qiniu</groupId>
            <artifactId>qiniu-java-sdk</artifactId>
            <version>[7.0.0, 7.2.99]</version>
            <#--<scope>test</scope>-->
        </dependency>
</#if>
        <#--<dependency>-->
            <#--<groupId>org.springframework.boot</groupId>-->
            <#--<artifactId>spring-boot-starter-thymeleaf</artifactId>-->
            <#--<version>2.0.0.RELEASE</version>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>org.thymeleaf</groupId>-->
            <#--<artifactId>thymeleaf-spring5</artifactId>-->
            <#--<version>3.0.9.RELEASE</version>-->
        <#--</dependency>-->

        <#--<dependency>-->
            <#--<groupId>com.esotericsoftware</groupId>-->
            <#--<artifactId>kryo</artifactId>-->
            <#--<version>4.0.1</version>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>com.esotericsoftware</groupId>-->
            <#--<artifactId>reflectasm</artifactId>-->
            <#--<version>1.11.3</version>-->
        <#--</dependency>-->
        <dependency>
            <groupId>eu.bitwalker</groupId>
            <artifactId>UserAgentUtils</artifactId>
            <version>1.20</version>
        </dependency>
        <#--<dependency>-->
            <#--<groupId>io.jsonwebtoken</groupId>-->
            <#--<artifactId>jjwt</artifactId>-->
            <#--<version>0.9.0</version>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>com.auth0</groupId>-->
            <#--<artifactId>java-jwt</artifactId>-->
            <#--<version>3.2.0</version>-->
        <#--</dependency>-->
        <#--<dependency>-->
            <#--<groupId>org.apache.shiro</groupId>-->
            <#--<artifactId>shiro-spring</artifactId>-->
            <#--<version>1.3.2</version>-->
        <#--</dependency>-->
<#if (gen.saveFastDFS == true)>
${r"
        <dependency>
            <groupId>org.csource</groupId>
            <artifactId>fastdfs-client-java</artifactId>
            <version>1.27-SNAPSHOT</version>
            <scope>system</scope>
            <systemPath>${project.basedir}/lib/fastdfs-client-java-1.27-SNAPSHOT.jar</systemPath>
        </dependency>
"}
</#if>
<#if (gen.initProject == true)>
${r"
        <dependency>
            <groupId>cn.zhsit.gen</groupId>
            <artifactId>genserver</artifactId>
            <version>1.0</version>
            <scope>system</scope>
            <systemPath>${project.basedir}/lib/genserver.jar</systemPath>
        </dependency>
"}
</#if>
<#if (gen.usePOI == true)>
${r"
        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi</artifactId>
            <version>${poiVersion}</version>
        </dependency>
        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi-excelant</artifactId>
            <version>${poiVersion}</version>
        </dependency>
        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi-scratchpad</artifactId>
            <version>${poiVersion}</version>
        </dependency>
        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi-ooxml</artifactId>
            <version>${poiVersion}</version>
        </dependency>

        <dependency>
            <groupId>org.apache.poi</groupId>
            <artifactId>poi-ooxml-schemas</artifactId>
            <version>${poiVersion}</version>
        </dependency>

        <dependency>
            <groupId>cn.afterturn</groupId>
            <artifactId>easypoi-spring-boot-starter</artifactId>
            <version>3.3.0</version>
        </dependency>

"}
</#if>
<#if (gen.useJFree == true)>
${r"
        <dependency>
            <groupId>org.jfree</groupId>
            <artifactId>jfreechart</artifactId>
            <version>1.5.0</version>
        </dependency>
"}
</#if>
<#if (gen.useDynamicreports == true)>
    ${r"
        <dependency>
            <groupId>net.sourceforge.dynamicreports</groupId>
            <artifactId>dynamicreports-core</artifactId>
            <version>6.0.0</version>
        </dependency>
        <dependency>
            <groupId>net.sourceforge.dynamicreports</groupId>
            <artifactId>dynamicreports-googlecharts</artifactId>
            <version>6.0.0</version>
        </dependency>
        <dependency>
            <groupId>net.sourceforge.dynamicreports</groupId>
            <artifactId>dynamicreports-adhoc</artifactId>
            <version>6.0.0</version>
        </dependency>
"}
</#if>
<#if (gen.workflow == true)>
${r"
        <dependency>
            <groupId>org.activiti</groupId>
            <artifactId>activiti-spring-boot-starter-basic</artifactId>
            <version>6.0.0</version>
        </dependency>
"}
</#if>
<#if (gen.useLua == true)>
<#--https://www.cnblogs.com/mumuxinfei/p/8474251.html-->
    ${r"
    <!--https://github.com/luaj/luaj 下载最新版的编译jar包,maven中央库的版本较老-->
    <dependency>
        <groupId>org.luaj</groupId>
        <artifactId>luaj-jse</artifactId>
        <version>3.0.1</version>
    </dependency>

        <dependency>
            <groupId>org.mini2Dx</groupId>
            <artifactId>miniscript-lua</artifactId>
            <version>1.1.0</version>
        </dependency>

        <dependency>
            <groupId>com.videoli</groupId>
            <artifactId>venvy_lua</artifactId>
            <version>2.9.7</version>
        </dependency>

"}
</#if>

        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-lang3</artifactId>
            <version>3.8</version>
        </dependency>
        <dependency>
            <groupId>org.apache.httpcomponents</groupId>
            <artifactId>httpclient</artifactId>
            <version>4.5.5</version>
        </dependency>
        <dependency>
            <groupId>org.apache.commons</groupId>
            <artifactId>commons-compress</artifactId>
            <version>1.18</version>
        </dependency>
        <#-- 阿里图片压缩 https://www.cnblogs.com/xieegai/p/8313051.html -->
        <!-- https://mvnrepository.com/artifact/com.alibaba/simpleimage -->
        <dependency>
            <groupId>com.alibaba</groupId>
            <artifactId>simpleimage</artifactId>
            <version>1.2.3</version>
        </dependency>


        <dependency>
            <groupId>net.coobird</groupId>
            <artifactId>thumbnailator</artifactId>
            <version>0.4.8</version>
        </dependency>
        <dependency>
            <groupId>org.owasp.antisamy</groupId>
            <artifactId>antisamy</artifactId>
            <version>1.5.8</version>
        </dependency>
    </dependencies>

    <build>
        <finalName>${r"$"}{project.name}</finalName>
        <resources>
            <resource>
                <directory>src/main/resources</directory>
                <targetPath>${r"$"}{project.build.directory}/classes</targetPath>
                <filtering>false</filtering>
            </resource>
            <resource>
                <directory>deploy/${r"$"}{env}/resources</directory>
                <targetPath>${r"$"}{project.build.directory}/classes</targetPath>
            <#--<#if (gen.initProject == true)>-->
                <filtering>false</filtering>
            <#--<#else >-->
                <#--<filtering>true</filtering>-->
                <#--<includes>-->
                    <#--<include>zhsit.cn.txt</include>-->
                <#--</includes>-->
            <#--</#if>-->
            </resource>
            <resource>
                <directory>deploy/${r"$"}{env}/script</directory>
                <targetPath>${r"$"}{project.build.directory}</targetPath>
            <#--<#if (gen.initProject == true)>-->
                <filtering>false</filtering>
            <#--<#else >-->
                <#--<filtering>true</filtering>-->
            <#--</#if>-->
            </resource>
        </resources>
        <plugins>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <configuration>
                    <source>11</source>
                    <target>11</target>
                    <encoding>UTF-8</encoding>
                </configuration>
            </plugin>
<#if (gen.initProject == false)>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jar-plugin</artifactId>
                <version>3.1.0</version>
                <configuration>
                    <includes>
                        <include>**/*.class</include>
                        <include>zhsit.cn.txt</include>
                    </includes>
                </configuration>
            </plugin>
</#if>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <configuration>
                    <testFailureIgnore>true</testFailureIgnore>
                </configuration>
            </plugin>
        <#if (gen.initProject == true)>
        ${r"
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <configuration>
                    <includeSystemScope>true</includeSystemScope>
                </configuration>
            </plugin>
        "}
        </#if>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-assembly-plugin</artifactId>
                <version>2.5.4</version>
                <executions>
                    <execution>
                        <id>make-assembly</id>
                        <phase>package</phase>
                        <goals>
                            <goal>assembly</goal>
                        </goals>
                        <configuration>
                            <descriptors>
                                <descriptor>deploy/assembly.xml</descriptor>
                            </descriptors>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>

    <profiles>
        <profile>
            <id>dev</id>
            <properties>
                <env>dev</env>
            </properties>
        </profile>
        <profile>
            <id>local</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <properties>
                <env>local</env>
            </properties>
        </profile>
        <profile>
            <id>test</id>
            <properties>
                <env>test</env>
            </properties>
        </profile>
        <profile>
            <id>prod</id>
            <properties>
                <env>prod</env>
            </properties>
        </profile>

    </profiles>
</project>