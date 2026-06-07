#!/bin/bash

# Function to create a new file
create_file() {
    read -p "Enter the filename to create: " filename
    touch "$filename"
    echo "File '$filename' created successfully."
}

# Function to update a file
update_file() {
    read -p "Enter the filename to update: " filename
    if [ -f "$filename" ]; then
        nano "$filename"
    else
        echo "File '$filename' does not exist."
    fi
}

# Function to delete a file
delete_file() {
    read -p "Enter the filename to delete: " filename
    if [ -f "$filename" ]; then
        rm "$filename"
        echo "File '$filename' deleted successfully."
    else
        echo "File '$filename' does not exist."
    fi
}

# Function to create a new folder
create_folder() {
    read -p "Enter the folder name to create: " foldername
    mkdir -p "$foldername"
    echo "Folder '$foldername' created successfully."
}

# Function to update a folder (rename)
update_folder() {
    read -p "Enter the current folder name: " current_foldername
    if [ -d "$current_foldername" ]; then
        read -p "Enter the new folder name: " new_foldername
        mv "$current_foldername" "$new_foldername"
        echo "Folder renamed to '$new_foldername' successfully."
    else
        echo "Folder '$current_foldername' does not exist."
    fi
}

# Function to delete a folder
delete_folder() {
    read -p "Enter the folder name to delete: " foldername
    if [ -d "$foldername" ]; then
        rm -r "$foldername"
        echo "Folder '$foldername' deleted successfully."
    else
        echo "Folder '$foldername' does not exist."
    fi
}

# Function to find the location of a file
file_location() {
    read -p "Enter the filename to find: " filename
    if [ -f "$filename" ]; then
        filepath=$(realpath "$filename")
        echo "File '$filename' is located at: $filepath"
    else
        echo "File '$filename' does not exist."
    fi
}

# Function to back up a file
backup_file() {
    read -p "Enter the filename to back up: " filename
    if [ -f "$filename" ]; then
        cp "$filename" "$filename.bak"
        echo "File '$filename' backed up as '$filename.bak'."
    else
        echo "File '$filename' does not exist."
    fi
}

# File Management Menu
file_management() {
    while true; do
        echo "FILE MANAGEMENT"
        echo "1. Create File"
        echo "2. Update File"
        echo "3. Delete File"
        echo "4. Create Folder"
        echo "5. Update Folder"
        echo "6. Delete Folder"
        echo "7. Find File Location"
        echo "8. Backup File"
        echo "9. Back to Main Menu"
        read -p "Enter your choice: " choice

        case $choice in
            1) create_file ;;
            2) update_file ;;
            3) delete_file ;;
            4) create_folder ;;
            5) update_folder ;;
            6) delete_folder ;;
            7) file_location ;;
            8) backup_file ;;
            9) break ;;
            *) echo "Invalid choice. Please enter a number between 1 and 9." ;;
        esac
        read -p "Press enter to continue..."
    done
}

# Function to add a new user
add_user() {
    read -p "Enter username: " username
    sudo adduser $username
    echo "User '$username' added successfully."
}

# Function to delete a user
delete_user() {
    read -p "Enter username to delete: " username
    sudo deluser $username
    echo "User '$username' deleted successfully."
}

# Function to switch user
switch_user() {
    read -p "Enter username to switch to: " username
    sudo -i -u $username
}

# User Management Menu
user_management() {
    while true; do
        echo "USER MANAGEMENT"
        echo "1. Add User"
        echo "2. Delete User"
        echo "3. Switch User"
        echo "4. Back to Main Menu"
        read -p "Enter your choice: " choice

        case $choice in
            1) add_user ;;
            2) delete_user ;;
            3) switch_user ;;
            4) break ;;
            *) echo "Invalid choice. Please enter a number between 1 and 4." ;;
        esac
        read -p "Press enter to continue..."
    done
}

# Function to open a web browser
open_browser() {
    xdg-open https://www.google.com &
    echo "Opening web browser..."
}

# Function to open a text editor
open_text_editor() {
    xdg-open ~/Documents &
    echo "Opening text editor..."
}

# Function to open a file manager
open_file_manager() {
    xdg-open . &
    echo "Opening file manager..."
}

# Application Management Menu
application_management() {
    while true; do
        echo "APPLICATION MANAGEMENT"
        echo "1. Open Web Browser"
        echo "2. Open Text Editor"
        echo "3. Open File Manager"
        echo "4. Back to Main Menu"
        read -p "Enter your choice: " choice

        case $choice in
            1) open_browser ;;
            2) open_text_editor ;;
            3) open_file_manager ;;
            4) break ;;
            *) echo "Invalid choice. Please enter a number between 1 and 4." ;;
        esac
        read -p "Press enter to continue..."
    done
}

# Main Menu
while true; do
    echo "MAIN MENU"
    echo "1. User Management"
    echo "2. File Management"
    echo "3. Application Management"
    echo "4. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) user_management ;;
        2) file_management ;;
        3) application_management ;;
        4) echo "Exiting..."; exit ;;
        *) echo "Invalid choice. Please enter 1, 2, 3, or 4." ;;
    esac
    read -p "Press enter to continue..."
done
