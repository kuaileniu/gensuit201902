https://blog.csdn.net/shouldnotappearcalm/article/details/78047047

keytool -genkey -alias tomcat -keyalg RSA -keystore ./tomcat.keystore
keytool -genkey -alias client  -storetype PKCS12 -keyalg RSA -keysize 2048 -keystore ./webserver.keystore -validity 730
密钥口令：zhs123456789
姓氏：m123456789
组织单位 ：m123456789
组织名称 ：m123456789
城市：m123456789
省：m123456789
单位地区代码：m123456789
确认是否正确：y
生成 webserver.keystore
```
   ssl:
     key-store: webserver.keystore
     ## 若放在classpath下
     ## key-store: classpath:webserver.keystore
     key-store-password: zhs123456789
     key-store-type: PKCS12
     key-alias: client
```


https://blog.csdn.net/u012702547/article/details/53790722

keytool -genkey -alias tomcat  -storetype PKCS12 -keyalg RSA -keysize 2048  -keystore keystore.p12 -validity 3650
1.-storetype 指定密钥仓库类型 
2.-keyalg 生证书的算法名称，RSA是一种非对称加密算法 
3.-keysize 证书大小 
4.-keystore 生成的证书文件的存储路径 
5.-validity 证书的有效期

https://www.cnblogs.com/zhangzb/p/5200418.html
为了能将证书顺利导入至IE和Firefox，证书格式应该是PKCS12，
keytool -genkey -alias tomcat -keypass 123456 -keyalg RSA -keysize 1024 -validity 365 -keystore D:/keys/tomcat.keystore -storepass 123456


keytool 
-genkey 
-alias client 
-keypass 123456
-keyalg RSA 
-storetype PKCS12 
-keypass 123456 
-storepass 123456 
-keystore D:/keys/client.p12