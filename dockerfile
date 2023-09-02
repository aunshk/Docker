# Use the official Rocky Linux 8 image as the base image
FROM rockylinux/rockylinux:8

# Install necessary packages
RUN dnf install -y wget unzip java-11-openjdk

# Set environment variables for Java
RUN export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
RUN export CATALINA_HOME=/opt/tomcat
RUN export PATH=$PATH:$JAVA_HOME/bin


# Download and extract Apache Tomee
WORKDIR /opt
RUN wget https://dlcdn.apache.org/tomee/tomee-8.0.15/apache-tomee-8.0.15-plus.tar.gz && \
    tar -xvzf apache-tomee-8.0.15-plus.tar.gz && \
    mv apache-tomee-plus-8.0.15 tomcat

# Expose Tomcat's default HTTP port
EXPOSE 8080

# Start Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
