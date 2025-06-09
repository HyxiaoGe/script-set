#!/bin/bash

REPORT=~/daily_report_$(date +%F).log
echo "📝 服务器日报 - $(date)" > $REPORT
echo -e "\n📈 负载:" >> $REPORT
uptime >> $REPORT

echo -e "\n🧠 内存:" >> $REPORT
free -h >> $REPORT

echo -e "\n💽 磁盘:" >> $REPORT
df -h >> $REPORT

echo -e "\n🕸️ 网络:" >> $REPORT
ss -tuln >> $REPORT

mail -s "🧾 每日运维报告 $(hostname)" you@example.com < $REPORT

# 自动添加 crontab（仅一次）
if ! crontab -l | grep -q "daily-report.sh"; then
  echo "📅 检测到未设置定时任务，是否添加？(y/n)"
  read -r ans
  if [[ "$ans" == "y" ]]; then
    SCRIPT_PATH=$(realpath "$0")
    (crontab -l; echo "0 7 * * * $SCRIPT_PATH") | crontab -
    echo "✅ 已添加每日定时报告到 crontab！"
  fi
fi
