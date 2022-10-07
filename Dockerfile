FROM maven:3-jdk-8 as mvn
RUN mvn package

FROM openjdk:8-alpine
LABEL AUTHOR="devopsnraju"
COPY --from=mvn /spring-petclinic/target/spring-petclinic*.jar /spring-petclinic.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar"]
CMD ["/spring-petclinic.jar"]
