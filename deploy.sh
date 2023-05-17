#!/bin/bash

# 1. 本地npm打包vue程序
echo "正在进行本地maven程序..."
mvn clean compile package
JAR_NAME=$(mvn help:evaluate -Dexpression=project.build.finalName -q -DforceStdout).jar
echo ${JAR_NAME}
echo "打包完成."

# 2. ssh连接远程服务器，清空目标目录
REMOTE_USER="root"
REMOTE_HOST="49.232.144.133"
REMOTE_PATH="/root/reggie"
LOCAL_JAR_FILE="target/${JAR_NAME}"
echo "正在连接远程服务器并清空目标目录..."
ssh ${REMOTE_USER}@${REMOTE_HOST} 'if [ -f ${REMOTE_PATH}/${JAR_NAME} ]; then rm -f ${REMOTE_PATH}/${JAR_NAME}; fi'
echo "远程目录清空完成."
#
## 3. 将jar，发送到远端目录
echo "正在将build下的内容发送到远端目录..."
scp -r ${LOCAL_JAR_FILE} ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/
echo "内容已发送到远端目录."
# 4. 运行jar
echo "正在启动远程服务"
echo ${REMOTE_USER}@${REMOTE_HOST} "/root/reggie/start.sh ${JAR_NAME}"
echo "远程服务启动完毕"
echo "脚本执行完毕."
