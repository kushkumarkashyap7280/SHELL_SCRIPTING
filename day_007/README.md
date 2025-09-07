# Bash Shell Scripting: Day 7 - Conditional Statements

## Introduction

Welcome to Day 7 of our Bash shell scripting journey! Today we explore conditional statements, which are essential for making decisions in your scripts. Conditional statements allow your scripts to execute different commands based on different conditions, making them more dynamic and powerful.

## If-Else Statements

The `if-else` statement is a fundamental control structure that executes code blocks based on whether a condition is true or false.

### Basic If-Else Syntax

```bash
if [[ condition ]]
then
    # Commands to execute if condition is true
else
    # Commands to execute if condition is false
fi
```

### Example: Pass/Fail Check

```bash
#!/bin/bash

read -p "enter your marks here : " marks

if [[ $marks -gt 33 ]]
then
    echo " you have PASSED the exam congratulations"
else
    echo " sorry you have FAILED "
fi
```

**Output (if marks = 45):**
```
enter your marks here : 45
you have PASSED the exam congratulations
```

**Output (if marks = 30):**
```
enter your marks here : 30
sorry you have FAILED 
```

### If-Elif-Else Statement

For multiple conditions, you can use the `elif` (else if) statement:

```bash
if [[ condition1 ]]
then
    # Commands for condition1
elif [[ condition2 ]]
then
    # Commands for condition2
else
    # Commands if no conditions are true
fi
```

### Example: Age Categories

```bash
#!/bin/bash

read -p " enter your age : " age

if [[ $age -gt 60 ]]
then
    echo " you are a senior citizen "
elif [[ $age -ge 18 && $age -le 60 ]]
then 
    echo " you are an adult "
else
    echo "you are a kid "
fi
```

**Output (if age = 70):**
```
enter your age : 70
you are a senior citizen
```

**Output (if age = 25):**
```
enter your age : 25
you are an adult
```

**Output (if age = 12):**
```
enter your age : 12
you are a kid
```

## Test Conditions in If Statements

### Single vs. Double Brackets

- `[ ]` (single brackets) - POSIX compliant, available in most shells
- `[[ ]]` (double brackets) - Bash-specific, with more features

```bash
# Single bracket
if [ "$a" = "$b" ]
then
    echo "Equal"
fi

# Double bracket (preferred in Bash)
if [[ $a == $b ]]
then
    echo "Equal"
fi
```

### Common Test Operators

For numbers:
- `-eq` - Equal to
- `-ne` - Not equal to
- `-gt` - Greater than
- `-lt` - Less than
- `-ge` - Greater than or equal to
- `-le` - Less than or equal to

For strings:
- `==` - Equal to
- `!=` - Not equal to
- `-z` - String is empty
- `-n` - String is not empty

For files:
- `-e` - File exists
- `-f` - Is a regular file
- `-d` - Is a directory
- `-r` - Is readable
- `-w` - Is writable
- `-x` - Is executable

### Combining Conditions

- `&&` - Logical AND
- `||` - Logical OR
- `!` - Logical NOT

```bash
if [[ $age -ge 18 && $has_id == "yes" ]]
then
    echo "You can enter"
fi

if [[ $age -lt 18 || $has_permission == "yes" ]]
then
    echo "Special case"
fi
```

## Switch Case Statements

The `case` statement is used when you have multiple possible actions based on a single variable. It's cleaner than multiple `if-elif` statements for certain scenarios.

### Basic Case Syntax

```bash
case $variable in
    pattern1)
        # Commands for pattern1
        ;;
    pattern2)
        # Commands for pattern2
        ;;
    *)
        # Default commands (like 'else')
        ;;
esac
```

### Example: Menu System

```bash
#!/bin/bash

echo "Choose option --"
echo " a = to see current date"
echo " b = list all the files in current dir"
echo " c = current location of directory "
read -p "enter option : " choice

case $choice in
    a)date;;
    b)ls;;
    c)
        echo " location of directory is : $(pwd)";;
    *)echo "enter valid choice "
esac
```

**Output (if choice = a):**
```
Choose option --
a = to see current date
b = list all the files in current dir
c = current location of directory 
enter option : a
Mon Sep 7 10:15:23 EST 2025
```

### Pattern Matching in Case

The case statement can use pattern matching:

```bash
case $file in
    *.jpg|*.jpeg|*.png)
        echo "Image file"
        ;;
    *.txt|*.doc)
        echo "Document file"
        ;;
    *)
        echo "Other file type"
        ;;
esac
```

## Nested Conditionals

You can nest if statements inside other if statements:

```bash
if [[ $logged_in == "yes" ]]
then
    if [[ $user_type == "admin" ]]
    then
        echo "Admin access granted"
    else
        echo "User access granted"
    fi
else
    echo "Please log in first"
fi
```

## Practical Examples

### Example 1: File Checker

```bash
#!/bin/bash

read -p "Enter a filename: " filename

if [[ -e $filename ]]
then
    echo "File exists"
    
    if [[ -f $filename ]]
    then
        echo "It's a regular file"
    elif [[ -d $filename ]]
    then
        echo "It's a directory"
    else
        echo "It's another type of file"
    fi
    
    if [[ -r $filename ]]
    then
        echo "File is readable"
    fi
    
    if [[ -w $filename ]]
    then
        echo "File is writable"
    fi
    
    if [[ -x $filename ]]
    then
        echo "File is executable"
    fi
else
    echo "File does not exist"
fi
```

### Example 2: Number Classifier

```bash
#!/bin/bash

read -p "Enter a number: " num

if [[ $num -eq 0 ]]
then
    echo "Zero"
elif [[ $num -gt 0 ]]
then
    if [[ $(($num % 2)) -eq 0 ]]
    then
        echo "Positive even number"
    else
        echo "Positive odd number"
    fi
else
    if [[ $(($num % 2)) -eq 0 ]]
    then
        echo "Negative even number"
    else
        echo "Negative odd number"
    fi
fi
```

### Example 3: Simple Calculator with Case

```bash
#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2
read -p "Enter operation (add/subtract/multiply/divide): " operation

case $operation in
    add)
        result=$(($num1 + $num2))
        ;;
    subtract)
        result=$(($num1 - $num2))
        ;;
    multiply)
        result=$(($num1 * $num2))
        ;;
    divide)
        if [[ $num2 -eq 0 ]]
        then
            echo "Error: Division by zero"
            exit 1
        fi
        result=$(($num1 / $num2))
        ;;
    *)
        echo "Invalid operation"
        exit 1
        ;;
esac

echo "Result: $result"
```

## Best Practices

1. **Always quote variables** in conditions to avoid issues with spaces and special characters
2. **Use double brackets** `[[ ]]` in Bash scripts for better functionality
3. **Indent your code** properly for readability
4. **Test for edge cases** (empty values, zero, etc.)
5. **Use meaningful variable names** and error messages
6. **Keep conditions simple** and break complex logic into smaller parts

## Exercise: Conditional Statements

1. Create a script that checks if a user-provided number is prime or not
2. Write a menu-driven script using case statements that can:
   - Check disk usage
   - List running processes
   - Display system information
   - Exit
3. Create a password validator that checks if a password meets certain criteria (length, special characters, etc.)

## Next Steps

- Learn about loops for repetitive tasks
- Explore functions for code reusability
- Understand file operations and text processing

---

Conditional statements are the foundation of logic in shell scripts. They allow your scripts to make decisions and respond differently based on various conditions, making them truly powerful tools for automation and system administration.
