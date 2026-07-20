#!/bin/sh
# Install plugin .so: try /usr/lib first, fall back to $HOME/.mpp/plugins
PLUGIN_FILE="$1"

if [ "${MPP_SKIP_PLUGIN_INSTALL:-0}" = "1" ]; then
    echo "Skipping plugin installation: $(basename "$PLUGIN_FILE")"
    exit 0
fi

if cp "$PLUGIN_FILE" /usr/lib/ 2>/dev/null; then
    echo "Installed $(basename "$PLUGIN_FILE") to /usr/lib/"
else
    echo "No permission to write /usr/lib, using $HOME/.mpp/plugins instead"
    mkdir -p "$HOME/.mpp/plugins"
    cp "$PLUGIN_FILE" "$HOME/.mpp/plugins/"
    echo "Installed $(basename "$PLUGIN_FILE") to $HOME/.mpp/plugins/"
fi
