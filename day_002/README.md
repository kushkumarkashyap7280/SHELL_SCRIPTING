# Bash Shell Scripting: Day 2 - Variables

## Introduction

On Day 2, we explore variables in Bash shell scripting. Variables allow you to store and manipulate data within your scripts, making them more dynamic and reusable.

## What are Variables in Bash?

Variables in Bash are used to store data that can be referenced and manipulated throughout your script. Unlike in many programming languages, Bash variables:
- Don't need to be declared before use
- Don't have specific data types (all values are stored as strings by default)
- Are case-sensitive (`name` and `NAME` are different variables)

## Basic Variable Usage

### Creating and Assigning Variables

```bash
#!/bin/bash

# Variables in shell
name=kush
age=20

echo "my name is $name and age is $age"

# Note: these are constant variables

# Change variable value
name=kumar
age=30

echo "my name is $name and age is $age"
```

Output:
```
my name is kush and age is 20
my name is kumar and age is 30
```

> **Important**: There should be no spaces around the equals sign when assigning values to variables.
> 
> Correct: `name=kush`  
> Incorrect: `name = kush`

### Reassigning Variables

As shown in the example above, you can change the value of a variable at any time in your script by simply assigning a new value to it. Unlike some programming languages, Bash variables don't need to be declared with a specific type, and they can be reassigned freely.

```bash
counter=1
echo "Counter: $counter"

counter=2
echo "Counter: $counter"

counter="Hello"  # You can even change the type of data
echo "Counter: $counter"
```

## Variable Naming Rules

1. **Valid Characters**: Letters, numbers, and underscores
2. **First Character**: Must be a letter or underscore (not a number)
3. **Case-Sensitive**: `name` and `NAME` are different variables
4. **No Spaces**: Use underscores for multi-word variables (e.g., `first_name`)
5. **Reserved Words**: Avoid using Bash keywords like `if`, `then`, `else`, etc.

## Accessing Variable Values

To access the value of a variable, prefix it with a dollar sign (`$`):

```bash
name="John"
echo $name     # Prints: John
echo "$name"   # Also prints: John (recommended for strings)
echo "${name}" # Also prints: John (required for complex cases)
```

### Curly Braces Usage

Curly braces `${}` are used to clearly define the variable name boundaries:

```bash
fruit="apple"
echo "I like ${fruit}s"  # Prints: I like apples
echo "I like $fruits"    # Prints: I like (because $fruits is a different variable)
```

## Variable Types and Scope

### Local Variables
Variables that are only accessible within the current shell or script.

### Environment Variables
Variables that are available to any child process of the shell.
```bash
export NAME="John"  # Now child processes can access NAME
```

### Shell Variables
Special variables used by the shell itself:
```bash
echo $HOME      # User's home directory
echo $PWD       # Current working directory
echo $USER      # Current username
echo $HOSTNAME  # Host name
echo $RANDOM    # Random number
echo $PATH      # Executable search path
```

## Constants vs. Variables

By convention, constants (variables that shouldn't change) are named with all uppercase:

```bash
readonly PI=3.14159
readonly MAX_ATTEMPTS=5

# This will cause an error:
# PI=3.14
```

Using the `readonly` keyword explicitly prevents a variable from being modified.

## Command Substitution

You can store command output in variables:

```bash
hostname=$(hostname)
echo "my system hostname is $hostname"
```

Output:
```
my system hostname is kushlinux
```

This technique allows you to capture the results of commands and use them in your scripts.

```bash
# More examples of command substitution
current_date=$(date)
echo "Today is: $current_date"

# Alternative syntax using backticks (older style)
user_count=`who | wc -l`
echo "Number of logged-in users: $user_count"

# Useful command substitutions
current_user=$(whoami)
file_count=$(ls | wc -l)
uptime_info=$(uptime)
```

## Constants (Readonly Variables)

To create variables that cannot be changed (constants), use the `readonly` keyword:

```bash
#!/bin/bash

# Define a readonly variable (constant)
readonly id=32
echo "id is $id"

# Attempting to change the value will result in an error
id=0  # This will fail with: "id: readonly variable"
echo "id is $id"  # Will still print the original value: 32
```

Output:
```
id is 32
./varibles.sh: line 30: id: readonly variable
id is 32
```

Readonly variables are useful for:
- Configuration values that should not change
- Important constants like API keys or version numbers
- Preventing accidental variable modification

> **Best Practice**: By convention, constants are often named with UPPERCASE letters to distinguish them from regular variables (e.g., `readonly MAX_ATTEMPTS=5`).

## Arithmetic Operations

```bash
a=5
b=10
sum=$((a + b))
echo "Sum: $sum"  # Prints: Sum: 15

# Other operations
echo "Subtraction: $((b - a))"    # 5
echo "Multiplication: $((a * b))" # 50
echo "Division: $((b / a))"       # 2
echo "Modulus: $((b % a))"        # 0
echo "Exponentiation: $((a ** 2))" # 25
```

## Practical Examples

### User Input

```bash
#!/bin/bash
echo "What is your name?"
read name
echo "Hello, $name!"
```

### Default Values

```bash
#!/bin/bash
name=${1:-"Guest"}  # Use first command-line argument or "Guest" if not provided
echo "Hello, $name!"
```

## Exercise: Working with Variables

Create a script that:
1. Defines variables for your name, age, and favorite color
2. Calculates and stores your birth year (approximately) based on the current year and your age
3. Prints a message using all these variables

## Next Steps

- Learn about conditional statements (if/else)
- Explore arrays for storing multiple values
- Understand how to pass arguments to your scripts

---

Now you have a solid understanding of variables in Bash scripting! In the next lesson, we'll explore control structures and logic to make our scripts more powerful.
