FROM openjdk:17-jdk-slim

WORKDIR /opt/mindustry

# 下载 Mindustry 服务端
ADD https://github.com/Anuken/Mindustry/releases/download/v142/Mindustry.jar server.jar

# 将你的 config 和 mods 文件挂载进来
VOLUME ["/opt/mindustry/config"]

EXPOSE 6567
EXPOSE 6567/udp

CMD ["java", "-jar", "server.jar"]
