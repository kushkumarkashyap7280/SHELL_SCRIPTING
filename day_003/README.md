# Bash Shell Scripting: Day 3 - Arrays

## Introduction

On Day 3, we explore arrays in Bash shell scripting. Arrays allow you to store multiple values under a single variable name, making it easier to organize and manipulate collections of data.

## Arrays in Bash

Bash supports two types of arrays:
1. **Indexed Arrays** - Arrays accessed with integer indices (starting from 0)
2. **Associative Arrays** - Key-value pairs (similar to dictionaries or maps in other languages)

## Indexed Arrays

### Creating an Indexed Array

```bash
#!/bin/bash

# Define an array
arr1=(hello ji kese ho 1 2 3 4)

# Alternative syntax
# arr1=("hello" "ji" "kese" "ho" "1" "2" "3" "4")
```

> **Important**: Unlike regular variable assignments, array assignments must NOT have spaces around the equals sign or between the parentheses and their content.
>
> Correct: `arr1=(hello ji kese ho)`  
> Incorrect: `arr1 = (hello ji kese ho)`

### Accessing Array Elements

```bash
# Access individual elements (zero-based indexing)
echo "First element is ${arr1[0]}"    # hello
echo "Second element is ${arr1[1]}"   # ji
echo "Third element is ${arr1[2]}"    # kese

# Access all elements
echo "All values of arr1 is: ${arr1[*]}"
# OR
echo "All values of arr1 is: ${arr1[@]}"
```

### Getting Array Length

```bash
# Get the number of elements in the array
echo "Length of array is ${#arr1[*]}"  # 8
```

### Slicing Arrays (Subarrays)

You can extract a portion of an array using slicing:

```bash
# Syntax: ${array[@]:start_index:count}
echo "Values from index 2 -> 4 are: ${arr1[*]:2:4}"  # kese ho 1 2
```

### Adding Elements to an Array

You can append elements to an existing array:

```bash
# Add more elements to the array
arr1+=(kush is the real coder)

echo "All values in arr1 are: ${arr1[*]}"
# Output: hello ji kese ho 1 2 3 4 kush is the real coder
```

## Associative Arrays

Associative arrays use strings as keys rather than integers, allowing for more meaningful access to array elements.

### Creating an Associative Array

```bash
# Declare an associative array (required)
declare -A arr2

# Initialize the associative array
arr2=([name]=kush [age]=21 [course]="software development")
```

### Accessing Associative Array Elements

```bash
# Access elements by key
echo "Value of key name is: ${arr2[name]}"  # kush

# Access all values
echo "All values in arr2: ${arr2[*]}"  # 21 software development kush
```

### Getting All Keys

```bash
# Get all keys in the associative array
echo "All keys in arr2: ${!arr2[*]}"  # name age course
```

## Practical Example: Working with Arrays

```bash
#!/bin/bash

# Create an array of file extensions to search for
extensions=("txt" "log" "md" "conf")

echo "Looking for files with extensions: ${extensions[*]}"

# Count files for each extension
for ext in "${extensions[@]}"; do
    count=$(find . -name "*.${ext}" | wc -l)
    echo "Found $count files with .$ext extension"
done
```

## Common Array Operations

1. **Looping through arrays**:
   ```bash
   for item in "${arr1[@]}"; do
       echo "Item: $item"
   done
   ```

2. **Removing elements**:
   ```bash
   unset arr1[2]  # Remove the third element
   ```

3. **Checking if a key exists** (associative arrays):
   ```bash
   if [[ -v arr2[name] ]]; then
       echo "Name key exists with value: ${arr2[name]}"
   fi
   ```

4. **Copying arrays**:
   ```bash
   new_array=("${old_array[@]}")
   ```

## Exercise: Array Manipulation

1. Create an array with the names of five countries
2. Print the third country in the list
3. Add two more countries to the array
4. Create an associative array with country names as keys and their capitals as values
5. Print all country-capital pairs in a readable format

## Next Steps

- Learn about functions to organize your code
- Explore file operations and I/O redirection
- Understand error handling and debugging techniques

---

Arrays are powerful tools in Bash scripting that allow you to work with collections of data efficiently. In the next lesson, we'll explore how to create reusable code with functions.
