# Google-Cloud-CLI-Automated-Installer-for-macOS-Bash-Homebrew-
Google Cloud CLI Automated Installer for macOS (Bash + Homebrew)

# ☁️ Google Cloud CLI Automated Installer for macOS (Bash + Homebrew)

This project provides a **Bash automation script** to install the **Google Cloud CLI (gcloud)** on macOS.  
It automatically detects the system architecture (Intel or Apple Silicon), configures permissions for Homebrew, and installs Google Cloud SDK via Homebrew Cask.

---

## 📋 Features
- Detects macOS architecture (`arm64` for Apple Silicon, `x86_64` for Intel).  
- Grants proper permissions to Homebrew installation directories (`/opt/homebrew` or `/usr/local`).  
- Temporarily adds the logged-in user to the **sudoers file** for smooth installation.  
- Installs **Google Cloud CLI (gcloud)** via Homebrew.  
- Cleans up by removing the temporary sudoers entry.  
- Verifies installation after completion.  

---

## 🛠️ Requirements
- macOS (Intel or Apple Silicon)  
- `bash` shell  
- Internet connection  
- [Homebrew](https://brew.sh) installed  

---

## 🚀 Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/ajithselvam/google-cloud-cli-installer.git
   cd google-cloud-cli-installer

2. Make the script executable:
   chmod +x install_gcloud.sh

3. Run the script:
   ./google-cloud-cli.sh

   📂 Script Workflow

Detects the logged-in macOS user.

Temporarily grants passwordless sudo permissions.

Prepares the correct Homebrew directory and adjusts ownership/permissions.

Ensures Homebrew path is correctly configured for the architecture.

Installs Google Cloud CLI using:

brew install --cask google-cloud-sdk

5.Verifies if gcloud is installed and prints status.

6.Removes the temporary sudoers entry.

✅ Verification
Check Google Cloud CLI version:

⚠️ Notes

The script sets temporary wide permissions (777) on Homebrew directories during setup. For production systems, consider tightening permissions afterward.

Requires administrator access for sudo operations.

📜 License

This project is licensed under the MIT License.
