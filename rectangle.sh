#!/bin/bash

#Student Name: Tri Luong Tu
#Student Number:10368774

#Require

#Obtain the dimensions of rectangles from a rectangle.txtfile and output these to a formatted file named rectangle_f.txt.
  
#Create if function to check rectangle_f.txt file is exist or not(if it is exist then delete it)
if [ -f rectangle_f.txt ] ; then
    rm rectangle_f.txt
fi

#Create if function to check rectangle.txt is exits or not
if ! [ -f rectangle.txt ] ; then
    echo "The rectangle.txt file is not found. Please try again!"
    exit 0
else
    #Using sed -e 's/../../g'\ to create multiple agrument lines 
    #1-Delete the first line in txt file
    #2-Add Name: at begin of every lines in file
    #3-Replace 4th Comma in every lines by Colour: 
    #4-Replace 3rd Comma in every lines by Area:
    #5-Replace 2nd Comma in every lines by Width:
    #6-Replace 1st Comma in every lines by Height:
    #7-Search 2 matching group:Group 1(one of any alphabet letter next to one of any digit), Group2(one of any capital alphabet letter)
    #then return group1 and group2 with space(5) between them
    #8-  //  Group 1(one alphabet letter next to 2 digits), Group2(one capital alphabet letter)
    #9-  //  Group 1(5 digits), Group2(one capital alphabet letter) (Extra: if number have 5 digits)
    #10- // Group 1(4 digits), Group2(one capital alphabet letter)
    #11- // Group 1(3 digits), Group2(one capital alphabet letter)
    #12- // Group 1(2 digits), Group2(one capital alphabet letter)
    #13- // Group 1(1 digits), Group2(one capital alphabet letter) then Create rectangle_f.txt file and write all output to it. 
    sed -e '1d' \
    -e 's/^/Name: /g' \
    -e 's/,/Colour: /4' \
    -e 's/,/Area: /3' \
    -e 's/,/Width: /2' \
    -e 's/,/Height: /1' \
    -r -e 's/([a-z][0-9])([A-Z])/\1     \2/g' \
    -r -e 's/([a-z][0-9][0-9])([A-Z])/\1    \2/g' \
    -r -e 's/([0-9][0-9][0-9][0-9][0-9])([A-Z])/\1 \2/g' \
    -r -e 's/([0-9][0-9][0-9][0-9])([A-Z])/\1  \2/g' \
    -r -e 's/([0-9][0-9][0-9])([A-Z])/\1   \2/g' \
    -r -e 's/([0-9][0-9])([A-Z])/\1    \2/g' \
    -r -e 's/([0-9])([A-Z])/\1     \2/g' rectangle.txt > rectangle_f.txt
fi

