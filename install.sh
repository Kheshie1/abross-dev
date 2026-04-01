#!/bin/bash
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              Abross Agentic Development Environment          ║"
echo "║                        Installation Script                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check for Rust
if ! command -v cargo &> /dev/null; then
    echo "❌ Rust not found. Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Install
echo "📦 Installing Abross ADE..."
cargo install abross-ai-terminal

# Create config
mkdir -p ~/.config/abross
if [ ! -f ~/.config/abross/config.toml ]; then
    cat > ~/.config/abross/config.toml << 'CONFIG'
[ai]
enabled = true
provider = "openai"
model = "gpt-3.5-turbo"

[terminal]
theme = "catppuccin"
scrollback_lines = 10000

[plugins]
enabled = true
CONFIG
fi

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              Installation Complete! 🎉                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Run: abross-ai-terminal"
echo ""
echo "For AI features, set: export OPENAI_API_KEY=\"your-key\""
