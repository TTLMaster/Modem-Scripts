#!/system/bin/busybox sh
while : ; do
	PR=$(busybox ping -I wan0 -w 3 -c 3 cdn.rawgit.com 2>/dev/null | busybox awk '/packets received/ {print $4}')
	if [ "x$PR" != "x0" ]; then
		iptables -N yotaban
		iptables -A FORWARD -j yotaban
		/system/xbin/busybox wget -O - http://cdn.rawgit.com/TTLMaster/yota-ban-list/master/list.txt | \
		while read -r i; do
			busybox [ "`echo $i | busybox sed -n '/^#.*$/p'`" ] && continue
			iptables -A yotaban -d $i -j DROP
		done
		break
	else
		/system/bin/sleep 5
	fi
done
