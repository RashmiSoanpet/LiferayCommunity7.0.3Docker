JAVA_HOME=/usr/java/latest

CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF8 -Djava.net.preferIPv4Stack=true -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Duser.timezone=GMT"

# Gestion de GC por 1.8 usamos G1C
CATALINA_OPTS="$CATALINA_OPTS -Xmx2120m -Xms2120m "
CATALINA_OPTS="$CATALINA_OPTS -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:InitiatingHeapOccupancyPercent=45"
CATALINA_OPTS="$CATALINA_OPTS -XX:ParallelGCThreads=6 -XX:SurvivorRatio=8 -XX:NewRatio=2"

# Log de GC
CATALINA_OPTS="$CATALINA_OPTS -Xloggc:/opt/liferay-portal/tomcat/logs/logGC.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps"
CATALINA_OPTS="$CATALINA_OPTS -XX:-UseGCLogFileRotation -XX:NumberOfGCLogFiles=1 -XX:GCLogFileSize=20M"
