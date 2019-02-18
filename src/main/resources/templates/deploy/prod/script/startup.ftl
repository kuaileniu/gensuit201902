APP=${gen.systemCode}.jar
nohup java -jar $APP --server.port=8088 >/dev/null 2>console.log &
