# Termux interface Qurxin 

<img width="200px"> <img src="https://i.ibb.co/fVnp1kz5/Termux-banner-or-interface.png" alt="Termux-banner-or-interface" border="0">



#### Qurxin is Termux banner or interface with parroto os shell and Wellcome robot like Jarvis in Iron Man movie created with love 16-oct-2020

## [+] Installation & Usage :atom_symbol:
```
apt update && upgrade -y 
pkg install git python mpv figlet -y
pip install lolcat
git clone https://github.com/fikrado/qurxin
cd qurxin
chmod +x *
sh install.sh
exit
```
### One command installation :octocat:
```
apt update && upgrade -y && apt install git -y && pkg install mpv figlet python && pip install lolcat && git clone https://github.com/fikrado/qurxin && cd qurxin && chmod +x * && ./install.sh
```
## screen shot
## [-] How to remove :electron:
```
cd qurxin

bash rvt.sh
```

## Interface [+] Installation
```
#!/data/data/com.termux/files/usr/bin/bash
# Termux Environment Setup Script

# --- Configuration ---
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Essential packages to install
PACKAGES="git vim htop neofetch"

# --- Functions ---

log_info() {
    echo -e "${CYAN}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

# --- Main Script Start ---

log_info "Starting Termux initial setup..."

# 1. Update and Upgrade Packages
log_info "Running system update and upgrade (this might take a moment)..."
pkg update -y && pkg upgrade -y
if [ $? -eq 0 ]; then
    log_success "System packages updated and upgraded."
else
    log_warn "Package update/upgrade failed. Continuing with installation."
fi

# 2. Install Essential Utilities
log_info "Installing essential packages: ${PACKAGES}..."
pkg install $PACKAGES -y

if [ $? -eq 0 ]; then
    log_success "All essential packages installed successfully."
else
    log_warn "Some packages may not have installed. Please check network connection."
fi

# 3. Customize Bash Prompt (.bashrc)
log_info "Customizing the bash prompt for better visibility..."

# Custom PS1: [User@Termux] current_directory $
# Green user/host, Blue path, Yellow $
CUSTOM_PS1="PS1='\[${GREEN}\]\u@\h\[${BLUE}\]:\w\[${YELLOW}\]\$ \[${NC}\]'"
NEOFETCH_CMD='neofetch'

# Backup existing .bashrc and add new config
BASHRC_FILE="$HOME/.bashrc"

# Check if customizations already exist to prevent duplication
if grep -q "CUSTOM_TERMUX_SETUP" "$BASHRC_FILE"; then
    log_warn "Custom prompt configuration already exists in .bashrc. Skipping modification."
else
    # Append custom settings to .bashrc
    echo -e "\n# --- CUSTOM_TERMUX_SETUP ---\n" >> "$BASHRC_FILE"
    echo "# Set a custom colorful prompt" >> "$BASHRC_FILE"
    echo $CUSTOM_PS1 >> "$BASHRC_FILE"
    echo "" >> "$BASHRC_FILE"
    echo "# Run neofetch on login (can be commented out if not desired)" >> "$BASHRC_FILE"
    echo $NEOFETCH_CMD >> "$BASHRC_FILE"
    echo -e "\n# --- END CUSTOM_TERMUX_SETUP ---\n" >> "$BASHRC_FILE"
    log_success "Custom prompt added to .bashrc. It will take effect next time you open Termux."
fi

# 4. Final summary
log_info "Setup complete! Please restart Termux (exit and reopen) to see the new prompt and neofetch start-up."
log_info "You now have: git, vim, htop, and neofetch installed."
log_success "Done!"
neofetch # Run neofetch now to show off the new install
```
