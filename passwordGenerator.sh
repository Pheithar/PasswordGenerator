# !/ bin / bash

#in here will be the password
password=""

#Lenght of the password, default is 14
lenght=14

#this is where all the possible characters will be
all=()

#All the letters that will be if lower letters are added
letters=(a b c d e f g h i j k l m n o p q r s t u v w x y z )

#All the letters that will be if capital letters are added
c_letters=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

#All the letters that will be if lower letters is added
numbers=(0 1 2 3 4 5 6 7 8 9)

#All the letters that will be if lower letters is added
symbols=('#' '@' '$' '%' '&' '/' '(' ')' '=' '?' '!' '[' ']' '{' '}' '+' '-' '.' '^' '_' '~')

#File where the password will be printed if output is selected
output=""
silent=false

#By default, the password will have lower and capital letters and numbers, but not symbols
lett=true
c_lett=true
num=true
symb=false

for arg in "$@"
do
    case $arg in
        #Help command
        -h | --help)
          echo "This is a simple bash based password generator"
          echo "The options available are:"
          echo -e "\t -h | --help \t\t\t Opens the 'help' panel."
          echo -e "\t -l | --lenght=LENGHT \t\t Change the number of characters of the password to LENGHT. Default value is 14."
          echo -e "\t -o | --output=FILE \t\t Save the password in FILE."
          echo -e "\t -s | --silent \t\t\t Do not display the password via the terminal."
          echo -e "\t -lc | --lowercase(=BOOL) \t Set the appearance of lowercase letters to BOOL, that must be true or false. Default value is true".
          echo -e "\t -c | --capital(=BOOL) \t Set the appearance of capital letters to BOOL, that must be true or false. Default value is true".
          echo -e "\n -n | --number(=BOOL) \t Set the appearance of numbers to BOOL, that must be true or false. Default value is true".
          echo -e "\n -sy | --symbol(=BOOL) \t Set the appearance of symbols to BOOL, that must be true or false. Default value is false".


          exit 1
          ;;

        #Set lenght
        -l=*|--lenght=*)
          opt="${arg#*=}"

          #Get if is a number what comes with -l
          re='^[0-9]+$'
          if ! [[ $opt =~ $re ]] ; then
             echo "ERROR in $arg: '$opt' is not a number" >&2;
             exit 1
          fi
          #Save the new value for lenght
          lenght=$opt
          ;;

        #Set an output file
        -o=*|--output=*)
          opt="${arg#*=}"

          #Check the file is not ""
          if [[ opt == "" ]]; then
            echo "ERROR in $arg: A path must be declare"
            exit 1
          fi

          output=$opt
          ;;

        #Make silent
        -s|--silent)
          silent=true
          ;;

        #Set lowercase letters true without option
        -lc|--lowercase)
          lett=true
          ;;

        #Set lowercase letters true r false with option
        -lc=*|--lowercase=*)
          opt="${arg#*=}"

          if [[ $opt != true && $opt != false ]]; then
            echo "ERROR in $arg: '$opt' is not 'true' or 'false'" >&2;
            exit 1
          fi
          lett=$opt
          ;;

        #Set capital letters true without option
        -c|--capital)
          c_lett=true
          ;;

        #Set capital letters true r false with option
        -c=*|--capital=*)
          opt="${arg#*=}"

          if [[ $opt != true && $opt != false ]]; then
            echo "ERROR in $arg: '$opt' is not 'true' or 'false'" >&2;
            exit 1
          fi
          c_lett=$opt
          ;;

        #Set numbers true without option
        -n|--number)
          num=true
          ;;

        #Set numbers true r false with option
        -n=*|--number=*)
          opt="${arg#*=}"

          if [[ $opt != true && $opt != false ]]; then
            echo "ERROR in $arg: '$opt' is not 'true' or 'false'" >&2;
            exit 1
          fi
          num=$opt
          ;;

        #Set symbols true without option
        -sy|--symbol)
          symb=true
          ;;

        #Set symbols true r false with option
        -sy=*|--symbol=*)
          opt="${arg#*=}"

          if [[ $opt != true && $opt != false ]]; then
            echo "ERROR in $arg: '$opt' is not 'true' or 'false'" >&2;
            exit 1
          fi
          symb=$opt
          ;;


        #Default error message
        *)
          echo "ERROR: the flag '$arg' was used and it is not supported by this program. Check -h or --help to get the supported flags"
          exit 1
          ;;
    esac
done

if [[ $lett == false && $c_lett == false && $num == false && $symb == false ]]; then
  echo "ERROR: unavailable to create a password whithout any character"
  exit 1
fi

if [[ $lett == true ]]; then
  #Insert letters
  all+=("${letters[@]}")
fi

if [[ $c_lett == true ]]; then
  #Insert c_letters
  all+=("${c_letters[@]}")
fi

if [[ $num == true ]]; then
  #Insert numbers
  all+=("${numbers[@]}")
fi

if [[ $symb == true ]]; then
  #Insert symbols
  all+=("${symbols[@]}")
fi


#Save in a variable the size of 'all' to get random from that
size=${#all[@]}

for (( i = 0; i < lenght; i++ )); do
  #Get a random number
  rnd=$(( $RANDOM % ($size) ))
  password+=${all[$rnd]}
done


if [[ $output != "" ]]; then
  touch $output
  echo $password >> $output
fi

if [[ $silent == false ]]; then
  echo $password
fi
