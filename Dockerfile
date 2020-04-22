FROM tolarewaju3/eap7-full

WORKDIR /opt/jboss

COPY simple-process/target/*.jar . 
COPY embedded-process-workitemhandler/target/*.war .

RUN mvn install:install-file \
   -Dfile=simple-process-0.0.1-SNAPSHOT.jar \
   -DgroupId=org.codelikethewind \
   -DartifactId=simple-process \
   -Dversion=0.0.1-SNAPSHOT \
   -Dpackaging=jar \
   -DgeneratePom=true

RUN cp *.war /opt/jboss/jboss-eap-7.3/standalone/deployments

