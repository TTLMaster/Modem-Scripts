#!/system/bin/busybox sh
while : ; do
	if echo -e "GET / HTTP/1.1\nHost: captive.apple.com\n" | /system/xbin/busybox nc captive.apple.com 80 | /system/xbin/busybox grep -cE "(phone-tethering|tablet-tethering)" -gt 0; then
		echo -e 'AT^RESET\r' > /dev/appvcom1
	else
		/system/bin/sleep 10
	fi
done
