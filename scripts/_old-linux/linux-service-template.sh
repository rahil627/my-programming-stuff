# ai prompt: write a service example:

cat /etc/systemd/system/setledspermissions.service

[Unit]
Description=Set leds writable to everybody
Before=nodered.service

[Service]
Type=oneshot
User=root
ExecStart=/bin/bash -c "/bin/chmod a+w /sys/class/leds/led0/*"

[Install]
WantedBy=multi-user.target


sudo systemctl enable setledspermissions.service
sudo systemctl start setledspermissions.service
sudo systemctl status setledspermissions.service
