#! /bin/bash
if ! [[ $# -eq 1 || $# -eq 2 ]];
then       
	echo "usage:$0 <time in seconds> [all/cpu/disk/memory]"
	exit 1
fi

cpu()
{
count=0
cpu_usage=0
if [ -f temp.txt ]
then
	rm temp.txt
fi
AvgCpu()   #for printing avg cpu
{
	avg1=`echo $1 / $2 |bc -l`
	printf {"\n avg cpu = %.2f",$avg1}
	
}
printf "CPU\n"
end=$((SECONDS+$1))
while [ $SECONDS -le $end ];  #for calculating cpu utilization
do
CPU=$(top -bn1 | grep load | awk '{printf "%.2f\t\t\n", $(NF-2)}')
echo "$CPU"
cpu_usage=`echo $cpu_usage + $CPU | bc`

	count=$(( $count + 1))   
	echo "$CPU" >>temp.txt
	sleep 5
done
AvgCpu $cpu_usage $count
printf "minimum cpu value :"
awk '{print $1}' temp.txt|sort|head -1
printf "maximum cpu value :"
awk '{print $1}' temp.txt|sort|tail -1
rm temp.txt
}
disk()
{
count=0
disk_usage=0
if [ -f temp.txt ]
then
	rm temp.txt
fi
AvgDisk() #for printing avg disk usage	
{
	avg2=`echo $1 / $2 | bc -l`
	printf {"\n avg disk = %.2f\n",$avg2}
}
printf "Disk\n"
end=$((SECONDS+$1))
while [ $SECONDS -le $end ];  #for calculating disk utilization
do
DISK=$(df -h | awk '$NF=="/"{printf "%.2f\t\t", $5}')
echo "$DISK"
disk_usage=`echo $disk_usage + $DISK | bc`

	count=$(( $count + 1))   
	echo "$DISK" >>temp.txt
	sleep 5
done
AvgDisk $disk_usage $count

printf "minimum disk value :"
awk '{print $1}' temp.txt|sort|head -1
printf "maximum disk value :"
awk '{print $1}' temp.txt|sort|tail -1
rm temp.txt
}
memory()
{
count=0
memory=0
if [ -f temp.txt ]
then
	rm temp.txt
fi
AvgMemory()  #for printing avg memory 
{ 
	avg=`echo $1 / $2 |bc -l` 
	printf {"\n avg memory = %.2f",$avg}	
}

printf "Memory\n"
end=$((SECONDS+$1))
while [ $SECONDS -le $end ];  #for calculating memory utilization
do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f\t\t",$3*100/$2 }')
echo "$MEMORY"
memory=`echo $memory + $MEMORY | bc`

	count=$(( $count + 1))   
	echo "$MEMORY" >>temp.txt
	sleep 5

done
AvgMemory $memory $count

printf "minimum memory value :"
awk '{print $1}' temp.txt|sort|head -1
printf "maximum memory value :"
awk '{print $1}' temp.txt|sort|tail -1
rm temp.txt
}


all()
{
cpu $1
memory $1
disk $1
	
}

if [[ "$2" == "all" ]]
then
all $1
fi

if [[ "$2" == "cpu" ]]
then
cpu $1
fi

if [[ "$2" == "memory" ]]
then
memory $1
fi

if [[ "$2" == "disk" ]]
then
disk $1
fi
if [[ "$2" == " " ]]
then
all $1
fi
if ! [[ "$2" == " " || "$2" == "all" || "$2" == "cpu" || "$2" == "disk"  || "$2" == "memory" ]]
then
all $1
fi




