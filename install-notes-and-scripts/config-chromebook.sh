
# limit systemd journal log file size
sed -i "s/SystemMaxUse=.*/SystemMaxUse=50M/" /etc/systemd/journald.conf

# check it
#grep "#SystemMaxUse" /etc/systemd/journald.conf
