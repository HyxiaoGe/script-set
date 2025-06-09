#!/bin/bash

echo "🧠 CPU 信息："
lscpu | grep 'Model name'
top -bn1 | grep "Cpu(s)"

echo -e "\n💾 内存使用："
free -h

echo -e "\n🗃️ 磁盘占用："
df -h | grep -v tmpfs

echo -e "\n📡 网络情况："
ip a | grep inet

echo -e "\n📦 正在运行的服务（Top 10 by CPU）："
ps aux --sort=-%cpu | head -n 10
