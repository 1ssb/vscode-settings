#!/bin/bash

# Git repository directory (already cloned)
REPO_DIR="$HOME/vscode-settings"  # Adjusted directory name
CONFIG_DIR="$HOME/.config/Code/User"  # Default directory for VS Code settings on Linux/Mac
WIN_CONFIG_DIR="$APPDATA\\Code\\User"  # Directory for VS Code settings on Windows
VSCODE_EXTENSIONS=(
    "KevinRose.vsc-python-indent"
    "thang-nm.catppuccin-perfect-icons"
    "RiasatSk.live-in-the-dark"
)

# Ensure the repository exists
if [ ! -d "$REPO_DIR" ]; then
    echo "Repository directory not found at $REPO_DIR. Please check the path."
    exit 1
fi

# Navigate to the repository directory
cd "$REPO_DIR" || exit

# Pull the latest changes
git pull

# Determine the target VS Code configuration directory based on OS
case "$OSTYPE" in
  linux*|darwin*)
    TARGET_CONFIG_DIR="$CONFIG_DIR"
    ;;
  msys*|cygwin*)
    TARGET_CONFIG_DIR="$WIN_CONFIG_DIR"
    ;;
  *)
    echo "Unsupported OS: $OSTYPE"
    exit 1
    ;;
esac

# Ensure the target configuration directory exists
mkdir -p "$TARGET_CONFIG_DIR"

# Copy settings.json to VS Code User directory
cp settings.json "$TARGET_CONFIG_DIR/settings.json"
echo "VS Code settings.json copied to $TARGET_CONFIG_DIR"

# Install required extensions
for EXT in "${VSCODE_EXTENSIONS[@]}"; do
    code --install-extension "$EXT"
done

# Confirm success
echo "VS Code settings and extensions installed successfully."

# Extra: Check if VS Code is installed
if ! command -v code &> /dev/null
then
    echo "VS Code could not be found. Please install it first."
    exit 1
fi
