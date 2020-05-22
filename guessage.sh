#!/bin/bash

#Student Name: Tri Luong Tu
#Student Number:10368774

#Require

#1/ The age should be randomly generated from by a function
#(eg from 20 to 70years old).

#2/ The user should provide the guess through console input

#3/ The user will then be told if the guess is either 
#too high, too low or correct.

#Create colour to add
RED='\033[00;31m'
YELLOW='\033[00;33m'
GREEN='\033[00;32m'
NCOL='\033[0m'

int='^[0-9]+$' #create variable to check input(integer)

#Using while loop to create a input loop until variable is an integer
while true; do
    #Prompt the player to type min age to create a range of random age number
    read -p "Type the minimum age to create guess age game: " minAge

    #Create if function to check variable input(integers only)
    if ! [[ "$minAge" =~ $int ]]; then
        echo -e "${RED}Error: Integer only.${NCOL} Please try again!"
    else
        echo -e "${GREEN}Minimum age accepted."
        #Prompt the player to type max age to create a range of random age number
        read -p -e "${NCOL}Type the maximum age to create guess age game: " maxAge

        #Create if function to check variable input(integers only)
        if ! [[ "$maxAge" =~ $int ]]; then
            echo -e "${RED}Error: Integer only.${NCOL} Please try again!"
        else
            if [[ $minAge -ge $maxAge ]]; then #Make sure minAge not >= maxAge
                echo -e "${RED}Minimum age can not be equal or greater than max age.${NCOL} Try again."
            else
                echo -e "${GREEN}Maximum age accepted."
                break
            fi
        fi
    fi  
done


#Use user input to create random age (by using shuf command)in range minAge-maxAge
age=$( shuf -i $minAge-$maxAge -n 1 )
echo -e "${YELLOW}Random age are created!"

#Using while loop to create a input loop until variable is an integer
while true; do
    #Prompt the player to guess age number in the range they choose
    read -p -e "${NCOL}Type the number of age to guess in range $minAge - $maxAge: " guessAge
    #Create if function to check variable input(integers only, e to exit)
    if [[ "$guessAge" = "e" ]]; then
        echo "The age is $age years old. Good bye!"
        break
    elif ! [[ "$guessAge" =~ $int ]]; then
        echo "Error: Age must be an integer. Please try again!"
    else
        #Create if function to compare variable input(guessAge) with random age
        if [[ $guessAge -gt $age ]]; then
            echo "Too high. Try again!(Press e to exit)"
        elif [[ $guessAge -lt $age ]]; then
            echo "Too low. Try again!(Press e to exit)"
        else
            echo "Correct. The age is $age years old."
            break
        fi
    fi

done