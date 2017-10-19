#!/bin/bash -x
(
echo poooooooooooooooooooooooo
echo ""
echo "=================================================================================="
echo -n "Info:"
uptime
echo "----------------------------------------------------------------------------------"
echo -n "Hostname: "
hostname
echo -n "Kernel Version: "
uname -srm
echo ""
echo "----------------------------------------------------------------------------------"
echo "RAM:   used       free (MB)"
free -m | grep buffers/ca | cut -d":" -f2
echo "----------------------------------------------------------------------------------"
df -h
echo "----------------------------------------------------------------------------------"
echo "<b>Container(s) Overview:</b>"
echo ""
sudo vzlist -a -o vpsid,laverage,hostname,ip,status
echo "=================================================================================="

)2>&1 tee /var/log/panel.log
