FROM ibmjava:sfj

LABEL maintainer="K Sai Mounika"
LABEL description="Hello Hi K8s spring boot application"

RUN apt-get update -y
RUN apt-get dist-upgrade -y


COPY target/outreach-mq-commreq-datasvc-0.0.1-SNAPSHOT.jar outreach-mq-commreq-datasvc.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.kafka.jaas.options.password=${EVENT_STREAMS_CRED_ENV_VAR}","-jar","/outreach-mq-commreq-datasvc.jar"]

