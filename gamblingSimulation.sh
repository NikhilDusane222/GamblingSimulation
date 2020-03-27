#!/bin/bash -x

printf "Welcome to Gambling Simulation \n"

#constants
STAKE=100
BET=1

#variable
totalWin=0
totalLoss=0
winAmount=0
looseAmount=0

read -p "Enter the days : " DAYS
BetAmount=$STAKE

#Function for bet win or loose
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
		if [[ $BetAmount -eq $maxLimit ]]
		then
			totalWin=$(($maxLimit-$STAKE))
			winAmount=$(($winAmount+$totalWin))
		else
			totalLoss=$(($STAKE-$minLimit))
			looseAmount=$(($looseAmount+50))
		fi
		echo "day: $count  Amount: $BetAmount  Win: $totalWin  Loss:$totalLoss WinAmount:$winAmount LooseAmount:$looseAmount"
	done
}


#function for maximum and mininmum limit
function Limit()
{
	maxLimit=$(($BetAmount+$BetAmount*50/100))
	minLimit=$(($BetAmount-$BetAmount*50/100))
}

betting
Limit
