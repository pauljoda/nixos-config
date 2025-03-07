{ lib, inputs, ... }:
{
  programs.wofi.enable = true;

  # Configs
  # Main Config for app launching
  xdg.configFile."wofi/config".text = ''
    [config]
    allow_images=true
    width=500
    show=drun
    prompt=Search
    height=400
    term=ghostty
    hide_scroll=true
    print_command=true
    insensitive=true
    columns=1
    no_actions=true
  '';

  # Wallpaper
  xdg.configFile."wofi/wallpaper".text = ''
    [config]
    allow_images=true
    show=drun
    width=800
    height=600
    always_parse_args=true
    show_all=true
    term=ghostty
    hide_scroll=true
    print_command=true
    insensitive=true
    columns=4
    image_size=150
  '';

  # Waybar
  xdg.configFile."wofi/waybar".text = ''
    [config]
    allow_images=true
    show=drun
    width=1200
    height=600
    always_parse_args=true
    show_all=true
    term=ghostty
    hide_scroll=true
    print_command=true
    insensitive=true
    columns=1
    image_size=1050
  '';
}