#!/usr/bin/env bash
# Neovim vim.pack Plugin Manager Script
# Linux/macOS version

set -e

COMMAND=${1:-install}
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

# Get Neovim data directory
if [ -n "$XDG_DATA_HOME" ]; then
    NVIM_DATA="$XDG_DATA_HOME/nvim"
else
    NVIM_DATA="$HOME/.local/share/nvim"
fi

PACK_PATH="$NVIM_DATA/pack/plugins"

print_color() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${NC}"
}

get_plugin_list() {
    local config_path="$SCRIPT_DIR/lua/config/pack.lua"
    
    if [ ! -f "$config_path" ]; then
        print_color "$RED" "Error: pack.lua not found at $config_path"
        exit 1
    fi
    
    # Extract plugin names using grep and sed
    grep -oP '{\s*"\K[^"]+' "$config_path" | grep '/' || true
}

install_plugins() {
    print_color "$CYAN" "\n=== Installing Neovim Plugins ==="
    
    local plugins=$(get_plugin_list)
    local count=$(echo "$plugins" | wc -l)
    
    if [ -z "$plugins" ]; then
        print_color "$YELLOW" "No plugins found to install"
        return
    fi
    
    mkdir -p "$PACK_PATH/start"
    mkdir -p "$PACK_PATH/opt"
    
    print_color "$GREEN" "Found $count plugins to install\n"
    
    while IFS= read -r plugin; do
        [ -z "$plugin" ] && continue
        
        local plugin_name=$(basename "$plugin")
        local plugin_path="$PACK_PATH/start/$plugin_name"
        local url="https://github.com/$plugin"
        
        if [ -d "$plugin_path" ]; then
            print_color "$GRAY" "  ✓ $plugin (already installed)"
        else
            print_color "$YELLOW" "  → Installing $plugin..."
            if git clone --depth 1 --filter=blob:none "$url" "$plugin_path" >/dev/null 2>&1; then
                print_color "$GREEN" "  ✓ $plugin installed successfully"
            else
                print_color "$RED" "  ✗ Failed to install $plugin"
            fi
        fi
    done <<< "$plugins"
    
    print_color "$CYAN" "\n=== Installation Complete ==="
    print_color "$YELLOW" "Restart Neovim to load the plugins"
}

update_plugins() {
    print_color "$CYAN" "\n=== Updating Neovim Plugins ==="
    
    local start_path="$PACK_PATH/start"
    
    if [ ! -d "$start_path" ]; then
        print_color "$YELLOW" "No plugins found. Run './pack-manager.sh install' first."
        return
    fi
    
    local count=$(find "$start_path" -mindepth 1 -maxdepth 1 -type d | wc -l)
    
    if [ $count -eq 0 ]; then
        print_color "$YELLOW" "No plugins found to update"
        return
    fi
    
    print_color "$GREEN" "Updating $count plugins...\n"
    
    for dir in "$start_path"/*; do
        [ ! -d "$dir" ] && continue
        
        local plugin_name=$(basename "$dir")
        print_color "$YELLOW" "  → Updating $plugin_name..."
        
        cd "$dir"
        local before_hash=$(git rev-parse HEAD 2>/dev/null || echo "")
        
        if git pull --ff-only >/dev/null 2>&1; then
            local after_hash=$(git rev-parse HEAD 2>/dev/null || echo "")
            
            if [ "$before_hash" != "$after_hash" ]; then
                print_color "$GREEN" "  ✓ $plugin_name updated successfully"
            else
                print_color "$GRAY" "  ✓ $plugin_name (already up to date)"
            fi
        else
            print_color "$RED" "  ✗ Failed to update $plugin_name"
        fi
    done
    
    print_color "$CYAN" "\n=== Update Complete ==="
}

clean_plugins() {
    print_color "$CYAN" "\n=== Cleaning Unused Plugins ==="
    
    local start_path="$PACK_PATH/start"
    
    if [ ! -d "$start_path" ]; then
        print_color "$YELLOW" "No plugins directory found"
        return
    fi
    
    local plugins=$(get_plugin_list)
    local removed=0
    
    for dir in "$start_path"/*; do
        [ ! -d "$dir" ] && continue
        
        local plugin_name=$(basename "$dir")
        local found=false
        
        while IFS= read -r plugin; do
            local name=$(basename "$plugin")
            if [ "$name" = "$plugin_name" ]; then
                found=true
                break
            fi
        done <<< "$plugins"
        
        if [ "$found" = false ]; then
            print_color "$YELLOW" "  → Removing unused plugin: $plugin_name"
            rm -rf "$dir"
            ((removed++))
        fi
    done
    
    if [ $removed -eq 0 ]; then
        print_color "$GREEN" "No unused plugins found"
    else
        print_color "$GREEN" "\nRemoved $removed unused plugin(s)"
    fi
}

list_plugins() {
    print_color "$CYAN" "\n=== Configured Plugins ==="
    
    local plugins=$(get_plugin_list)
    local count=$(echo "$plugins" | wc -l)
    
    if [ -z "$plugins" ]; then
        print_color "$YELLOW" "No plugins configured"
        return
    fi
    
    print_color "$GREEN" "Total: $count plugins\n"
    
    local start_path="$PACK_PATH/start"
    
    while IFS= read -r plugin; do
        [ -z "$plugin" ] && continue
        
        local plugin_name=$(basename "$plugin")
        local plugin_path="$start_path/$plugin_name"
        
        if [ -d "$plugin_path" ]; then
            cd "$plugin_path"
            local hash=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
            print_color "$GREEN" "  ✓ $plugin ($hash)"
        else
            print_color "$RED" "  ✗ $plugin (not installed)"
        fi
    done <<< "$plugins"
}

show_help() {
    cat << EOF
Neovim vim.pack Plugin Manager

Usage: $0 [command]

Commands:
    install     Install all configured plugins
    update      Update all installed plugins
    list        List all configured plugins and their status
    clean       Remove unused plugins
    help        Show this help message

Examples:
    $0 install
    $0 update
    $0 list
    $0 clean

EOF
}

# Main execution
case "$COMMAND" in
    install)
        install_plugins
        ;;
    update)
        update_plugins
        ;;
    clean)
        clean_plugins
        ;;
    list)
        list_plugins
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        print_color "$RED" "Unknown command: $COMMAND"
        show_help
        exit 1
        ;;
esac

echo ""
