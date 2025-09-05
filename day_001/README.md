# Bash Shell Scripting: Day 1 - Getting Started

## Introduction

Welcome to Day 1 of Bash Shell Scripting. This guide introduces the fundamental concepts of shell scripting in Linux environments, providing you with the essential knowledge to begin automating tasks through scripting.

## What is Shell Scripting?

Shell scripting is a powerful method for automating tasks in Unix/Linux environments. A shell script is a text file containing a sequence of commands that the shell interpreter executes. These scripts allow system administrators and developers to:

- Automate repetitive tasks
- Perform system maintenance
- Process text and files efficiently
- Create custom command-line utilities

## Environment Setup

### Prerequisites
- Access to a Linux/Unix environment (Ubuntu, WSL, macOS Terminal, etc.)
- Basic understanding of command-line operations
- A text editor (nano, vim, VS Code, etc.)

### Creating Your First Script

1. **Open Your Terminal**
   ```bash
   # No command needed - just access your terminal application
   ```

2. **Create a New Script File**
   ```bash
   touch hello.sh
   ```

3. **Open the File in Your Preferred Editor**
   ```bash
   nano hello.sh   # For beginners (easier)
   # OR
   vim hello.sh    # More powerful but steeper learning curve
   ```

4. **Add the Following Content**
   ```bash
   #!/bin/bash
   
   # My first shell script
   echo "Hello, World!"
   echo "Today is $(date)"
   echo "My username is $USER"
   ```

   > Note: The first line (`#!/bin/bash`) is called a "shebang" and tells the system which interpreter to use.

5. **Save and Exit**
   - In nano: `Ctrl+O`, then `Enter`, then `Ctrl+X`
   - In vim: Press `Esc`, type `:wq`, then press `Enter`

6. **Make the Script Executable**
   ```bash
   chmod +x hello.sh
   ```

   > **Understanding `chmod +x`**
   > 
   > - `chmod` = change mode (used to change file permissions)
   > - `+x` = add execute permission
   > 
   > By default, new files have only read/write permissions:
   > ```bash
   > $ ls -l hello.sh
   > -rw-r--r--  1 user  group  45 Sep 5 18:00 hello.sh
   > ```
   > 
   > Here:
   > - `rw-` = read/write permissions for owner
   > - `r--` = read-only for group and others
   > - No `x` means not executable
   > 
   > After `chmod +x`:
   > ```bash
   > $ ls -l hello.sh
   > -rwxr-xr-x  1 user  group  45 Sep 5 18:00 hello.sh
   > ```
   > 
   > Now the file has execute permission and can be run as a program.

7. **Execute Your Script**
   ```bash
   ./hello.sh
   ```
   
   > **Different Ways to Run Scripts**
   > 
   > 1. `./hello.sh`
   >    - Runs the file as a program
   >    - Requires execute permission (`chmod +x`)
   >    - Uses the interpreter declared in the shebang line (`#!/bin/bash`)
   >    - The `./` tells Linux to look in the current directory
   > 
   > 2. `bash hello.sh`
   >    - Runs the script with bash interpreter directly
   >    - Works even if file doesn't have execute permission
   >    - Ignores the shebang line
   > 
   > Without `./`, Linux only looks in the system PATH (directories like `/usr/bin/`, `/usr/local/bin/`).
   > This is why DevOps engineers typically use `chmod +x` once, then run scripts with `./script.sh`.

## Key Concepts

### Comments in Bash Scripts

Comments help make your code more readable and maintainable:

```bash
#!/bin/bash

# This is a single-line comment
echo "Hello" # Comments can also appear after code

# Multi-line comments can be created using the "here document" syntax:
<< COMMENT_BLOCK
This is a multi-line comment.
It can span multiple lines.
The shell ignores everything between the markers.
COMMENT_BLOCK

# Real example:
<< comment
This script demonstrates
different types of
comments in Bash
comment

# The code below executes normally
for i in {1..5}; do
    echo "number $i"
done
```

Output:
```
number 1
number 2
number 3
number 4
number 5
```

> **Tip**: Good commenting practices include explaining WHY something is done rather than WHAT is done (which should be clear from the code itself).

### Variables and Data Types

Variables store data that can be referenced and manipulated in a script:

```bash
# Variable assignment (no spaces around =)
name="Developer"
age=25

# Using variables
echo "Hello, $name!"
echo "You are $age years old."
```

### Working with Command Output

You can capture and use the output of commands:

```bash
# Method 1: Command Substitution with $()
current_dir=$(pwd)
echo "You are in: $current_dir"

# Method 2: Command Substitution with backticks (legacy)
user_count=`who | wc -l`
echo "Number of logged-in users: $user_count"
```

### Control Structures

#### Conditional Statements

```bash
#!/bin/bash

# If-else example
if [ "$USER" == "root" ]; then
    echo "You are running as root. Be careful!"
else
    echo "You are running as $USER"
fi
```

#### Loops

```bash
#!/bin/bash

# For loop example
echo "Counting from 1 to 5:"
for i in {1..5}; do
    echo "Number: $i"
done

# While loop example
echo "Countdown:"
count=3
while [ $count -gt 0 ]; do
    echo "$count..."
    count=$((count-1))
    sleep 1
done
echo "Go!"
```

## Editor Comparison: vim vs. nano

### Vim
Vim is a powerful, modal text editor with a steep learning curve but offers extensive capabilities.

**Basic Commands:**
- `i` - Enter insert mode
- `Esc` - Return to normal mode
- `:w` - Save file
- `:q` - Quit
- `:wq` - Save and quit
- `:q!` - Quit without saving
- `dd` - Delete line
- `yy` - Copy line
- `p` - Paste
- `/pattern` - Search for pattern

### Nano
Nano is a simple, user-friendly editor ideal for beginners.

**Basic Commands:**
- `Ctrl+O` - Save file
- `Ctrl+X` - Exit
- `Ctrl+K` - Cut line
- `Ctrl+U` - Paste
- `Ctrl+W` - Search
- `Ctrl+G` - Help

## Best Practices

1. **Always include a shebang line** (`#!/bin/bash`) at the beginning
2. **Comment your code** thoroughly
3. **Use meaningful variable names**
4. **Test your scripts** in a safe environment before using in production
5. **Handle errors** appropriately
6. **Use proper indentation** for readability

## Next Steps

Now that you've created your first script, try:
- Creating scripts to automate daily tasks
- Exploring more complex control structures
- Learning about command-line arguments
- Studying file operations and text processing

## Resources

- [GNU Bash Manual](https://www.gnu.org/software/bash/manual/)
- [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/)
- [Advanced Bash-Scripting Guide](https://tldp.org/LDP/abs/html/)
