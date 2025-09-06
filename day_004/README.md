# Bash Shell Scripting: Day 4 - String Manipulation

## Introduction

Welcome to Day 4 of our Bash shell scripting journey! Today we focus on string manipulation, a crucial skill for processing text data, generating output, and creating dynamic scripts. Bash provides numerous built-in methods for working with strings efficiently.

## String Basics in Bash

Strings in Bash are sequences of characters. They can be defined using single quotes (`'`) or double quotes (`"`).

```bash
# String definition
str1="abcdefghijklmnopqrstuvwxyz"
echo "String is ${str1}"
```

> **Note**: Single quotes (`'`) preserve the literal value of each character, while double quotes (`"`) allow variable interpolation and some escape sequences.

## String Operations

### 1. Finding String Length

To get the length of a string, use the `${#string}` syntax:

```bash
str1="abcdefghijklmnopqrstuvwxyz"
echo "Length of str1 is: ${#str1}"  # Output: 26
```

### 2. Changing Case

Bash provides easy ways to convert strings to uppercase or lowercase:

```bash
# Convert to uppercase
echo "Uppercase: ${str1^^}"  # Output: ABCDEFGHIJKLMNOPQRSTUVWXYZ

# Convert to lowercase
echo "Lowercase: ${str1,,}"  # Output: abcdefghijklmnopqrstuvwxyz

# Convert first character to uppercase
echo "First character uppercase: ${str1^}"

# Convert only specific letters to uppercase
echo "Convert only 'a' to uppercase: ${str1^^a}"
```

### 3. String Replacement

You can replace parts of a string using pattern substitution:

```bash
# Replace first occurrence
newStr=${str1/abcde/-------}
echo "New string after replacing: ${newStr}"
# Output: -------fghijklmnopqrstuvwxyz

# Replace all occurrences
string="apple apple apple"
echo "${string//apple/orange}"  # Output: orange orange orange

# Replace at beginning
text="hello world"
echo "${text/#hello/hi}"  # Output: hi world

# Replace at end
echo "${text/%world/friend}"  # Output: hello friend
```

### 4. String Slicing (Substring Extraction)

Extract parts of a string using the `${string:position:length}` syntax:

```bash
# Syntax: ${string:start_position:length}
newStr2=${str1:2:5}
echo "After slicing we get: ${newStr2}"  # Output: cdefg

# From position to end
echo "${str1:5}"  # Output: fghijklmnopqrstuvwxyz

# Last 5 characters
echo "${str1: -5}"  # Output: vwxyz
```

## Advanced String Operations

### String Concatenation

```bash
first_name="John"
last_name="Doe"
full_name="$first_name $last_name"
echo "$full_name"  # Output: John Doe

# Alternative method
full_name=$first_name" "$last_name
echo "$full_name"  # Output: John Doe
```

### String Comparison

```bash
string1="apple"
string2="banana"

if [[ "$string1" == "$string2" ]]; then
    echo "Strings are equal"
else
    echo "Strings are not equal"
fi

# Check if string is empty
if [[ -z "$string1" ]]; then
    echo "String is empty"
fi

# Check if string is not empty
if [[ -n "$string1" ]]; then
    echo "String is not empty"
fi

# Lexicographical comparison
if [[ "$string1" < "$string2" ]]; then
    echo "$string1 comes before $string2 alphabetically"
fi
```

### String Search

```bash
sentence="The quick brown fox jumps over the lazy dog"

# Check if substring exists
if [[ "$sentence" == *"fox"* ]]; then
    echo "Fox found in the sentence"
fi

# Check beginning of string
if [[ "$sentence" == "The"* ]]; then
    echo "Sentence starts with 'The'"
fi

# Check end of string
if [[ "$sentence" == *"dog" ]]; then
    echo "Sentence ends with 'dog'"
fi
```

## Practical Examples

### Example 1: Extracting Username from Email

```bash
#!/bin/bash

email="user.name@example.com"

# Extract username (everything before @)
username=${email%%@*}
echo "Username: $username"  # Output: user.name

# Extract domain (everything after @)
domain=${email#*@}
echo "Domain: $domain"  # Output: example.com
```

### Example 2: Cleaning Up Input

```bash
#!/bin/bash

# Remove leading and trailing whitespace
input="   text with spaces   "
trimmed=$(echo "$input" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
echo "Trimmed: '$trimmed'"  # Output: 'text with spaces'

# Convert to lowercase and replace spaces with underscores
clean=$(echo "$trimmed" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')
echo "Clean: $clean"  # Output: text_with_spaces
```

## Exercise: String Manipulation

1. Create a script that takes a sentence as input and:
   - Counts the number of words
   - Converts the first letter of each word to uppercase
   - Replaces all spaces with hyphens

2. Write a function that validates if a given string is a valid email address using string operations and pattern matching.

## Next Steps

- Learn about conditional statements and decision making
- Explore file operations and I/O redirection
- Understand error handling and debugging techniques

---

String manipulation is a fundamental skill in Bash scripting that enables you to process and transform text data efficiently. In the next lesson, we'll explore conditional statements and decision making to add logic to your scripts.
