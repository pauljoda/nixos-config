{inputs, username, host, ...}: {
  imports = [
    ./audacious/audacious.nix       # music player
    ./bat.nix                       # better cat command
    ./browser.nix
    ./btop.nix                      # resources monitor 
    ./cava.nix                      # audio visualizer
    ./discord.nix                   # discord with catppuccin theme
    ./gaming.nix                    # packages related to gaming
    ./git.nix                       # version control
    ./ghostty.nix                   # TTY
    ./gtk.nix                       # gtk theme
    ./hyprland                      # window manager
    ./kitty.nix                     # terminal
    ./swaync/swaync.nix             # notification daemon
    ./micro.nix                     # nano replacement
    ./nvim.nix                      # neovim editor
    ./packages.nix                  # other packages
    ./pywal                         # Auto Theming
    ./retroarch.nix                 # retroarch
    ./scripts/scripts.nix           # personal scripts
    ./starship                  # shell prompt
    # ./steam.nix                     # Games
    ./swaylock.nix                  # lock screen
    ./vscode.nix                    # vscode fork
    ./waybar                        # status bar
    ./wofi
    ./xdg-mimes.nix
    ./zsh                           # shell
  ];
}
