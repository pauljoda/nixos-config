{
  config,
  libs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./../../modules/desktop-enviornment
  ];

  powerManagement.cpuFreqGovernor = "performance";
}
