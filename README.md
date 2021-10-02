# HOW TO CREATE YOUR GRADLE PROJECT WITH AWS SDK
================================================


# AWS JAVA SDK V1 vs V2
This project is an example of using version 2 of the Java AWS SDK.

When you are looking at the aws docs and see examples using `import com.amazonaws.XXXX...;`,
that is version 1 of the Java AWS SDK. Version 2 of Java AWS SDK looks something like `import software.amazon.awssdk.XXX...`

Find the `v1` in the URL of the page (example: https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/examples-s3-buckets.html) and change it to `latest` (example: https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/examples-s3-buckets.html)


1. How I setup gradle:

* please use the latest version of gradle and docker

```
[$]: gradle init

Select type of project to generate:
  1: basic
  2: application
  3: library
  4: Gradle plugin
Enter selection (default: basic) [1..4] 2

Select implementation language:
  1: C++
  2: Groovy
  3: Java
  4: Kotlin
  5: Scala
  6: Swift
Enter selection (default: Java) [1..6] 3

Split functionality across multiple subprojects?:
  1: no - only one application project
  2: yes - application and library projects
Enter selection (default: no - only one application project) [1..2] 1

Select build script DSL:
  1: Groovy
  2: Kotlin
Enter selection (default: Groovy) [1..2] 1

Select test framework:
  1: JUnit 4
  2: TestNG
  3: Spock
  4: JUnit Jupiter
Enter selection (default: JUnit Jupiter) [1..4] 1

Project name (default: src): HelloWorld
Source package (default: HelloWorld): 

> Task :init
Get more help with your project: https://docs.gradle.org/7.2/samples/sample_building_java_applications.html

BUILD SUCCESSFUL in 34s
2 actionable tasks: 2 executed
```

2. [Adding AWS SDK as a dependency to gradle](https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/setup-project-gradle.html)

3. go into the `build.gradle` and add the aws components you need:
```GRADLE
dependencies {
    // AWS SDK
    implementation platform('software.amazon.awssdk:bom:2.15.0')
    implementation 'software.amazon.awssdk:ec2' // <-- example here
    implementation 'software.amazon.awssdk:s3' // <-- example here
    implementation 'software.amazon.awssdk:regions' // <-- example here

    // Use JUnit test framework.
    testImplementation 'junit:junit:4.13.2'

    // This dependency is used by the application.
    implementation 'com.google.guava:guava:30.1.1-jre'
}
```

Go to [THIS](https://mvnrepository.com/artifact/software.amazon.awssdk/bom/2.17.50) page to see other AWS services you can add to gradle

# Testing your project

I added some AWS imports in the `src/app/src/main/java/HelloWorld/App.java` file to test if our app installs the AWS SDK properly:
```JAVA
package HelloWorld;

import software.amazon.awssdk.core.waiters.WaiterResponse;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.*;
import software.amazon.awssdk.services.s3.waiters.S3Waiter;

import java.util.List;

public class App {
    public String getGreeting() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
    }
}
```

To build your project, run the following commands:
* `./gradlew buildDependents`
    * this command will download and install the AWS SDK into your project
* `./gradlew build` 
    * this command builds your project
* `./gradlew check`
    * this command... does something?
* `./gradlew test`
    * this command runs your unit test in `src/app/src/test/java/HelloWorld/AppTest.java`
* `./gradlew run`
    * this command runs your project

# DOCKER!
See `Dockerfile` in project

### TURN THE DOCKERFILE INTO A DOCKER IMAGE
`docker build -t javatest .`

### RUN THE DOCKER IMAGE
`docker run -it javatest`

### NICE ONE-LINER:
`docker build -t javatest . && docker run -it javatest`


# USING AWS CREDENTIALS WITH DOCKER
AWS projects that use AWS resources will require that you setup your AWS credentials. To give your Docker project access to your aws credentials, you need to mount your `.aws` folder in your home directory as a volume in your docker image:
`docker run -it -v ~/.aws:/root/.aws javatest`

So the one-liner would look like this:

`docker build -t javatest  . && docker run -it -v ~/.aws:/root/.aws javatest`
