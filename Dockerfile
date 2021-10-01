FROM amazoncorretto:8

COPY HelloWorld.java .

RUN javac HelloWorld.java
CMD ["java", "HelloWorld"] 
