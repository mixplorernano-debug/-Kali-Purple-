#!/bin/bash
# Termux Banner and Interface Setup Script
# This script installs necessary tools and configures your shell profile (.bashrc or .zshrc)
# to display a custom banner every time Termux starts.

echo "--- Starting Termux Banner Setup ---"

# --- 1. Install necessary packages for creative banners ---
echo "Installing figlet, toilet, and neofetch (if not already installed)..."
# Termux uses 'pkg' as the frontend for package management
pkg update -y
pkg install -y figlet toilet neofetch

# --- 2. Define the banner function and profile configuration ---

# Check which shell profile exists and set the PROFILE_FILE variable
if [ -f "$HOME/.bashrc" ]; then
    PROFILE_FILE="$HOME/.bashrc"
elif [ -f "$HOME/.zshrc" ]; then
    PROFILE_FILE="$HOME/.zshrc"
else
    echo "Could not find .bashrc or .zshrc. Assuming Bash and creating .bashrc."
    PROFILE_FILE="$HOME/.bashrc"
    touch "$PROFILE_FILE"
fi

# Define the banner logic to be appended to the profile file
# ANSI escape codes are used for colors (e.g., \e[1;36m for bold cyan)
BANNER_CONFIG='
# --- START Custom Termux Banner ---
# Logic added by termux_banner_setup.sh on $(date)

# Clear the screen before showing the banner
clear

# 1. Custom Text Banner using TOILET (for rainbow effect)
echo -e "\n"
echo -e "\e[1;36mWelcome Back, User!\e[0m" # Cyan and Bold
toilet -f standard -F gay "T E R M U X"

# 2. Display System Info using NEOFETCH
echo -e "\n\e[1;32m--- System Information ---\e[0m" # Green and Bold
neofetch

# 3. Simple Message and Prompt Color Reset
echo -e "\e[1;33mHave a productive session.\e[0m" # Yellow and Bold
echo ""

# --- END Custom Termux Banner ---
'

# Check if the banner config already exists to prevent duplicates
if grep -q "Custom Termux Banner" "$PROFILE_FILE"; then
    echo "Banner configuration already found in $PROFILE_FILE. Skipping append."
else
    echo "Appending custom banner configuration to $PROFILE_FILE..."
    echo "$BANNER_CONFIG" >> "$PROFILE_FILE"
    echo "Successfully appended configuration."
fi

# --- 3. Final steps ---
echo "--- Setup Complete! ---"
echo "The banner will appear when you restart Termux or open a new session."
echo "You can test it now by sourcing the profile file: source $PROFILE_FILE"
echo "Or by opening a new Termux window."