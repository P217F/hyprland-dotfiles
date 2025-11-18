#!/bin/sh

set -e

# ---- 1. Detect package manager ----
detect_pkg() {
    for pm in pacman dnf apt zypper; do
        if command -v "$pm" >/dev/null 2>&1; then
            echo "$pm"
            return
        fi
    done
    echo "none"
}

PKG=$(detect_pkg)
[ "$PKG" = "none" ] && { echo "No supported package manager found." >&2; exit 1; }

echo "Detected package manager: $PKG"

# ---- 2. Install from dependencies.txt ----
if [ -f dependencies.txt ]; then
    echo "Installing dependencies from dependencies.txt..."
    case "$PKG" in
        pacman) sudo pacman -S --needed - < dependencies.txt ;;
        dnf)    sudo dnf install -y $(cat dependencies.txt) ;;
        apt)    sudo apt install -y $(cat dependencies.txt) ;;
        zypper) sudo zypper install -y $(cat dependencies.txt) ;;
    esac
else
    echo "dependencies.txt not found, skipping."
fi

# ---- 3. Install AUR dependencies using paru/yay/etc ----
AUR_HELPER=""

for h in paru yay aura pikaur; do
    if command -v "$h" >/dev/null 2>&1; then
        AUR_HELPER="$h"
        break
    fi
done

if [ -n "$AUR_HELPER" ] && [ -f dependencies_aur.txt ]; then
    echo "Detected AUR helper: $AUR_HELPER"
    $AUR_HELPER -S --needed - < dependencies_aur.txt
else
    echo "No AUR helper found or dependencies_aur.txt missing, skipping."
fi

# ---- 4. Check and populate ~/.config ----
if [ ! -d "$HOME/.config" ]; then
    echo "~/.config does not exist → creating it."
    mkdir -p "$HOME/.config"
else
    echo "~/.config exists → copying dotfiles/.config/*"
    cp -r dotfiles/.config/* "$HOME/.config/"
fi

# ---- 5. Copy GRUB theme ----
# if [ -f "dotfiles/poly-dark" ]; then
    # sudo mkdir -p /boot/grub/themes
    # sudo cp -r dotfiles/poly-dark /boot/grub/themes/
# else
    # echo "dotfiles/poly-dark missing."
# fi

# ---- 6. Copy ly ----
if [ -d "dotfiles/ly" ]; then
    sudo cp -r dotfiles/ly /etc/
else
    echo "dotfiles/ly directory missing."
fi

# ---- 7. Done ----
printf "\033[1;32mDone\033[0m\n"
