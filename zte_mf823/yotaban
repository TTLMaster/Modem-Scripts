#!/bin/sh

while : ; do
        PR=$(ping -w 3 -c 3 cdn.rawgit.com 2>/dev/null | awk '/packets received/ {print $4}')
        if [ "x$PR" == "x3" ]; then
        iptables -N yotaban
        iptables -A FORWARD -j yotaban
                wget -O - http://cdn.rawgit.com/TTLMaster/yota-ban-list/master/list.txt | \
                while read -r i; do
                        [ "`echo $i | sed -n '/^#.*$/p'`" ] && continue
                        iptables -A yotaban -d $i -j DROP
                done
                break
        else
                sleep 3
        fi
done &
