# Hosts File Management Script

This repository contains a Windows batch file script for managing the `hosts` file located in the `C:\Windows\System32\drivers\etc\` directory. The script allows you to add, remove, and view entries in the `hosts` file. The script requires administrative privileges to modify the `hosts` file.

## Features

1. **Add URL**: Add a URL to the `hosts` file, redirecting it to `127.0.0.1`.
2. **Remove URL**: Remove a URL entry from the `hosts` file.
3. **Show Hosts File Content**: Display the current content of the `hosts` file.
4. **Exit**: Exit the script.

## Usage

### Running the Script

1. Clone the repository or download the `manage_hosts.cmd` file.
2. Right-click on `manage_hosts.cmd` and select "Run as administrator" to ensure the script has the necessary privileges.

### Script Menu

Upon running the script, you will be presented with the following menu:

================================
Hosts File Management Script
Please choose an option:

Add URL to hosts file
Remove URL from hosts file
Show hosts file content
Exit
Enter your choice (1/2/3/4):


### Options

#### 1. Add URL to Hosts File

- Prompts you to enter a URL to block (e.g., `example.com`).
- Checks if the entry `127.0.0.1 example.com` already exists in the `hosts` file.
- If it does not exist, the entry is added to the `hosts` file.
- Displays a confirmation message.

#### 2. Remove URL from Hosts File

- Prompts you to enter a URL to unblock (e.g., `example.com`).
- Checks if the entry `127.0.0.1 example.com` exists in the `hosts` file.
- If it exists, the entry is removed from the `hosts` file.
- Displays a confirmation message.

#### 3. Show Hosts File Content

- Displays the current content of the `hosts` file.
- Pauses to allow you to read the content before returning to the main menu.

#### 4. Exit

- Exits the script.

## Notes

- Ensure that you run the script with administrative privileges to allow it to modify the `hosts` file.
- The script uses `cmd /c` commands to handle elevated privileges for file operations.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
