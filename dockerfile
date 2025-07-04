# 使用 openjdk17 的更小版本作为基础镜像
FROM openjdk:25-ea-17-jdk-bookworm

# 设置默认语言/时区，防止日志乱码或时区偏差
ENV LANG=C.UTF-8 \
    TZ=Asia/Shanghai

# 创建工作目录
WORKDIR /opt/mindustry

# 拷贝服务端 jar 包
COPY server.jar server.jar

# 显式创建挂载点目录（便于容器启动时 mount）
RUN mkdir -p config mods

# 声明挂载点
VOLUME ["/opt/mindustry/config", "/opt/mindustry/mods"]

# 开放端口
EXPOSE 6567
EXPOSE 6567/udp

# 健康检查：Mindustry 默认监听 TCP 6567 端口
HEALTHCHECK --interval=30s --timeout=3s --start-period=10s --retries=3 \
  CMD nc -z localhost 6567 || exit 1

# 启动服务
CMD java -jar server.jar host
