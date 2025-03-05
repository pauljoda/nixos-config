{ pkgs, ... }:
{
  # Templates
  xdg.configFile."wal/templates/colors-hyprland".source = ./templates/colors.hyprland;
  xdg.configFile."wal/templates/colors-rofi-dark.rasi".source = ./templates/colors-rofi-dark.rasi;

  Color Schemes
  xdg.configFile."wal/colorschemes/dark/ywal16.jsonconfig.json".source = ./colorschemes/dark/ywal16.jsonconfig.json;
}