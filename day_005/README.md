# Bash Shell Scripting: Day 5 - User Interaction & Input

## Introduction

Welcome to Day 5 of our Bash shell scripting journey! Today we explore user interaction in shell scripts. The ability to accept and process user input is what transforms static scripts into dynamic, interactive tools that can adapt to different scenarios and user needs.

## Reading User Input in Bash

### Basic Input with `read`

The simplest way to get input from a user is with the `read` command:

```bash
#!/bin/bash

# How to get input from user?
echo " enter you name :"
read name
echo " welcome $name ! to linux "
```

**Output:**
```
enter you name :
kush kumar
welcome kush kumar ! to linux 
```

The `read` command pauses script execution and waits for user input. When the user types something and presses Enter, that value is stored in the variable specified (in this case, `name`).

### Prompting on the Same Line

For a more compact user experience, you can use the `-p` option with `read` to display a prompt and get input on the same line:

```bash
# Another way for same line input
read -p "enter your age : " age
echo " your age is : $age"
```

**Output:**
```
enter your age : 19
your age is : 19
```

## Advanced Input Techniques

### Multiple Inputs at Once

You can read multiple values in a single command:

```bash
read -p "Enter your first and last name: " first_name last_name
echo "Hello, $first_name $last_name!"
```

The first word entered goes into `first_name`, and the second goes into `last_name`. Any additional words go into the last variable.

### Reading Passwords (Hidden Input)

For sensitive information like passwords, use the `-s` (silent) option to hide what the user types:

```bash
read -sp "Enter your password: " password
echo  # Add a newline after input
echo "Password received"
```

### Setting a Timeout for Input

To prevent a script from waiting indefinitely, use the `-t` option followed by the number of seconds to wait:

```bash
read -t 5 -p "You have 5 seconds to answer: " answer
if [[ -z "$answer" ]]; then
    echo "Too slow!"
else
    echo "You said: $answer"
fi
```

### Reading a Limited Number of Characters

The `-n` option limits input to a specified number of characters:

```bash
read -n 1 -p "Press Y or N: " choice
echo
case "$choice" in
    [Yy]) echo "You selected Yes" ;;
    [Nn]) echo "You selected No" ;;
    *) echo "Invalid choice" ;;
esac
```

### Setting a Default Value

If a user presses Enter without typing anything, you can provide a default value:

```bash
read -p "Enter your name [Guest]: " name
name=${name:-Guest}  # Use "Guest" if name is empty
echo "Hello, $name!"
```

## Practical Examples

### Example 1: Basic User Information Form

```bash
#!/bin/bash

echo "===== User Information ====="
read -p "Enter your name: " name
read -p "Enter your age: " age
read -p "Enter your location: " location

echo
echo "Summary:"
echo "Name: $name"
echo "Age: $age"
echo "Location: $location"
echo "Thank you for providing your information!"
```

### Example 2: Simple Menu System

```bash
#!/bin/bash

echo "===== File Operations Menu ====="
echo "1. List files"
echo "2. Check disk space"
echo "3. Show current directory"
echo "4. Exit"
read -p "Enter your choice (1-4): " choice

case "$choice" in
    1) ls -la ;;
    2) df -h ;;
    3) pwd ;;
    4) echo "Exiting..."; exit 0 ;;
    *) echo "Invalid option" ;;
esac
```

## Validating User Input

Always validate user input before using it in your scripts:

```bash
#!/bin/bash

read -p "Enter a number: " num

# Check if input is a number
if [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "You entered the number: $num"
else
    echo "Error: '$num' is not a valid number"
    exit 1
fi
```

## Common Issues and Best Practices

1. **Always validate input** - Never trust user input without checking it first
2. **Provide clear prompts** - Tell users exactly what kind of input you expect
3. **Handle empty inputs** - Decide what to do if the user doesn't enter anything
4. **Consider using default values** - Make your scripts more user-friendly
5. **Add timeouts when appropriate** - Prevent scripts from waiting indefinitely
6. **Use silent mode for sensitive information** - Hide passwords and other sensitive data

## Exercise: Interactive Script

Create a script that:
1. Asks for the user's name and greets them
2. Asks for their favorite programming language
3. Based on their choice, displays a fun fact about that language
4. Asks if they want to learn another fact (Y/N)
5. If Y, repeat steps 2-4; if N, exit with a farewell message

## Next Steps

- Learn how to use command-line arguments to pass values to scripts
- Explore conditional statements to process user input
- Understand error handling for invalid user inputs

---

User interaction is what makes shell scripts truly powerful and flexible. By mastering these techniques, you can create scripts that adapt to user needs and provide a better user experience.
