#!/bin/bash
# VS Code Settings Deployment Script
# This script deploys VS Code settings and installs all required extensions
# Last updated: April 26, 2025

# Git repository directory (already cloned)
REPO_DIR="$HOME/vscode-settings"  # Adjusted directory name
CONFIG_DIR="$HOME/.config/Code/User"  # Default directory for VS Code settings on Linux/Mac
WIN_CONFIG_DIR="$APPDATA\\Code\\User"  # Directory for VS Code settings on Windows

# List of all VS Code extensions to install
VSCODE_EXTENSIONS=(
    "076923.python-image-preview"
    "alefragnani.project-manager"
    "almenon.arepl"
    "amiralizadeh9480.cpp-helper"
    "amunger.logpoint-generator"
    "aruna-labs.mode"
    "askia.askia-qexml-generator-extension"
    "batisteo.vscode-django"
    "benjamin-simmonds.pythoncpp-debug"
    "brianlewyn.dark-teal-theme"
    "cesarmanrique.copy-github-url-remote"
    "codezombiech.gitignore"
    "cschlosser.doxdocgen"
    "cstrap.python-snippets"
    "cweijan.epub-reader"
    "davidanson.vscode-markdownlint"
    "dbcode.dbcode"
    "deerawan.vscode-dash"
    "demystifying-javascript.python-extensions-pack"
    "docker.docker"
    "donjayamanne.git-extension-pack"
    "donjayamanne.githistory"
    "donjayamanne.python-environment-manager"
    "donjayamanne.python-extension-pack"
    "dotjoshjohnson.xml"
    "eamodio.gitlens"
    "earthslurm.stql"
    "ecmel.vscode-html-css"
    "engn2219-anu.engn2219-2022-s1-vscode"
    "fengkx.beancount-lsp-client"
    "fluffyfen.owokai-theme"
    "franneck94.c-cpp-runner"
    "github.codespaces"
    "github.copilot"
    "github.copilot-chat"
    "github.github-vscode-theme"
    "github.remotehub"
    "github.vscode-github-actions"
    "github.vscode-pull-request-github"
    "hbenl.vscode-test-explorer"
    "hyunkyunmoon.gzipdecompressor"
    "james-yu.latex-workshop"
    "jbenden.c-cpp-flylint"
    "jdinhlife.gruvbox"
    "jeff-hykin.better-cpp-syntax"
    "jithurjacob.nbpreviewer"
    "juupje.slurmassist"
    "kaih2o.python-resource-monitor"
    "kaysonwu.cpptask"
    "kevinrose.vsc-python-indent"
    "leetcode.vscode-leetcode"
    "littlefoxteam.vscode-python-test-adapter"
    "llvm-vs-code-extensions.vscode-clangd"
    "mathematic.vscode-latex"
    "mechatroner.rainbow-csv"
    "micoloth.reactive-jupyter"
    "mintlify.document"
    "mitaki28.vscode-clang"
    "monokai.theme-monokai-pro-vscode"
    "ms-azuretools.vscode-docker"
    "ms-dotnettools.csharp"
    "ms-dotnettools.vscode-dotnet-runtime"
    "ms-iot.vscode-ros"
    "ms-kubernetes-tools.vscode-kubernetes-tools"
    "ms-python.debugpy"
    "ms-python.isort"
    "ms-python.pylint"
    "ms-python.python"
    "ms-python.vscode-pylance"
    "ms-python.vscode-python-envs"
    "ms-toolsai.jupyter"
    "ms-toolsai.jupyter-hub"
    "ms-toolsai.jupyter-keymap"
    "ms-toolsai.jupyter-renderers"
    "ms-toolsai.vscode-jupyter-cell-tags"
    "ms-toolsai.vscode-jupyter-powertoys"
    "ms-toolsai.vscode-jupyter-slideshow"
    "ms-vscode-remote.remote-containers"
    "ms-vscode-remote.remote-ssh"
    "ms-vscode-remote.remote-ssh-edit"
    "ms-vscode-remote.remote-wsl"
    "ms-vscode-remote.vscode-remote-extensionpack"
    "ms-vscode.atom-keybindings"
    "ms-vscode.azure-repos"
    "ms-vscode.cpptools"
    "ms-vscode.cpptools-extension-pack"
    "ms-vscode.cpptools-themes"
    "ms-vscode.remote-explorer"
    "ms-vscode.remote-repositories"
    "ms-vscode.remote-server"
    "ms-vscode.test-adapter-converter"
    "ms-vscode.vscode-copilot-vision"
    "ms-vscode.vscode-serial-monitor"
    "ms-vscode.vscode-websearchforcopilot"
    "nathanj.cppcheck-plugin"
    "neuralgeeks.cody"
    "njpwerner.autodocstring"
    "njqdev.vscode-python-typehint"
    "oderwat.indent-rainbow"
    "oleg-shilo.cs-script"
    "pkief.material-icon-theme"
    "redhat.vscode-yaml"
    "riasatsk.live-in-the-dark"
    "rogalmic.bash-debug"
    "samghelms.jupyter-notebook-vscode"
    "sanchaii.devlinker-mcp-host"
    "starkwang.markdown"
    "streetsidesoftware.code-spell-checker"
    "sujanchhetri.black-pearlpule"
    "tecosaur.latex-utilities"
    "thang-nm.catppuccin-perfect-icons"
    "thebarkman.vscode-djaneiro"
    "thiagolciobittencourt.ubuntuvscode"
    "tobiastao.vscode-md"
    "tomoki1207.pdf"
    "trabpukcip.wolf"
    "twxs.cmake"
    "vadimcn.vscode-lldb"
    "visualstudioexptteam.intellicode-api-usage-examples"
    "visualstudioexptteam.vscodeintellicode"
    "vscode-icons-team.vscode-icons"
    "vscodevim.vim"
    "vsls-contrib.gistfs"
    "wayou.vscode-todo-highlight"
    "wholroyd.jinja"
    "xirider.livecode"
    "xynny.hackerred"
    "yzhang.markdown-all-in-one"
    "zainchen.json"
    "ziyasal.vscode-open-in-github"
)

