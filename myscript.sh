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

# USER INPUT - to get user input, use the command read. This command takes the input and will save it into a variable.

read var1
read -p "Enter your name: " USERNAME
echo "Hello $USERNAME, nice to meet you."

# options with read: -p  allows you to specify a prompt and -s which makes the input silent.
# Ask the user for login details
read -p 'Username: ' uservar
read -sp 'Password: ' passvar
echo
echo Thankyou $uservar we now have your login details


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

# WHILE LOOP -  while an expression is true, keep executing these lines of code
while [ <some test> ]
do
  <commands>
done
# e.g. read through line by line
LINE=1
while read -r CURRENT_LINE
  do
    echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "./new-1.txt"
# e.g. print numbers 1 to 10
counter=1 #initialize variable counter with initial value
while [ $counter -le 10 ] # while counter is less than or equal to
do
  echo $counter
  ((counter++)) # using double brackets we can increase the value of counter by 1
done
echo All done

# UNTIL LOOPS - similar to while loop but  will execute the commands within it until the test becomes true
until [ <some test> ]
do
<commands>
done

# FOR LOOPS - for each of the items in a given list, perform the given set of commands.
for var in <list>
do
<commands>
done
# e.g.
names='Stan Kyle Cartman'

for name in $names # For each of the items in the list $names assign the item to the variable $name and do the following commands.
do
  echo $name
done
  echo All done

# Ranges - process a series of numbers
for value in {1..5} # no spaces present between the curly brackets { }. If there are then it will not be seen as a range but as a list of items.
do
  echo $value
done
echo All done  

# Controlling Loops: Break and Continue
# break tells Bash to leave the loop straight away e.g. maybe we are copying files but if the free disk space get's below a certain level we should stop copying.
for value in $1/*
do
  used=$( df $1 | tail -1 | awk '{ print $5 }' | sed 's/%//' )
  if [ $used -gt 90 ]
  then
    echo Low disk space 1>&2
    break
  fi
  cp $value $1/backup/
done
# continue tells Bash to stop running through this iteration of the loop and begin the next iteration.
# e.g. we are using the loop to process a series of files but if we happen upon a file which we don't have the read permission for we should not try to process it.
for value in $1/*
do
  if [ ! -r $value ]
  then
    echo $value not readable 1>&2
    continue
  fi
  cp $value $1/backup/
done

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

# Variable Scope - Scope refers to which parts of a script can see which variables. By default a variable is global(visible everywhere in the script)
# We may also create a variable as a local variable. When we create a local variable within a function, it is only visible within that function. To do that we use the keyword local in front of the variable the first time we set it's value.
# local var_name=<var_value> (good practice to use local variables within functions)


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