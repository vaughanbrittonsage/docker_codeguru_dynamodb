FROM codeguru/java:7

# Create working space
RUN mkdir /var/dynamodb_wd
WORKDIR /var/dynamodb_wd


# Get the package from Amazon
RUN wget -O /var/dynamodb_wd/dynamodb_local_latest http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest
RUN tar xfz /var/dynamodb_wd/dynamodb_local_latest

# Default port for DynamoDB Local
EXPOSE 8000

ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]
CMD [ "-port", "8000"]
