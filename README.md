# Password Generator

Password generator with different values that can be modify, made by [@Pheithar](https://github.com/Pheithar), using basic *shell script*.

The password is generated using the bash variable **$RANDOM**.

## Usage

To generate a password, execute the script ***passwordGenerator.sh*** in one of the following ways:

```shell
bash passwordGenerator.sh
```
or
```shell
chmod +x passwordGenerator.sh
./passwordGenerator.sh
```

## Flags

The flags of the program are the following:

* ``` -h | --help ```: Opens the 'help' panel.
* ``` -l=LENGHT | --lenght=LENGHT ```: Change the number of characters of the password to LENGHT. Default value is **14 characters**.
* ``` -o=FILE | --output=FILE ```: Save the password in FILE.
* ``` -s | --silent ```: Do not display the password via the terminal.
* ``` -lc(=BOOL) | --lowercase(=BOOL) ```: Set the appearance of lowercase letters to BOOL, that must be true or false. Default value is true.
* ``` -c(=BOOL) | --capital(=BOOL) ```: Set the appearance of capital letters to BOOL, that must be true or false. Default value is true".
* ``` -n(=BOOL) | --number(=BOOL) ```: Set the appearance of numbers to BOOL, that must be true or false. Default value is true".
* ``` -sy(=BOOL) | --symbol(=BOOL) ```: Set the appearance of symbols to BOOL, that must be true or false. Default value is false".

The words in capital letters must be changed to the desired value, and the parts between parenthesis are optional.
