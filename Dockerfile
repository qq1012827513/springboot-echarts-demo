# 使用官方 Java 运行时作为父镜像
FROM ubuntu:20.04 
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    libfontconfig \
    libfontconfig-dev
# 将本地文件复制到容器的 /app 文件夹下
COPY . /app

# 将工作目录切换到 /app
WORKDIR /app

# 给我们的 start.sh 脚本文件添加可执行权限
RUN chmod +x /app/start.sh

# 在容器启动时运行 start.sh 脚本
CMD ["./start.sh"]
