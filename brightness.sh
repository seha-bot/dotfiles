NAME=$(ddcutil getvcp 0x10 | grep -o "current value =    ...." | tr -d [:alpha:][:blank:][=,=][===])
ddcutil setvcp 0x10 $((NAME + $1))
