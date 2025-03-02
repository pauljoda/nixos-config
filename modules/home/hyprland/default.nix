{ inputs, ... }: 
{
  imports = [ (import ./hyprland.nix) ]
    ++ [ (import ./config.nix) ]
    ++ [ (import ./hyprlock.nix) ]
    ++ [ (import ./variables.nix) ]
    ++ [ (import ./pyprland.nix)]
    ++ [ inputs.hyprland.homeManagerModules.default ];
}
