#!/bin/bash
cd saiku-core
mvn clean install  
#-DskipTests=true 
cd ..
cd saiku-webapp
mvn clean install
cd ..
git submodule init
git submodule update
cd saiku-ui
git checkout 2.6.x 
git pull
mvn clean package install:install-file -Dfile=target/saiku-ui-2.6.1-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=2.6.1-SNAPSHOT -Dpackaging=war
cd ../saiku-server
mvn clean package
cd ../saiku-bi-platform-plugin
mvn clean package
cd ../saiku-bi-platform-plugin-p5
mvn clean package
