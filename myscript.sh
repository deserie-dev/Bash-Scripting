#!/usr/bin/bash

# scripts always start with a shebang(#!) followed by path to shell.To find path run $ which bash
# to make the file executable run $ chmod +x fileName (chmod add executable permission to the following file)

echo Hello World!

# VARIABLES
# Uppercase by convention
# Can use letters, numbers, underscores
NAME="Deserie"
# To refernece a defined variable use $ before variable. 
echo "My name is $NAME"

# USER INPUT
read -p "Enter your name: " USERNAME
echo "Hello $USERNAME, nice to meet you."

# SIMPLE IF STATEMENT
if [ "$NAME" == "Deserie" ]
then
  echo "Your name is Deserie"
fi  

# IF-ELSE
if [ "$NAME" == "Deserie" ]
then
  echo "Your name is Deserie"
else 
  echo "Your name is NOT Deserie"  
fi  

# ELSE-IF (elif)
if [ "$NAME" == "Deserie" ]
then
  echo "Your name is Deserie"
elif [ "$NAME" == "Olivia" ]  
then
  echo "Your name is Olivia"
else 
  echo "Your name is NOT Deserie"  
fi  

# COMPARISON
NUM1=31
NUM2=5
if [ "$NUM1" -gt "$NUM2" ]
then
  echo "$NUM1 is greater than $NUM2"
else
  echo "$NUM1 is less than $NUM2"
fi

########
# val1 -eq val2 Returns true if the values are equal
# val1 -ne val2 Returns true if the values are not equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2
# val1 -lt val2 Returns true if val1 is less than val2
# val1 -le val2 Returns true if val1 is less than or equal to val2
########

# FILE CONDITIONS
FILE="test.txt"
if [ -f "$FILE" ]
then
  echo "$FILE is a file"
else
  echo "$FILE is NOT a file"
fi

########
# -d file   True if the file is a directory
# -e file   True if the file exists (note that this is not particularly portable, thus -f is generally used)
# -f file   True if the provided string is a file
# -g file   True if the group id is set on a file
# -r file   True if the file is readable
# -s file   True if the file has a non-zero size
# -u    True if the user id is set on a file
# -w    True if the file is writable
# -x    True if the file is an executable
########

#CASE STATEMENT
read -p "Are you 21 or over? Y/N " ANSWER
case "$ANSWER" in 
  [yY] | [yY][eE][sS])
    echo "You can have a beer :)"
    ;;
  [nN] | [nN][oO])
    echo "Sorry, no drinking"
    ;;
  *)
    echo "Please enter y/yes or n/no"
    ;;
esac

# SIMPLE FOR LOOP
NAMES="Deserie Zoe Tinashe Mahlia"
for NAME in $NAMES
  do
    echo "Hello $NAME"
done

# FOR LOOP TO RENAME FILES
FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES  
  do
    echo "Renaming $FILE to new-$FILE"
    mv $FILE $NEW-$FILE
done

# WHILE LOOP - READ THROUGH A FILE LINE BY LINE
LINE=1
while read -r CURRENT_LINE
  do
    echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "./new-1.txt"

# FUNCTION
function sayHello() {
  echo "Hello World"
}
sayHello

# FUNCTION WITH PARAMS
function greet() {
  echo "Hello, I am $1 and I am $2"
}

greet "Deserie" "21"

# CREATE FOLDER AND WRITE TO A FILE
mkdir hello
touch "hello/world.txt"
echo "Hello World" >> "hello/world.txt"
echo "Created hello/world.txt"

# ARITHMETIC -
#  using built-in function let
let a=3+3
echo $a # 6

let a++
echo $a #7

let "a = 2 * 5"
echo $a # 10

# var++	Increase the variable var by 1
# var--	Decrease the variable var by 1
# %	Modulus (Return the remainder after division)

# using expr - instead of saving result to a variable like liet, expr prints the answer
expr 5 + 4

# Double Parentheses
# $(( expression )) Return the result of the expression.
a=$(( 4 + 5 ))
echo $a # 9

# Length of a Variable - how many characters - ${#variable}
a='Hello World'
echo ${#a} # 11