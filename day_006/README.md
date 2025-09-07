# Bash Shell Scripting: Day 6 - Operators

## Introduction

Welcome to Day 6 of our Bash shell scripting journey! Today we explore operators in Bash. Operators are symbols that tell the shell to perform specific mathematical, relational, or logical operations. Understanding operators is essential for creating scripts that can make decisions, perform calculations, and manipulate data.

## Arithmetic Operators

Bash provides several ways to perform arithmetic operations. Let's explore them using simple examples:

### Using the `let` Command

The `let` command is used to perform arithmetic operations and assign the result to a variable:

```bash
#!/bin/bash

# Arithmetic operators in Bash shell
x=10
y=2

let add=$x+$y
let mul=$x*$y
let sub=$x-$y
let div=$x/$y

echo "addition of x and y is : $add"
echo "subtraction of x and y is : $sub"
echo "multiplication of x and y is : $mul"
echo "division of x and y is : $div"
```

**Output:**
```
addition of x and y is : 12
subtraction of x and y is : 8
multiplication of x and y is : 20
division of x and y is : 5
```

### Using Double Parentheses

Another common way to perform arithmetic operations is using the double parentheses syntax `$(())`:

```bash
# Another way without needing a third variable
echo "addition of x and y is : $(($x+$y))"
```

This approach is often preferred for simple calculations where you don't need to store the result.

### Complete List of Arithmetic Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `+` | Addition | `$a + $b` |
| `-` | Subtraction | `$a - $b` |
| `*` | Multiplication | `$a * $b` |
| `/` | Division | `$a / $b` |
| `%` | Modulus (remainder) | `$a % $b` |
| `**` | Exponentiation | `$a ** $b` |
| `++` | Increment | `$a++` |
| `--` | Decrement | `$a--` |

### Additional Arithmetic Operations

```bash
# Modulus (remainder)
echo "Remainder when x is divided by y: $(($x % $y))"

# Exponentiation (x raised to power y)
echo "x raised to power y: $(($x ** $y))"

# Increment/decrement
a=5
echo "Original value: $a"
let a++
echo "After increment: $a"
let a--
echo "After decrement: $a"
```

## Relational Operators

Relational operators compare values and return true or false. These are typically used in conditional statements.

### Numeric Comparisons

```bash
#!/bin/bash

x=10
y=20

# Equal to
if [ $x -eq $y ]; then
    echo "x is equal to y"
else
    echo "x is not equal to y"
fi

# Not equal to
if [ $x -ne $y ]; then
    echo "x is not equal to y"
fi

# Greater than
if [ $x -gt $y ]; then
    echo "x is greater than y"
else
    echo "x is not greater than y"
fi

# Less than
if [ $x -lt $y ]; then
    echo "x is less than y"
fi

# Greater than or equal to
if [ $x -ge $y ]; then
    echo "x is greater than or equal to y"
else
    echo "x is less than y"
fi

# Less than or equal to
if [ $x -le $y ]; then
    echo "x is less than or equal to y"
fi
```

### Complete List of Relational Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `-eq` | Equal to | `[ $a -eq $b ]` |
| `-ne` | Not equal to | `[ $a -ne $b ]` |
| `-gt` | Greater than | `[ $a -gt $b ]` |
| `-lt` | Less than | `[ $a -lt $b ]` |
| `-ge` | Greater than or equal to | `[ $a -ge $b ]` |
| `-le` | Less than or equal to | `[ $a -le $b ]` |

## Logical Operators

Logical operators combine multiple conditions:

```bash
#!/bin/bash

age=25
income=50000

# AND operator
if [ $age -gt 18 ] && [ $income -gt 30000 ]; then
    echo "Person is an adult with good income"
fi

# OR operator
if [ $age -lt 18 ] || [ $income -lt 30000 ]; then
    echo "Person is either young or has lower income"
else
    echo "Person is an adult with good income"
fi

# NOT operator
if ! [ $age -lt 18 ]; then
    echo "Person is not under 18"
fi
```

### Complete List of Logical Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `&&` | Logical AND | `[ condition1 ] && [ condition2 ]` |
| `||` | Logical OR | `[ condition1 ] || [ condition2 ]` |
| `!` | Logical NOT | `! [ condition ]` |

