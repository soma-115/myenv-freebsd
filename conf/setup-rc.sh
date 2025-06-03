#!/bin/sh

RC_CONF="/etc/rc.conf"

SETTINGS='
gateway_enable="YES"
jail_enable="YES"
linux_enable="YES"
#pf_enable="YES"
#pf_rules="/etc/pf.conf"
#pf_flags=""
#pflog_enable="YES"
#pflog_logfile="/var/log/pflog"
#pflog_flags=""
#
#firewall_enable="YES"
#firewall_type="OPEN"
#firewall_logging="YES"
#firewall_nat_enable="YES"
#firewall_nat_interface="em0"
'

# バックアップ作成
cp "$RC_CONF" "${RC_CONF}.bak.$(date +%Y%m%d%H%M%S)"

# 既存の内容に追記（既に存在する行はスキップ）
echo "$SETTINGS" | while IFS= read -r line; do
    if [ -n "$line" ] && ! grep -qF "$line" "$RC_CONF"; then
        echo "$line" >> "$RC_CONF"
    fi
done

