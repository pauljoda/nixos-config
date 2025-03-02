{inputs, username, host, ...}: {
  imports = [
    # ./aseprite/aseprite.nix         # pixel art editor
    ./audacious/audacious.nix       # music player
    ./bat.nix                       # better cat command
    ./btop.nix                      # resources monitor 
    ./cava.nix                      # audio visualizer
    ./discord.nix                   # discord with catppuccin theme
    ./floorp/floorp.nix             # firefox based browser
    ./zen.nix                       # web browser
    ./fuzzel.nix                    # launcher
    ./gaming.nix                    # packages related to gaming
    ./git.nix                       # version control
    ./gtk.nix                       # gtk theme
    ./hyprland                      # window manager
    ./kitty.nix                     # terminal
    ./swaync/swaync.nix             # notification daemon
    ./micro.nix                     # nano replacement
    ./nvim.nix                      # neovim editor
    ./packages.nix                  # other packages
    ./retroarch.nix
    ./scripts/scripts.nix           # personal scripts
    ./spicetify.nix                 # spotify client
    ./starship.nix                  # shell prompt
    # ./steam.nix                     # Games
    ./swaylock.nix                  # lock screen
    ./vscode.nix                    # vscode fork
    ./waybar                        # status bar
    ./zsh.nix                       # shell
  ];
}
