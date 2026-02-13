{
  pkgs,
  inputs,
  ...
}:
{
  nixpkgs.overlays = [
    inputs.comfyui-nix.overlays.default
    inputs.comfy-output-viewer.overlays.default
    (final: prev: {
      open-webui = final.callPackage ../../pkgs/open-webui/package.nix { };
    })
  ];

  imports = [
    inputs.comfyui-nix.nixosModules.default
    inputs.comfy-output-viewer.nixosModules.default
    ./whisper.nix
  ];

  environment.systemPackages = with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    claude-code
    opencode
    gemini-cli
    codex
    vibe-kanban
    # ... other tools
  ];

  networking.firewall.allowedTCPPorts = [ 10300 ];

  services = {
    ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
    };

    open-webui = {
      enable = true;
      host = "0.0.0.0";
      environment = {
        WEBUI_URL = "https://open-webui.pauljoda.com";
      };
    };

    comfyui = {
      enable = true;
      cuda = true; # Enable NVIDIA GPU acceleration (recommended for most users)
      enableManager = true; # Enable the built-in ComfyUI Manager
      port = 8188;
      listenAddress = "0.0.0.0"; # Use "0.0.0.0" for network access
      #dataDir = "/home/${username}/comfyui-data";
      #user = "${username}";
      #group = "users";
      openFirewall = false;
      extraArgs = [ "--lowvram" ];
      customNodes = {
        rgthree-comfy = pkgs.fetchFromGitHub {
          owner = "rgthree";
          repo = "rgthree-comfy";
          rev = "8ff50e4521881eca1fe26aec9615fc9362474931";
          hash = "sha256-MueLFV5gaK6vPI0BEPxL3ZueOK2eFcZzajLyo95HrOE=";
        };

        comfyui_controlnet_aux = pkgs.fetchFromGitHub {
          owner = "Fannovel16";
          repo = "comfyui_controlnet_aux";
          rev = "136f125c89aed92ced1b6fbb491e13719b72fcc0";
          hash = "sha256-DlspkqzN7Ls8kXWQMtVQygzsgu/z6FtjMqDthuza/Kc=";
        };

        ComfyUI_Easy_ImageResize = pkgs.fetchFromGitHub {
          owner = "sonyeon-sj";
          repo = "ComfyUI-easy_ImageSize_Selecter";
          rev = "ecf6dfb15432715bdea186f99692b286f1f48177";
          hash = "sha256-Uvokvxjk8RKIxa8w+2yIRPXgbDRgxqquKlrwVINFCrs=";
        };

        ComfyUI_ReActor = pkgs.fetchFromGitHub {
          owner = "Gourieff";
          repo = "ComfyUI-ReActor";
          rev = "5c7884118b4c56c04837204bafa4d2c9ae2ef6d4";
          hash = "sha256-iTt+Z7h6X/gw8pvuMm2t0HyaCLOcNeC6plvmaHFjoKo=";
        };

        ComfyUI_UltimateSDUpscale = pkgs.fetchFromGitHub {
          owner = "ssitu";
          repo = "ComfyUI_UltimateSDUpscale";
          rev = "48ffea161ffffe9be08733d7c03c50ca900242e0";
          hash = "sha256-RHefRQe0lSdpn8Kk84ASIJbJg8dt3YDsyGutrSEoYm0=";
        };
      };
      # environment = { };
    };

    comfy-output-viewer = {
      enable = true;
      openFirewall = true;
      outputDir = "/var/lib/comfyui/output";
      dataDir = "/var/lib/comfy-output-viewer";
      port = 8008;
      # syncIntervalMs = 60000;
      # thumbMax = 512;
      # thumbQuality = 72;
    };
  };
}
