{
  config,
  libs,
  pkgs,
  lib,
  inputs,
  ...
}: let
  nvidiaPackage = config.hardware.nvidia.package;
in {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./../../modules/desktop-enviornment
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    ./../../modules/core/ai.nix
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };

  # enable the open source drivers if the package supports it
  hardware.nvidia.open = lib.mkOverride 990 (nvidiaPackage ? open && nvidiaPackage ? firmware);

  services.xserver.videoDrivers = lib.mkDefault ["nvidia"];

  powerManagement.cpuFreqGovernor = "performance";

  #Load necessary modules at boot
  boot.initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
}
