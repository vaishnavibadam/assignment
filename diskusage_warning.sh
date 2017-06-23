#!/bin/bash
#df -T| awk '{print $3}' |cat >disk|awk 'BEGIN { n = 0; } {for ( i = 2 ; i <= NF ; i++ ) $n+ = $disk[i]; } END { print $n; }'

echo df -T| awk '{print $5}' | sed 's/%//g'
