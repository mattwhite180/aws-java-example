FROM amazoncorretto:11

RUN apt update && apt install -y wget unzip

RUN wget https://sdk-for-java.amazonwebservices.com/latest/aws-java-sdk.zip
RUN unzip aws-java-sdk.zip

COPY HelloWorld.java .

RUN javac HelloWorld.java
CMD ["java", "HelloWorld"] 
