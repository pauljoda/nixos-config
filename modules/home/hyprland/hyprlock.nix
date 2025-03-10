{
  pkgs,
  username,
  config,
  ...
}: let
  colors = config.lib.stylix.colors;
in {
  home.packages = [pkgs.hyprlock];
  programs.hyprlock.enable = true;
  xdg.configFile."hypr/hyprlock.conf".text = ''
    # background {
    #     monitor =
    #     path = url("/home/${username}/nixos-config/nixos.png")
    #     blur_size = 5
    #     blur_passes = 3
    #     brightness = .6
    # }
    # input-field {
    #     monitor =
    #     outline_thickness = 0
    #     dots_rounding = 4
    #     dots_spacing = .5
    #     dots_fase_time = 300
    #     font_family = CodeNewRoman Nerd Font Propo
    #     fade_on_empty = false
    #     shadow_color = rgba(0,0,0,0.5)
    #     shadow_passes = 2
    #     shadow_size = 2
    #     rounding = 20
    #     placeholder_text = <i></i>
    #     fail_text = <b>FAIL</b>
    #     fail_timeout = 300
    #     position = 0, -100
    #     halign = center
    #     valign = center
    # }
    label {
        monitor =
        color = rgb(${colors.base05})
        text = cmd[update:1000] date +"<b>%I</b>"
        font_size = 200
        font_family = CodeNewRoman Nerd Font Propo
        shadow_passes = 0
        shadow_size = 5
        position = -120, 410
        halign = center
        valign = center
    }

    label {
        monitor =
        color = rgb(${colors.base03})
        text = cmd[update:1000] date +"<b>%M</b>"
        font_size = 200
        font_family = CodeNewRoman Nerd Font Propo
        shadow_passes = 0
        shadow_size = 5
        position = 120, 230
        halign = center
        valign = center
    }
    label {
        monitor =
        color = rgb(${colors.base04})
        text = cmd[update:1000] date +"<b>%A, %B %d, %Y</b>"
        font_size = 40
        font_family = CodeNewRoman Nerd Font Propo
        shadow_passes = 0
        shadow_size = 4
        position = -40,-20
        halign = right
        valign = top
    }
    label {
        monitor =
        color = rgb(${colors.base05})
        text = <i>Hello</i> <b>$USER</b>
        font_size = 40
        font_family = CodeNewRoman Nerd Font Propo
        shadow_passes = 0
        shadow_size = 4
        position = 40,-20
        halign = left
        valign = top
    }
  '';
}
