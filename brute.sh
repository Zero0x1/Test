#!/bin/bash

array_login=($1)
array_pass=($2)

url=$3
cookie=$4
referer=$5

for i in ${array_login[@]}
do
  for j in ${array_pass[@]}
  do
    echo 'Login: '$i''
    echo 'Password: '$j''

    curl -i -s -k  -X $'POST' \
    -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0' -H $''$referer'' -H $'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H $'X-Requested-With: XMLHttpRequest' -H $'DNT: 1' \
    -b $''$cookie'' \
    --data-binary $'login_name='$i'&login_password='$j'&login_not_save=0' \
    $''$url'' | tail | grep true
    echo '----------------'
  done
done

exit 0

