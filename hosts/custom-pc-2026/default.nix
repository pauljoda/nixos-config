{
  config,
  libs,
  lib,
  pkgs,
  inputs,
  username,
  ...
}: let
  nvidiaPackage = config.hardware.nvidia.package;
in {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./../../modules/desktop-enviornment
    ./../../modules/core/ai.nix
  ];
  nixpkgs.overlays = [inputs.comfyui-nix.overlays.default];

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

  # allow local remote access to make it easier to toy around with the system
  services.openssh = {
    enable = true;
    ports = [22];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "yes";
    };
  };

  environment.systemPackages = with pkgs; [
    # Add gcc and tree-sitter-cli
    gcc
  ];

  # enable the open source drivers if the package supports it
  hardware.nvidia.open = lib.mkOverride 990 (nvidiaPackage ? open && nvidiaPackage ? firmware);

  services.xserver.videoDrivers = lib.mkDefault ["nvidia"];

  powerManagement.cpuFreqGovernor = "performance";
}
