# Bash Shell Scripting: Day 8 - Loops

## Introduction

This module covers loops in Bash shell scripting. Loops are essential constructs for performing repetitive tasks in scripts. They allow you to execute a block of code multiple times, making your scripts more efficient and reducing code duplication.

## Types of Loops in Bash

Bash provides several types of loops, each with its own use case and syntax.

## For Loop

The `for` loop is used to iterate over a list of items or a range of values.

### Basic For Loop Syntax

```bash
for variable in list
do
    # Commands to execute for each item
done
```

### Example: Iterating Through a List

```bash
#!/bin/bash

for i in 1 2 "3" "004" 5 6 7 8 9 10
do
    echo "number is $i"
done
```

**Output:**
```
number is 1
number is 2
number is 3
number is 004
number is 5
number is 6
number is 7
number is 8
number is 9
number is 10
```

### For Loop with Range

You can use brace expansion to create a range of numbers:

```bash
#!/bin/bash

for i in {1..20}
do
    echo "number is $i"
done
```

**Output:**
```
number is 1
number is 2
...
number is 20
```

### Reading from a File

For loops are commonly used to process each line or word in a file:

```bash
#!/bin/bash

file="/home/kushkumarkashyap7280/Desktop/shell scripting/day_008/name.txt"

for name in $(cat "$file")
do
    echo "Name is $name"
done
```

**Output:**
```
Name is kush
Name is kumar
Name is kashyap
Name is king
Name is kong
```

## While Loop

The `while` loop executes a block of code as long as a specified condition is true.

### Basic While Loop Syntax

```bash
while [ condition ]
do
    # Commands to execute while condition is true
done
```

### Example: Counter with While Loop

```bash
#!/bin/bash

count=0
num=10

while [ $count -le $num ]
do
    echo "count now is : $count"
    let count++
done
```

**Output:**
```
count now is : 0
count now is : 1
count now is : 2
...
count now is : 10
```

## Until Loop

The `until` loop executes a block of code until a specified condition becomes true (opposite of while loop).

### Basic Until Loop Syntax

```bash
until [ condition ]
do
    # Commands to execute until condition becomes true
done
```

### Example: Countdown with Until Loop

```bash
#!/bin/bash

a=10

until [ $a -eq 1 ]
do
    echo " num is $a"
    let a--
done
```

**Output:**
```
 num is 10
 num is 9
 num is 8
...
 num is 2
```

## Infinite Loop

An infinite loop continues indefinitely until forced to stop (with Ctrl+C or another mechanism):

```bash
#!/bin/bash

while true
do
    echo " time is : $(date +"%Y-%m-%d %H:%M:%S") "
    sleep 2s
done
```

This loop will display the current date and time every 2 seconds indefinitely.

## Loop Control Statements

### Break Statement

The `break` statement is used to exit a loop prematurely:

```bash
for i in {1..10}
do
    if [ $i -eq 5 ]
    then
        break  # Exit the loop when i equals 5
    fi
    echo "Number: $i"
done
```

### Continue Statement

The `continue` statement skips the rest of the current iteration and proceeds to the next iteration:

```bash
for i in {1..10}
do
    if [ $i -eq 5 ]
    then
        continue  # Skip the rest of the loop when i equals 5
    fi
    echo "Number: $i"
done
```

## Nested Loops

You can place one loop inside another to create nested loops:

```bash
#!/bin/bash

for i in {1..3}
do
    echo "Outer loop: $i"
    for j in {1..3}
    do
        echo "  Inner loop: $j"
    done
done
```

**Output:**
```
Outer loop: 1
  Inner loop: 1
  Inner loop: 2
  Inner loop: 3
Outer loop: 2
  Inner loop: 1
  Inner loop: 2
  Inner loop: 3
Outer loop: 3
  Inner loop: 1
  Inner loop: 2
  Inner loop: 3
```

## C-Style For Loop

Bash also supports C-style for loops:

```bash
#!/bin/bash

for ((i=1; i<=5; i++))
do
    echo "Number: $i"
done
```

**Output:**
```
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
```

## Practical Examples

### Example 1: Process Multiple Files

```bash
#!/bin/bash

for file in *.txt
do
    echo "Processing $file..."
    # Add your file processing commands here
    wc -l "$file"  # Count lines in each file
done
```

### Example 2: Wait for User Input

```bash
#!/bin/bash

while true
do
    read -p "Enter a command (type 'exit' to quit): " cmd
    
    if [ "$cmd" = "exit" ]
    then
        break
    fi
    
    eval "$cmd"  # Execute the entered command
done
```

### Example 3: Backup Script

```bash
#!/bin/bash

src_dir="/path/to/source"
backup_dir="/path/to/backup"
date_stamp=$(date +"%Y-%m-%d")

# Create backup directory if it doesn't exist
[ -d "$backup_dir" ] || mkdir -p "$backup_dir"

for file in "$src_dir"/*
do
    if [ -f "$file" ]  # Check if it's a regular file
    then
        filename=$(basename "$file")
        cp "$file" "$backup_dir/${filename}_${date_stamp}"
        echo "Backed up: $filename"
    fi
done
```

## Best Practices

1. **Always initialize your loop variables** before using them
2. **Use meaningful variable names** to make your code more readable
3. **Avoid infinite loops** without a clear exit condition
4. **Include proper error handling** within loops
5. **Consider performance** for large datasets; loops in Bash can be slow
6. **Test your loops** with small datasets before scaling up

## Practice Exercises

1. Create a script that prints all even numbers between 1 and 20 using a for loop
2. Develop a script that counts words in each line of a text file
3. Implement a menu system using a while loop with various options
4. Write a script to find and count files by extension in a directory structure

## Next Steps

- Functions for code reusability
- Error handling and debugging techniques
- Advanced file operations and text processing

---

Mastering loops in shell scripting is essential for efficient automation and enhancing script capabilities.