{
  pkgs,
  config,
  inputs,
  ...
}: {
  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-59-6.18.7"
  ];

  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
    ./../../modules/desktop-enviornment
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    #inputs.nixos-hardware.nixosModules.apple-macbook-air-7
  ];

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    cpupower-gui
    powertop
  ];

  hardware = {
    #facetimehd.enable = true;

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

  services = {
    mbpfan.enable = true;

    # thermald.enable = true;
    # cpupower-gui.enable = true;
    power-profiles-daemon.enable = true;

    # Thunderbolt
    hardware.bolt.enable = true;

    # Bluetooth
    blueman.enable = true;

    upower = {
      enable = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 3;
      criticalPowerAction = "PowerOff";
    };

    # auto-cpufreq = {
    #   enable = true;
    #   settings = {
    #     battery = {
    #       governor = "performance";
    #       turbo = "auto";
    #     };
    #     charger = {
    #       governor = "performance";
    #       turbo = "auto";
    #     };
    #   };
    # };
  };

  powerManagement.cpuFreqGovernor = "performance";

  boot = {
    kernelModules = [
      "acpi_call"
      "wl"
    ];
    extraModulePackages = with config.boot.kernelPackages;
      [
        acpi_call
        cpupower
        broadcom_sta
      ]
      ++ [pkgs.cpupower-gui];
  };
}
