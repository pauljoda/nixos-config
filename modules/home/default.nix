{
  inputs,
  username,
  host,
  ...
}: {
  imports = [
    ./audacious/audacious.nix # music player
    ./bat.nix # better cat command
    ./browser.nix
    ./btop.nix # resources monitor
    ./cava.nix # audio visualizer
    ./dms.nix
    ./git.nix # version control
    ./ghostty.nix # TTY
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./hyprtasking.nix # Workspace viewer
    ./kitty.nix # terminal (backup)
    ./nvim.nix # neovim editor
    #./noctalia.nix
    ./packages.nix # other packages
    ./starship # shell prompt
    ./vscode.nix # vscode fork
    ./xdg-mimes.nix
    ./zsh # shell
  ];
}
