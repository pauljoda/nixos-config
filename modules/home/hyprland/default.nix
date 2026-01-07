{inputs, ...}: {
  imports = [
    ./hyprland.nix
    ./config.nix
    ./variables.nix
    ./pyprland.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
