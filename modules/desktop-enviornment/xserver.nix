{
  pkgs,
  username,
  ...
}: {
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };

    # displayManager.autoLogin = {
    #   enable = true;
    #   user = "${username}";
    # };
    libinput = {
      enable = true;
      # mouse = {
      #   accelProfile = "flat";
      # };
    };
  };
  # To prevent getting stuck at shutdown
  #services.logind.settings.Login = "DefaultTimeoutStopSec=10s";
}
