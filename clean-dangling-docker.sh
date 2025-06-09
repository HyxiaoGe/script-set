#!/bin/bash
echo "♻️ 清理 Docker 残留资源中..."
docker container prune -f
docker image prune -f
docker volume prune -f
docker network prune -f
echo "✅ Docker 系统已瘦身完成"
