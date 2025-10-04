# Bash Shell Scripting: Day 9 - Functions

## Introduction

This module covers functions in Bash shell scripting. Functions are essential for creating modular, reusable code that improves script organization and maintainability. They allow you to encapsulate code logic into named blocks that can be called repeatedly throughout your script.

## Function Basics

A function is a block of reusable code designed to perform a specific task. In Bash, there are two primary ways to define functions:

### Function Definition Syntax

```bash
# Method 1: Using the 'function' keyword
function function_name() {
    # Commands
}

# Method 2: Without the 'function' keyword (POSIX compatible)
function_name() {
    # Commands
}
```

Both methods are valid in Bash, but the second form is more portable across different shells.

### Basic Function Example

```bash
#!/bin/bash

# Function definition using 'function' keyword
function myfunc() {
    echo "hello world"
}

# Function call
myfunc
```

### Alternative Syntax Example

```bash
#!/bin/bash

# Function definition without 'function' keyword
hellofunc() {
    echo "kese ho"
}

# Function call
hellofunc
```

## Function Parameters

Functions can accept parameters, which are accessed within the function using positional parameter syntax:

- `$1`, `$2`, etc.: Individual parameters
- `$@`: All parameters as separate words
- `$*`: All parameters as a single word
- `$#`: Number of parameters

### Example: Function with Parameters

```bash
#!/bin/bash

welcome() {
    echo "Your name is: $1"
    echo "Your age is: $2"
}

echo "Enter your name and age:"
read name age

welcome "$name" "$age"
```

## Script Parameters

Similar to function parameters, a Bash script can receive parameters when executed from the command line:

```bash
#!/bin/bash

# Accessing script parameters
echo "variable 1 is: $1"
echo "variable 2 is: $2"
```

When running this script as `./script.sh param1 param2`, the parameters will be accessible using the same positional parameter syntax.

## Return Values and Exit Status

Functions in Bash don't return values like functions in many other programming languages. Instead, they:

1. Return an exit status (0-255) using the `return` statement
2. Output data using `echo` or other commands, which can be captured by the caller

### Example: Return Status

```bash
#!/bin/bash

check_number() {
    if [[ $1 -gt 10 ]]; then
        return 0  # Success (true in Bash)
    else
        return 1  # Failure (false in Bash)
    fi
}

check_number 15
if [[ $? -eq 0 ]]; then
    echo "Number is greater than 10"
else
    echo "Number is not greater than 10"
fi
```

### Example: Capturing Function Output

```bash
#!/bin/bash

get_date() {
    echo $(date +"%Y-%m-%d")
}

today=$(get_date)
echo "Today's date is: $today"
```

## Variable Scope in Functions

By default, variables in Bash are global. A variable defined in a function is accessible outside the function after it has been called.

```bash
#!/bin/bash

my_function() {
    local_var="This is local"  # Global by default
    local scoped_var="This is truly local"  # Local to function
}

my_function
echo $local_var      # Works
echo $scoped_var     # Empty (not accessible)
```

To create a variable that is local to a function, use the `local` keyword.

## Advanced Function Techniques

### Recursive Functions

Functions can call themselves recursively:

```bash
#!/bin/bash

factorial() {
    if [[ $1 -le 1 ]]; then
        echo 1
    else
        local prev=$(factorial $(($1 - 1)))
        echo $(($1 * $prev))
    fi
}

result=$(factorial 5)
echo "Factorial of 5 is: $result"
```

### Function Libraries

You can create a library of functions in a separate file and source it in your scripts:

```bash
# In utils.sh
log_message() {
    echo "[LOG] $(date): $1"
}

# In your main script
source ./utils.sh
log_message "Script started"
```

## Best Practices

1. **Use descriptive function names** that indicate what the function does
2. **Document your functions** with comments describing purpose, parameters, and return values
3. **Use local variables** to prevent unintended side effects
4. **Validate input parameters** to ensure functions are called correctly
5. **Keep functions focused** on doing one task well
6. **Return meaningful exit codes** to indicate success or specific error conditions
7. **Follow consistent naming conventions** for better readability

## Practice Exercises

1. Create a function library with utilities for common operations (logging, file checking, etc.)
2. Write a script with a function that calculates the sum of all numbers from 1 to n
3. Create a function that validates if a string is a valid IP address
4. Write a function that recursively lists all files in a directory structure

## Next Steps

- Advanced script debugging techniques
- Creating Bash scripts for system administration
- Building command-line tools with argument parsing
- Integrating Bash scripts with other programming languages

---

Functions are fundamental building blocks for creating organized, maintainable shell scripts. Mastering them enables you to write more professional, reusable code for complex automation tasks.