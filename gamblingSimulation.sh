#!/bin/bash -x

printf "Welcome to Gambling Simulation \n"

STAKE=100
BET=1
BetAmount=$STAKE

function betting()
{
	Number=$((RANDOM%2))

	if [[ $Number -eq 1 ]]
	then
		echo "you won 1 bet"
		((BetAmount++))
	else
		echo "you loose 1 bet"
		((BetAmount--))
	fi
	echo $BetAmount
}
betting
