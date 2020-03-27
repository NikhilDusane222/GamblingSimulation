#!/bin/bash -x

printf "Welcome to Gambling Simulation \n"

#constants
STAKE=100
BET=1
DAYS=20

#variable
totalWin=0
totalLoss=0
count=0

BetAmount=$STAKE

#Function for bet win or loose
function betting()
{
	for (( count=1; count<=$DAYS; count++ ))
	do
      BetAmount=100
      totalWin=0
      totalLoss=0
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
		else
			totalLoss=$(($STAKE-$minLimit))
		fi
		echo "day: $count  Amount: $BetAmount  Win: $totalWin  Loss:$totalLoss"
done
}
betting

#function for maximum and mininmum limit
function Limit()
{
	maxLimit=$(($BetAmount+$BetAmount*50/100))
	minLimit=$(($BetAmount-$BetAmount*50/100))
}
Limit
