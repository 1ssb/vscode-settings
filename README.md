# VS Code Settings

This is my VSCode settings page, feel free to use it and leave a star ✨ if you find it useful. This settings incorporates themes and extensions designed to establish a consistent, optimized development environment across various platforms, including 🪟 Windows, 🍎 macOS, 🐧 Linux, and 🌐 remote computing clusters.

## ✅ Prerequisites

Before proceeding, ensure that the following prerequisites are installed on your system:

- **🖥️ Visual Studio Code (VS Code)**: The core editor must be installed.
- **🔧 Git and Bash**: Essential for cloning the repository and managing version control.

## 📦 Required Extensions

The following extensions are integral to the configuration and must be installed for optimal functionality:

1. **🐍 Python Formatter**: `KevinRose.vsc-python-indent`
2. **🖼️ Icon Theme**: `thang-nm.catppuccin-perfect-icons`
3. **🌌 Color Theme**: `RiasatSk.live-in-the-dark`

## 🚀 Usage Instructions

To utilize this configuration effectively, follow these steps:

1. **🔗 Clone the Repository**

   Begin by cloning the repository containing the  VS Code configuration:
   ```sh
   git clone https://github.com/1ssb/vscode-settings.git
   ```

2. **📂 Navigate to the Repository Directory**
   ```sh
   cd vscode-settings
   ```

3. **▶️ Execute the Deployment Script**

   Run the provided deployment script to uniformly apply the settings across your system and install the necessary extensions.
   ```sh
   chmod +x deploy_settings.sh
   ./deploy_settings.sh
   ```

4. **🔄 Optional: Manual Settings Synchronization**

   If desired, you may also use VS Code's built-in settings synchronization feature to sync configurations across devices. Enable this after running the deployment script by navigating to:

   **⚙️ Settings** > **Turn on Settings Sync...**

## ⚙️  Configuration Details

The `settings.json` file provided in this repository contains the following key configurations:

- **💾 File Auto-Save**: Automatically saves changes to files after a short delay to ensure data integrity.
- **🔤 Custom Fonts**: Specifies Menlo, Monaco, and Courier New fonts to maintain a uniform aesthetic across different operating systems.
- **🎨 Theme**: Configures the "Live in the Dark" color theme in conjunction with the "catppuccin-perfect-icons" icon set for visual consistency.
- **🟦 Bracket Pair Colorization**: Enables bracket colorization with independent colors, improving code readability and reducing cognitive load.
- **✂️ Whitespace Rendering**: Disabled to maintain a clean editor interface without visual distractions.
- **🔧 Terminal Customization**: settingsures the integrated terminal to use the Courier font, ensuring a consistent development environment.

### 🎨 Visual Customizations

- **🔗 Bracket Colors**: The bracket pair colorization feature uses distinct colors to simplify tracking of paired brackets, aiding in code comprehension.
- **📊 Status Bar and 📁 Sidebar**: Custom colors are applied to the status bar and sidebar to enhance visibility and maintain a cohesive visual experience.

## 📝 Additional Notes

- The deployment script will automatically place the `settings.json` file in the appropriate VS Code configuration directory for 🐧 Linux, 🍎 macOS, and 🪟 Windows environments.
- If you encounter errors indicating that VS Code cannot be found, verify that it is properly installed and accessible through your terminal.

## 📞 Contact Information

For any questions, issues, or suggestions regarding this setup, please reach out to **[1ssb](https://1ssb.github.io)** or simply raise Issues.
