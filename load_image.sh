#!/bin/bash

IMAGE_DIR="."

for image in "$IMAGE_DIR"/*.tar; do
    if [ ! -e "$image" ]; then
        echo "未找到任何 .tar 镜像文件。"
        break
    fi

    echo "正在加载镜像: $image"
    docker load -i "$image"
    if [ $? -eq 0 ]; then
        echo "成功加载: $image"
    else
        echo "加载失败: $image"
    fi
done

echo "所有镜像已尝试加载完毕。"
