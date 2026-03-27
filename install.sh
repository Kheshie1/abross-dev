#!/bin/bash

echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              Abross Agentic Development Environment          ║"
echo "║                        Installation Script                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check for Rust
if ! command -v cargo &> /dev/null; then
    echo "❌ Rust not found. Please install Rust first:"
    echo "   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi

# Install
echo "📦 Installing Abross ADE..."
cargo install abross-ai-terminal

# Create directories
mkdir -p ~/.config/abross
mkdir -p ~/.local/share/abross/{plugins,themes,sessions}

# Create default config
if [ ! -f ~/.config/abross/config.toml ]; then
    echo "⚙️ Creating default configuration..."
    cat > ~/.config/abross/config.toml << 'CONFIG'
[ai]
enabled = true
provider = "openai"
model = "gpt-3.5-turbo"
temperature = 0.3

[terminal]
theme = "catppuccin"
scrollback_lines = 10000
mouse_support = true

[cloud]
enabled = false
server_url = "https://api.abross.dev"
sync_enabled = false

[plugins]
enabled = true
marketplace_url = "https://plugins.abross.dev"
CONFIG
fi

# Add to PATH
if ! grep -q "~/.cargo/bin" ~/.bashrc; then
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
fi

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║              Installation Complete! 🎉                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "To start Abross ADE, run:"
echo "  abross-ai-terminal"
echo ""
echo "To enable real AI, set your OpenAI API key:"
echo "  export OPENAI_API_KEY=\"sk-your-key-here\""
echo ""
echo "Visit https://abross.dev for documentation and support."
