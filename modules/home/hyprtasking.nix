# home.nix
{
  inputs,
  pkgs,
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
          bg_color = "$color9";
          border_size = 1;

          exit_behavior = "hovered";
        };
      };
    };
  };
}
