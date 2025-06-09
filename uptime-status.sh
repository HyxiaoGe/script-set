#!/bin/bash
echo "⏱️ 服务器已运行："
uptime -p

echo -e "\n📈 当前负载："
uptime

echo -e "\n🔁 最近重启历史："
last reboot | head -n 5
