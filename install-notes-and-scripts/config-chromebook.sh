
# limit systemd journal log file size
#grep -v "#" /etc/systemd/journald.conf
sed -i "s/SystemMaxUse=.*/SystemMaxUse=50M/g" /etc/systemd/journald.conf