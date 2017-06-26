#! /bin/bash
if [[ $# -ne 1 ]];
then       
	echo "usage:$0 <time in seconds>"
	exit 1
fi
count=0
memory=0
disk_usage=0
cpu_usage=0
AvgMemory()  #for printing avg memory 
{
	avg=`echo $1 / $2 | bc`
	echo "Avg memory : $avg"
}
AvgCpu()   #for printing avg cpu
{
	avg1=`echo $1 / $2 | bc`
	echo "Avg cpu : $avg1"
}
AvgDisk() #for printing avg disk usage	
{
	avg2=`echo $1 / $2 | bc`
	echo "Avg disk : $avg2"
}
	printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+$1))
while [ $SECONDS -le $end ];  #for calculating disk,memory and cpu utilization
do
	MEMORY=$(free -m | awk 'NR==2{printf "%.2f\t\t",$3*100/$2 }')
	DISK=$(df -h | awk '$NF=="/"{printf "%.2f\t\t", $5}')
	CPU=$(top -bn1 | grep load | awk '{printf "%.2f\t\t\n", $(NF-2)}')
	echo "$MEMORY$DISK$CPU"
	memory=`echo $memory + $MEMORY | bc`
	disk_usage=`echo $disk_usage + $DISK | bc`
	cpu_usage=`echo $cpu_usage + $CPU | bc`
	count=$(( $count + 1))
	sleep 5
done
AvgMemory $memory $count
AvgCpu $disk_usage $count
AvgDisk $cpu_usage $count


