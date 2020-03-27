#!/bin/bash -x

printf "Welcome to Gambling Simulation \n"

#constants
STAKE=100
BET=1
DAYS=25
VALUE=50

#variable
totalStake=0
maxLimit=0
minLimit=0

declare -A Dictionary
BetAmount=$STAKE

maxLimit=$(($BetAmount+$BetAmount*50/100))
minLimit=$(($BetAmount-$BetAmount*50/100))

#Function for win or loose bet
function betting()
{
	for (( count=1; count<=$DAYS; count++ ))
	do
		while [[ $BetAmount -ne 0 ]]
		do
			Number=$((RANDOM%2))
			if [[ $Number -eq 1 ]]
			then
	    		((BetAmount++))
	    		if [[ $BetAmount -eq $maxLimit ]]
	    		then
					break
        		fi
			else
				((BetAmount--))
				if [[ $BetAmount -eq $minLimit ]]
				then
					break
				fi
			fi
		done
		if [[ $BetAmount -eq $minLimit ]]
		then
			totalStake=$(( $totalStake-$VALUE ))
			Dictionary[$count]=$totalStake
		else
			totalStake=$(( $totalStake+$VALUE ))
			Dictionary[$count]=$totalStake
		fi
	done
	printf "totalStake: $totalStake \n"
}

#Function for luckiest or unluckiest day
function luckydayornot()
{
	printf "your Stakes: $totalStake \n"

	maximumValue=$(printf "%s\n" ${Dictionary[@]} | sort -n | tail -1 )
	minimumValue=$(printf "%s\n" ${Dictionary[@]} | sort -n | head -1 )

	printf "maximumValue: $maximumValue \n"
	printf "minimumValue :$minimumValue \n"

	printf "day: ${!Dictionary[@]}"
	printf "stake: ${Dictionary[@]}"

	for key in ${!Dictionary[@]}
	do
		if [[ ${Dictionary[$key]} -eq $maximumValue ]]
		then
			printf "Luckiest day :$key \n"
		fi

		if [[ ${Dictionary[$key]} -eq $minimumValue ]]
		then
			printf "Unluckiest day :$key \n"
		fi
	done
}

betting
luckydayornot

#Like to continue playing next month or stop Gambling
if [ $totalStake -gt 0 ]
then
	read -p "do you want to countinue 1.Yes 2.No :" toCountinue
	if [ $toCountinue -eq 1 ]
	then
		betting
		luckydayornot
	else
		printf "Game Over \n"
	fi
fi
