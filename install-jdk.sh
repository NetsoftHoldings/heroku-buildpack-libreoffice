mkdir -p /opt/jvm-common
curl --silent --location https://codon-buildpacks.s3.amazonaws.com/buildpacks/heroku/jvm-common.tgz | tar xzm -C /opt/jvm-common --strip-components=1
source /opt/jvm-common/bin/util
source /opt/jvm-common/bin/java
mkdir -p /opt/jdk
install_java /opt/jdk $1