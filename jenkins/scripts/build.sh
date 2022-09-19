echo $(java -version)
echo $(mvn -v)
mvn -B -DskipTests clean package -Denforcer.fail=false