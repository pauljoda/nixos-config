{inputs, ...}: {
  imports = [
    ./hyprland.nix
    ./config.nix
    #./hyprlock.nix
    ./variables.nix
    ./pyprland.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
