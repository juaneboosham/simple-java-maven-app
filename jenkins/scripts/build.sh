echo $(java -version)
echo $(docker -v)
mvn -B -DskipTests clean package -Denforcer.fail=false