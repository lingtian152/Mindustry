FROM openjdk:17-jdk-slim

WORKDIR /opt/mindustry

COPY server.jar server.jar

VOLUME ["/opt/mindustry/config", "/opt/mindustry/mods"]

EXPOSE 6567
EXPOSE 6567/udp

CMD ["java", "-jar", "server.jar"]
