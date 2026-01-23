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
    inputs.comfyui-nix.nixosModules.default
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

  #environment.systemPackages = with pkgs; [searxng];

  services = {
    ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
    };

    open-webui = {
      enable = true;
      host = "0.0.0.0";
    };

    searx = {
      enable = true;
      redisCreateLocally = true;
      settings = {
        server = {
          base_url = "https://search.pauljoda.com";
          port = 8888;
          bind_address = "127.0.0.1";
          secret_key = "some-secret-no-peaking";
          limiter = true;
          public_instance = true;
          image_proxy = true;
          method = "GET";
        };
        search.formats = ["html" "json"];
      };
    };

    comfyui = {
      enable = true;
      cuda = true; # Enable NVIDIA GPU acceleration (recommended for most users)
      # cudaCapabilities = [ "8.9" ];  # Optional: optimize system CUDA packages for RTX 40xx
      #   Note: Pre-built PyTorch wheels already support all GPU architectures
      enableManager = true; # Enable the built-in ComfyUI Manager
      port = 8188;
      listenAddress = "0.0.0.0"; # Use "0.0.0.0" for network access
      dataDir = "/home/${username}/comfyui-data";
      user = "${username}";
      group = "users";
      openFirewall = false;
      # extraArgs = [ "--lowvram" ];
      # environment = { };
    };
  };

  # enable the open source drivers if the package supports it
  hardware.nvidia.open = lib.mkOverride 990 (nvidiaPackage ? open && nvidiaPackage ? firmware);

  services.xserver.videoDrivers = lib.mkDefault ["nvidia"];

  powerManagement.cpuFreqGovernor = "performance";
}
