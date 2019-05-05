#!/bin/bash

# Bat=$(acpi | cut -d " " -f4 | tr -d "%,")
Bat1=$(acpi | cut -d " " -f4 | tr -d "%," | head -n 1 )
Bat2=$(acpi | cut -d " " -f4 | tr -d "%," | tail -n 1 )
Adapt=$(acpi -a | cut -d " " -f3)

if [ "$Adapt" = "on-line" ];then
	icon0=""
    icon1=""
    icon2=""
    icon3=""
    icon4=""
else
    icon0=""
    icon1=""
    icon2=""
    icon3=""
    icon4=""
fi

# if [ -z "$Bat" ];then
#     bat=""
# elif [ "$Bat" -gt "100" ];then
#      bat="$icon4 Full"
# elif [ "$Bat" -gt "90" ];then
#      bat="$icon3 $Bat %"
# elif [ "$Bat" -gt "60" ];then
#      bat="$icon2 $Bat %"
# elif [ "$Bat" -gt "30" ];then
#      bat="$icon1 $Bat %"
# elif [ "$Bat" -lt "30" ];then
#     bat="$icon0 $Bat %"
# fi
if [ -z "$Bat1" ];then
    bat1=""
elif [ "$Bat1" -gt "100" ];then
     bat1="$icon4 Full"
elif [ "$Bat1" -gt "90" ];then
     bat1="$icon3 $Bat1 %"
elif [ "$Bat1" -gt "60" ];then
     bat1="$icon2 $Bat1 %"
elif [ "$Bat1" -gt "30" ];then
     bat1="$icon1 $Bat1 %"
elif [ "$Bat1" -lt "30" ];then
    bat1="$icon0 $Bat1 %"
fi

if [ -z "$Bat2" ];then
    bat2=""
elif [ "$Bat2" -gt "100" ];then
     bat2="$icon4 Full"
elif [ "$Bat2" -gt "90" ];then
     bat2="$icon3 $Bat2 %"
elif [ "$Bat2" -gt "60" ];then
     bat2="$icon2 $Bat2 %"
elif [ "$Bat2" -gt "30" ];then
     bat2="$icon1 $Bat2 %"
elif [ "$Bat2" -lt "30" ];then
    bat2="$icon0 $Bat2 %"
fi

echo -e "$bat1" "$bat2"

