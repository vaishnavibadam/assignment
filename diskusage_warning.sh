#!/bin/bash
echo "Your is your disk usage is:"|cat >>disk_usage.txt
df / | grep / | awk '{ print $5}'|cat >>disk_usage.txt #for printing disk_usage to disk_usage.txt file 

echo "MAILTO=vittu512@gmail.com
59 14 * * * bash /home/rihu/assignment/diskusage_warning.sh 
0 15 * * *  cat /home/rihu/assignment/disk_usage.txt
1 15 * * * rm disk_usage.txt"  | crontab - #scheduling execution of diskusage_warning.sh,printing disk_usage.txt to mail and removing disk_usage.txt file   


