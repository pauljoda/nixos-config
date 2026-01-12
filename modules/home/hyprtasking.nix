# home.nix
{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    plugins = [
      inputs.hyprtasking.packages.${pkgs.system}.hyprtasking
    ];

    settings = {
      plugin = {
        hyprtasking = {
          layout = "grid";

          gap_size = 2;
          #bg_color = "0x${config.lib.stylix.colors.base05-hex}ff";
          border_size = 1;

          #exit_behavior = "hovered";
        };
      };
    };
  };
}
