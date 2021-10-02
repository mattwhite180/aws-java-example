# aws-java-example

## Useful links
* [setting up the AWS SDK with gradle](https://docs.aws.amazon.com/sdk-for-java/latest/developer-guide/setup-project-gradle.html)


This program has the following java program called `HelloWorld.java`:
```JAVA
package HelloWorld;

import software.amazon.awssdk.services.ec2.Ec2Client;
import software.amazon.awssdk.services.ec2.model.DescribeRegionsResponse;
import software.amazon.awssdk.services.ec2.model.Region;
import software.amazon.awssdk.services.ec2.model.AvailabilityZone;
import software.amazon.awssdk.services.ec2.model.Ec2Exception;
import software.amazon.awssdk.services.ec2.model.DescribeAvailabilityZonesResponse;

public class App {
    public String getGreeting() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        System.out.println(new App().getGreeting());
    }
}

```

The `import` statements will throw the following errors if you don't have the AWS SDK installed:
```
[$]: ./gradlew run

> Task :app:compileJava FAILED
/home/mattw/aws-java-example/src/app/src/main/java/HelloWorld/App.java:6: error: package software.amazon.awssdk.services.ec2 does not exist
import software.amazon.awssdk.services.ec2.Ec2Client;
                                          ^
/home/mattw/aws-java-example/src/app/src/main/java/HelloWorld/App.java:7: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.DescribeRegionsResponse;
                                                ^
/home/mattw/aws-java-example/src/app/src/main/java/HelloWorld/App.java:8: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.Region;
                                                ^
/home/mattw/aws-java-example/src/app/src/main/java/HelloWorld/App.java:9: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.AvailabilityZone;
                                                ^
/home/mattw/aws-java-example/src/app/src/main/java/HelloWorld/App.java:10: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.Ec2Exception;
                                                ^
/home/mattw/aws-java-example/src/app/src/main/java/HelloWorld/App.java:11: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.DescribeAvailabilityZonesResponse;
                                                ^
6 errors

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:compileJava'.
> Compilation failed; see the compiler error output for details.

* Try:
Run with --stacktrace option to get the stack trace. Run with --info or --debug option to get more log output. Run with --scan to get full insights.

* Get more help at https://help.gradle.org

BUILD FAILED in 1s
1 actionable task: 1 executed
```

Run the Docker project:


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