# Check if VS Code is installed
if ! command -v code &> /dev/null; then
    echo "VS Code could not be found. Please install it first."
    exit 1
fi

# Ensure the repository exists
if [ ! -d "$REPO_DIR" ]; then
    echo "Repository directory not found at $REPO_DIR. Please check the path."
    exit 1
fi

# Navigate to the repository directory
cd "$REPO_DIR" || exit

# Determine the target VS Code configuration directory based on OS
case "$OSTYPE" in
  linux*)
    TARGET_CONFIG_DIR="$CONFIG_DIR"
    echo "Detected Linux OS"
    ;;
  darwin*)
    TARGET_CONFIG_DIR="$CONFIG_DIR"
    echo "Detected macOS"
    ;;
  msys*|cygwin*)
    TARGET_CONFIG_DIR="$WIN_CONFIG_DIR"
    echo "Detected Windows OS"
    ;;
  *)
    echo "Unsupported OS: $OSTYPE"
    exit 1
    ;;
esac

# Ensure the target configuration directory exists
mkdir -p "$TARGET_CONFIG_DIR"

# Backup existing settings if any
if [ -f "$TARGET_CONFIG_DIR/settings.json" ]; then
    echo "Backing up existing settings.json"
    cp "$TARGET_CONFIG_DIR/settings.json" "$TARGET_CONFIG_DIR/settings.json.backup.$(date +%Y%m%d%H%M%S)"
fi

# Copy settings.json to VS Code User directory
echo "Copying settings.json to $TARGET_CONFIG_DIR"
cp settings.json "$TARGET_CONFIG_DIR/settings.json"

# Install required extensions
echo "Installing VS Code extensions (this may take a while)..."
for EXT in "${VSCODE_EXTENSIONS[@]}"; do
    echo "Installing extension: $EXT"
    code --install-extension "$EXT" --force || echo "Failed to install $EXT, continuing..."
done

# Update the repository with the latest installed extensions
echo "Updating extensions list in the deploy script..."
code --list-extensions > extensions.list
echo "Extensions list saved to extensions.list"

# Confirm success
echo "VS Code settings and extensions installed successfully."
echo "Your VS Code setup has been fully reproduced."
