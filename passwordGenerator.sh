# !/ bin / bash

#in here will be the password
password=""

#Default lenght is 14
lenght=14

#this is where all the possible characters will be
all=()

#All the letters that will be if lower letters are added
letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z )

#Insert letters
all+=("${letters[@]}")

#All the letters that will be if capital letters are added
c_letters=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

#Insert c_letters
all+=("${c_letters[@]}")

#All the letters that will be if lower letters is added
numbers=(0 1 2 3 4 5 6 7 8 9)

#Insert numbers
all+=("${numbers[@]}")

#All the letters that will be if lower letters is added
symbols=('#' '@' '$' '%' '&' '/' '(' ')' '=' '?' '!' '[' ']' '{' '}' '+' '-' '.' '^' '_' '~')

#Insert symbols
all+=("${symbols[@]}")

#Save in a variable the size of 'all' to get random from that
size=${#all[@]}

for (( i = 0; i < lenght; i++ )); do
  #Get a random number
  rnd=$(( $RANDOM % ($size) ))
  echo $rnd
  password+=${all[$rnd]}
done

echo ${all[@]}
echo $size
echo $password