## String Operators

Bash also provides operators for string comparisons:

```bash
#!/bin/bash

str1="hello"
str2="world"

# Equal
if [ "$str1" = "$str2" ]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi

# Not equal
if [ "$str1" != "$str2" ]; then
    echo "Strings are not equal"
fi

# String is empty
if [ -z "$str1" ]; then
    echo "String is empty"
else
    echo "String is not empty"
fi

# String is not empty
if [ -n "$str1" ]; then
    echo "String is not empty"
fi
```

### Complete List of String Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `=` | Equal | `[ "$a" = "$b" ]` |
| `!=` | Not equal | `[ "$a" != "$b" ]` |
| `-z` | String is empty | `[ -z "$a" ]` |
| `-n` | String is not empty | `[ -n "$a" ]` |
| `<` | Less than (ASCII) | `[[ "$a" < "$b" ]]` |
| `>` | Greater than (ASCII) | `[[ "$a" > "$b" ]]` |

## File Test Operators

These operators are used to test various attributes of files:

```bash
#!/bin/bash

file="example.txt"

# Check if file exists
if [ -e "$file" ]; then
    echo "File exists"
fi

# Check if file is a regular file
if [ -f "$file" ]; then
    echo "It's a regular file"
fi

# Check if file is a directory
if [ -d "$file" ]; then
    echo "It's a directory"
fi

# Check if file is readable
if [ -r "$file" ]; then
    echo "File is readable"
fi

# Check if file is writable
if [ -w "$file" ]; then
    echo "File is writable"
fi

# Check if file is executable
if [ -x "$file" ]; then
    echo "File is executable"
fi
```

### Complete List of File Test Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `-e` | File exists | `[ -e $file ]` |
| `-f` | Regular file | `[ -f $file ]` |
| `-d` | Directory | `[ -d $file ]` |
| `-s` | File is not empty | `[ -s $file ]` |
| `-r` | File is readable | `[ -r $file ]` |
| `-w` | File is writable | `[ -w $file ]` |
| `-x` | File is executable | `[ -x $file ]` |

## Assignment Operators

These operators assign values to variables:

```bash
#!/bin/bash

a=10

# Add and assign
a+=5
echo "a = $a"  # For strings, this concatenates

# With let or (( )) for arithmetic
let "a+=5"     # a = a + 5
echo "a = $a"  # Now a = 20
```

## Practical Examples

### Example 1: Simple Calculator

```bash
#!/bin/bash

read -p "Enter first number: " num1
read -p "Enter second number: " num2
read -p "Enter operation (+, -, *, /): " op

case $op in
    +) result=$(($num1 + $num2)) ;;
    -) result=$(($num1 - $num2)) ;;
    *) result=$(($num1 * $num2)) ;;
    /) result=$(($num1 / $num2)) ;;
    *) echo "Invalid operation"; exit 1 ;;
esac

echo "$num1 $op $num2 = $result"
```

### Example 2: File Properties Checker

```bash
#!/bin/bash

read -p "Enter a file path: " file_path

if [ -e "$file_path" ]; then
    echo "File exists"
    
    if [ -f "$file_path" ]; then
        echo "It's a regular file"
    elif [ -d "$file_path" ]; then
        echo "It's a directory"
    fi
    
    if [ -r "$file_path" ]; then echo "Readable: Yes"; else echo "Readable: No"; fi
    if [ -w "$file_path" ]; then echo "Writable: Yes"; else echo "Writable: No"; fi
    if [ -x "$file_path" ]; then echo "Executable: Yes"; else echo "Executable: No"; fi
else
    echo "File does not exist"
fi
```

## Exercise: Using Operators

1. Write a script that asks the user for two numbers and performs all arithmetic operations on them.
2. Create a script that checks if a number is positive, negative, or zero.
3. Write a script that verifies if a given file exists, is readable, and contains data.

## Next Steps

- Learn about control structures (if-else, loops)
- Explore functions for code reusability
- Understand error handling techniques

---

Operators are the building blocks for creating logic in your shell scripts. Mastering them allows you to write more powerful and flexible scripts that can make decisions and perform calculations.
