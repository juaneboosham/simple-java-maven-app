echo $(java -version)
mvn -B -DskipTests clean package -Denforcer.fail=false