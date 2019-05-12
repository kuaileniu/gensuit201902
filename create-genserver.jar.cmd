% copy到上级目录，在上级目录执行%
call del genserver.jar
cd gensuite
call mvn clean spring-boot:run -Dmaven.test.skip=true
cd ../genserver
call mvn clean package -Dmaven.test.skip=true
set sourcePath=%cd%
call copy %sourcePath%\target\genserver.jar ..
