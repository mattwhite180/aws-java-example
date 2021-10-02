# aws-java-example

## Useful links
* [setting up the AWS SDK with gradle](https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/setup-project-gradle.html)


This program has the following java program called `HelloWorld.java`:
```JAVA
import software.amazon.awssdk.services.ec2.Ec2Client;
import software.amazon.awssdk.services.ec2.model.DescribeRegionsResponse;
import software.amazon.awssdk.services.ec2.model.Region;
import software.amazon.awssdk.services.ec2.model.AvailabilityZone;
import software.amazon.awssdk.services.ec2.model.Ec2Exception;
import software.amazon.awssdk.services.ec2.model.DescribeAvailabilityZonesResponse;

public class HelloWorld {

    public static void main(String[] args) {
        System.out.println("Hello, World");
    }

}
```

The `import` statements will throw the following errors if you don't have the AWS SDK installed:
```
[$]: javac HelloWorld.java 
HelloWorld.java:1: error: package software.amazon.awssdk.services.ec2 does not exist
import software.amazon.awssdk.services.ec2.Ec2Client;
                                          ^
HelloWorld.java:2: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.DescribeRegionsResponse;
                                                ^
HelloWorld.java:3: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.Region;
                                                ^
HelloWorld.java:4: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.AvailabilityZone;
                                                ^
HelloWorld.java:5: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.Ec2Exception;
                                                ^
HelloWorld.java:6: error: package software.amazon.awssdk.services.ec2.model does not exist
import software.amazon.awssdk.services.ec2.model.DescribeAvailabilityZonesResponse;
                                                ^
6 errors
```

Run the Docker project:
`