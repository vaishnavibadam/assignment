#!/bin/bash
if ! [ $# -eq 2 ]
then
echo "usage: $0 <file1> <file2>"
exit
fi 
cp $1 $2
