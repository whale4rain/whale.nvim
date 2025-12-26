#!/usr/bin/env pwsh
# Neovim vim.pack Plugin Manager Script
# This script helps manage plugins using Neovim's native vim.pack system

param(
    [Parameter(Position=0)]
    [ValidateSet('install', 'update', 'clean', 'list')]
    [string]$Command = 'install'
)

$ErrorActionPreference = "Stop"

# Get Neovim data directory
$nvimData = if ($env:XDG_DATA_HOME) {
    "$env:XDG_DATA_HOME/nvim"
} elseif ($IsWindows) {
    "$env:LOCALAPPDATA/nvim-data"
} else {
    "$HOME/.local/share/nvim"
}

$packPath = Join-Path $nvimData "pack/plugins"

function Write-ColorOutput {
    param([string]$Message, [string]$Color = "White")
    Write-Host $Message -ForegroundColor $Color
}

function Get-PluginList {
    # Parse plugins from pack.lua
    $configPath = Join-Path $PSScriptRoot "lua/config/pack.lua"
    
    if (-not (Test-Path $configPath)) {
        Write-ColorOutput "Error: pack.lua not found at $configPath" "Red"
        exit 1
    }

    $content = Get-Content $configPath -Raw
    
    # Extract plugin URLs using regex
    $plugins = @()
    $pattern = '\{\s*"([^"]+)"'
    $matches = [regex]::Matches($content, $pattern)
    
    foreach ($match in $matches) {
        $repo = $match.Groups[1].Value
        if ($repo -match '^[\w-]+/[\w.-]+$') {
            $plugins += $repo
        }
    }
    
    return $plugins
}

function Install-Plugins {
    Write-ColorOutput "`n=== Installing Neovim Plugins ===" "Cyan"
    
    $plugins = Get-PluginList
    
    if ($plugins.Count -eq 0) {
        Write-ColorOutput "No plugins found to install" "Yellow"
        return
    }

    # Create pack directory structure
    $startPath = Join-Path $packPath "start"
    $optPath = Join-Path $packPath "opt"
    
    New-Item -ItemType Directory -Force -Path $startPath | Out-Null
    New-Item -ItemType Directory -Force -Path $optPath | Out-Null

    Write-ColorOutput "Found $($plugins.Count) plugins to install`n" "Green"

    foreach ($plugin in $plugins) {
        $pluginName = $plugin.Split('/')[-1]
        $pluginPath = Join-Path $startPath $pluginName
        $url = "https://github.com/$plugin"

        if (Test-Path $pluginPath) {
            Write-ColorOutput "  ✓ $plugin (already installed)" "Gray"
        } else {
            Write-ColorOutput "  → Installing $plugin..." "Yellow"
            try {
                git clone --depth 1 --filter=blob:none $url $pluginPath 2>&1 | Out-Null
                Write-ColorOutput "  ✓ $plugin installed successfully" "Green"
            } catch {
                Write-ColorOutput "  ✗ Failed to install $plugin : $_" "Red"
            }
        }
    }

    Write-ColorOutput "`n=== Installation Complete ===" "Cyan"
    Write-ColorOutput "Restart Neovim to load the plugins" "Yellow"
}

function Update-Plugins {
    Write-ColorOutput "`n=== Updating Neovim Plugins ===" "Cyan"
    
    $startPath = Join-Path $packPath "start"
    
    if (-not (Test-Path $startPath)) {
        Write-ColorOutput "No plugins found. Run './pack-manager.ps1 install' first." "Yellow"
        return
    }

    $pluginDirs = Get-ChildItem -Path $startPath -Directory

    if ($pluginDirs.Count -eq 0) {
        Write-ColorOutput "No plugins found to update" "Yellow"
        return
    }

    Write-ColorOutput "Updating $($pluginDirs.Count) plugins...`n" "Green"

    foreach ($dir in $pluginDirs) {
        $pluginName = $dir.Name
        Write-ColorOutput "  → Updating $pluginName..." "Yellow"
        
        Push-Location $dir.FullName
        try {
            $beforeHash = git rev-parse HEAD 2>$null
            git pull --ff-only 2>&1 | Out-Null
            $afterHash = git rev-parse HEAD 2>$null
            
            if ($beforeHash -ne $afterHash) {
                Write-ColorOutput "  ✓ $pluginName updated successfully" "Green"
            } else {
                Write-ColorOutput "  ✓ $pluginName (already up to date)" "Gray"
            }
        } catch {
            Write-ColorOutput "  ✗ Failed to update $pluginName : $_" "Red"
        } finally {
            Pop-Location
        }
    }

    Write-ColorOutput "`n=== Update Complete ===" "Cyan"
}

function Remove-UnusedPlugins {
    Write-ColorOutput "`n=== Cleaning Unused Plugins ===" "Cyan"
    
    $installedPlugins = Get-ChildItem -Path (Join-Path $packPath "start") -Directory -ErrorAction SilentlyContinue
    $configuredPlugins = Get-PluginList
    
    $pluginNames = $configuredPlugins | ForEach-Object { $_.Split('/')[-1] }
    
    $removed = 0
    foreach ($installed in $installedPlugins) {
        if ($pluginNames -notcontains $installed.Name) {
            Write-ColorOutput "  → Removing unused plugin: $($installed.Name)" "Yellow"
            Remove-Item -Path $installed.FullName -Recurse -Force
            $removed++
        }
    }
    
    if ($removed -eq 0) {
        Write-ColorOutput "No unused plugins found" "Green"
    } else {
        Write-ColorOutput "`nRemoved $removed unused plugin(s)" "Green"
    }
}

function Show-PluginList {
    Write-ColorOutput "`n=== Configured Plugins ===" "Cyan"
    
    $plugins = Get-PluginList
    
    if ($plugins.Count -eq 0) {
        Write-ColorOutput "No plugins configured" "Yellow"
        return
    }

    Write-ColorOutput "Total: $($plugins.Count) plugins`n" "Green"
    
    $startPath = Join-Path $packPath "start"
    
    foreach ($plugin in $plugins) {
        $pluginName = $plugin.Split('/')[-1]
        $pluginPath = Join-Path $startPath $pluginName
        
        if (Test-Path $pluginPath) {
            Push-Location $pluginPath
            $hash = git rev-parse --short HEAD 2>$null
            Pop-Location
            Write-ColorOutput "  ✓ $plugin ($hash)" "Green"
        } else {
            Write-ColorOutput "  ✗ $plugin (not installed)" "Red"
        }
    }
}

# Main execution
switch ($Command) {
    'install' { Install-Plugins }
    'update'  { Update-Plugins }
    'clean'   { Remove-UnusedPlugins }
    'list'    { Show-PluginList }
}

Write-Host ""
