#!/bin/bash
if ! [ $# -eq 2 ]
then
echo "usage: $0 <file1> <file2>"
exit
fi 
cat $1>>$2
