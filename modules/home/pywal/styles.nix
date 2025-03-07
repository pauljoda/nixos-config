{ pkgs, ... }:
{
  # Templates
  xdg.configFile."wal/templates/colors-hyprland".source = ./templates/colors-hyprland;
  xdg.configFile."wal/templates/colors-rofi-dark.rasi".source = ./templates/colors-rofi-dark.rasi;
  xdg.configFile."wal/templates/colors-ghostty".source = ./templates/colors-ghostty;

  # Color Schemes
  xdg.configFile."wal/colorschemes/dark/ywal16.json".source = ./colorschemes/dark/ywal16.json;
}