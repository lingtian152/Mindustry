WORKDIR /opt/mindustry

# 下载 Mindustry 服务端
ADD https://github.com/Anuken/Mindustry/releases/latest/download/server-release.jar server.jarAdd commentMore actions

# 将你的 config 和 mods 文件挂载进来
VOLUME ["/opt/mindustry/config"]

EXPOSE 6567
EXPOSE 6567/udp
