{...}: {
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    reload_style_on_change = true;
    height = 5;
    margin-top = 0;
    margin-bottom = 0;
    margin-left = 0;
    margin-right = 0;
    modules-left = [
      "custom/launcher"
      "wlr/taskbar"
      "hyprland/workspaces"
    ];
    modules-center = [
      "hyprland/window"
    ];
    modules-right = [
      "network"
      "pulseaudio"
      "battery"
      "group/hardware"
      "clock"
      "custom/notification"
      "custom/exit"
    ];
  };
}
