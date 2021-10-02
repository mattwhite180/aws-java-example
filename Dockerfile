# FROM amazoncorretto:11
FROM java:8

WORKDIR /app

# RUN yum install -y wget unzip

# RUN wget https://sdk-for-java.amazonwebservices.com/latest/aws-java-sdk.zip
# RUN unzip aws-java-sdk.zip

# COPY HelloWorld.java .
COPY src/ /app

RUN ./gradlew buildDependents

RUN ./gradlew build

RUN ./gradlew check
RUN ./gradlew test

# RUN ./gradlew 
CMD ["./gradlew", "run"] 
