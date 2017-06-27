#! /bin/bash
if [[ $# -ne 2 ]];
then              #checking whether input has 2 arguments 
	echo "usage:$0 <file_type> <pattern> or
              <file_type> <pattern1\|pattern2...>"
	exit 1
fi 
find *.$1|xargs grep $2
