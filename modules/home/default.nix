{inputs, username, host, ...}: {
  imports = [
    ./audacious/audacious.nix       # music player
    ./bat.nix                       # better cat command
    ./browser.nix
    ./btop.nix                      # resources monitor 
    ./cava.nix                      # audio visualizer
    ./git.nix                       # version control
    ./ghostty.nix                   # TTY
    ./gtk.nix                       # gtk theme
    ./hyprland                      # window manager
    ./kitty.nix                     # terminal
    ./swaync/swaync.nix             # notification daemon
    ./nvim.nix                      # neovim editor
    ./packages.nix                  # other packages
    ./pywal                         # Auto Theming
    ./scripts/scripts.nix           # personal scripts
    ./starship                      # shell prompt
    ./vscode.nix                    # vscode fork
    ./waybar                        # status bar
    ./wofi
    ./xdg-mimes.nix
    ./zsh                           # shell
  ];
}
