#!/bin/bash

loggedInUser=$(stat -f%Su /dev/console)

# Function to add user to sudoers temporarily
function add_sudoers_temp() {
    echo "$loggedInUser ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/temp_brew_install
}

# Function to remove temporary sudoers entry
function remove_sudoers_temp() {
    sudo rm -f /etc/sudoers.d/temp_brew_install
}

# Grant write permissions to Homebrew installation directories
function grant_permissions() {
    if [[ $(arch) == "arm64" ]]; then
        # Apple Silicon
        sudo mkdir -p /opt/homebrew
        sudo chown -R "$loggedInUser":admin /opt/homebrew
        sudo chmod -R 777 /opt/homebrew
    else
        # Intel
        sudo mkdir -p /usr/local
        sudo chown -R "$loggedInUser":admin /usr/local
        sudo chmod -R 777 /usr/local
    fi
}

# Ensure the correct Homebrew path for the architecture
function configure_brew_path() {
    if [[ $(arch) == "arm64" ]]; then
        export PATH="/opt/homebrew/bin:$PATH"
    else
        export PATH="/usr/local/bin:$PATH"
    fi
}

# Add user to sudoers temporarily
add_sudoers_temp

# Grant permissions
grant_permissions

# Configure the correct Homebrew path
configure_brew_path

# Run the Google-Cloud-CLI installation
sudo -u "$loggedInUser" /bin/bash -c "brew install --cask google-cloud-sdk"

# Verify installation
if command -v gcloud >/dev/null 2>&1; then
    echo "GOOGLE-CLOUD-CLI installation completed successfully."
else
    echo "GOOGLE-CLOUD-CLI installation failed."
fi

# Remove user from sudoers
remove_sudoers_temp
