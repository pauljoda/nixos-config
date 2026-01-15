{
  inputs,
  username,
  host,
  ...
}: {
  imports = [
    ./audacious/audacious.nix # music player
    ./bat.nix # better cat command
    ./browser.nix # Zen
    ./btop.nix # resources monitor
    ./cava.nix # audio visualizer
    ./dms.nix # Desktop shell
    ./git.nix # version control
    ./ghostty.nix # TTY
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./hyprtasking.nix # Workspace viewer
    ./kitty.nix # terminal (backup)
    ./nvim.nix # neovim editor
    #    ./dev.nix # Developer stuff
    ./packages.nix # other packages
    ./starship.nix # shell prompt
    ./vscode.nix # vscode fork
    ./xdg-mimes.nix
    ./zsh # shell
  ];
}
