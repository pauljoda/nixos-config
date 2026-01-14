{pkgs, ...}: {
  programs.dms-shell = {
    enable = true;

    systemd = {
      enable = true;
      restartIfChanged = true;
    };

    enableSystemMonitoring = true;
    enableClipboard = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "hyprland";

    configHome = "/home/paul";
  };

  programs.dsearch = {
    enable = true;

    systemd = {
      enable = true;
      target = "graphical-session.target"; # Only start in graphical sessions
    };
  };
}
