#!/bin/bash
# Configure GNOME workspaces keybindings
# Super+1..9 to switch, Super+Shift+1..9 to move
# and disable dock Super+number shortcuts

for i in {1..9}; do
  # Disable dock/app hotkeys (dash)
  gsettings set org.gnome.shell.keybindings switch-to-application-$i '[]'

  # Switch to workspace i
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"

  # Move focused window to workspace i
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Shift><Super>$i']"
done

echo "✅ Super+1..9 set to switch workspaces"
echo "✅ Super+Shift+1..9 set to move windows"
echo "✅ Dock Super+number shortcuts disabled"
