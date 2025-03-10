{
  username,
  pkgs,
  ...
}: {
  security.rtkit.enable = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = {};

  security.sudo = {
    enable = true;
    extraRules = [
      {
        groups = ["wheel"];
        commands = [
          {
            command = "/home/${username}/nixos-config/modules/home/scripts/scripts/nixtest.sh";
            options = ["SETENV" "NOPASSWD"];
          }
        ];
        runAs = "root";
      }
    ];
  };
}
