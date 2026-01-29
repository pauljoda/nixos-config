{
  config,
  libs,
  lib,
  pkgs,
  inputs,
  username,
  ...
}: {
  imports = [
    inputs.comfyui-nix.nixosModules.default
  ];

  nixpkgs.overlays = [inputs.comfyui-nix.overlays.default];

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
      # cudaCapabilities = [ "8.9" ];  # Optional: optimize system CUDA packages for RTX 40xx
      #   Note: Pre-built PyTorch wheels already support all GPU architectures
      enableManager = true; # Enable the built-in ComfyUI Manager
      port = 8188;
      listenAddress = "0.0.0.0"; # Use "0.0.0.0" for network access
      #dataDir = "/home/${username}/comfyui-data";
      #user = "${username}";
      #group = "users";
      openFirewall = false;
      extraArgs = ["--lowvram"];
      customNodes = {
        rgthree-comfy = pkgs.fetchFromGitHub {
          owner = "rgthree";
          repo = "rgthree-comfy";
          rev = "8ff50e4521881eca1fe26aec9615fc9362474931";
          hash = "sha256-MueLFV5gaK6vPI0BEPxL3ZueOK2eFcZzajLyo95HrOE=";
        };

        # ComfyUI-VideoHelperSuite = pkgs.fetchFromGitHub {
        #   owner = "Kosinkadink";
        #   repo = "ComfyUI-VideoHelperSuite";
        #   rev = "993082e4f2473bf4acaf06f51e33877a7eb38960";
        #   hash = "sha256-oII4aAK8O44MBaxOATG7tAXmF1ESRm7nacNmj1E3pE8=";
        # };

        # ComfyUI-Custom-Scripts = pkgs.fetchFromGitHub {
        #   owner = "pythongosssss";
        #   repo = "ComfyUI-Custom-Scripts";
        #   rev = "f2838ed5e59de4d73cde5c98354b87a8d3200190";
        #   hash = "sha256-0DgPrOFXOjQ4K1RKxLQdtGfJHbopP8iovoJqna8d+Gg=";
        # };

        # ComfyUI_LayerStyle = pkgs.fetchFromGitHub {
        #   owner = "chflame163";
        #   repo = "ComfyUI_LayerStyle";
        #   rev = "3d53de09d8c1fb904d5cb0a137b9bc75e9d77108";
        #   hash = "sha256-y5pNP6BUiGJpKOTKyt4OkrfTM5ZmAZftTvM5UL1KOKw=";
        # };

        # ComfyUI-Frame-Interpolation = pkgs.fetchFromGitHub {
        #   owner = "Fannovel16";
        #   repo = "ComfyUI-Frame-Interpolation";
        #   rev = "757f8dfb576cc771a79c3b81ee0e6d5ac9559022";
        #   hash = "sha256-6uoLRrPDjhCACc7SCaUuxtuZISgm0jRYxiJ5dCGEaeQ=";
        # };

        # ComfyUI-Addoor = pkgs.fetchFromGitHub {
        #   owner = "Eagle-CN";
        #   repo = "ComfyUI-Addoor";
        #   rev = "a6b57907c07fe410acbdd5b4d3edf96c9bfeb435";
        #   hash = "sha256-+c4SB3eFZM8hPorkGTTyw10Ggng0fNdGoXlcShcVt4A=";
        # };

        # ComfyUI-mxToolkit = pkgs.fetchFromGitHub {
        #   owner = "Smirnov75";
        #   repo = "ComfyUI-mxToolkit";
        #   rev = "7f7a0e584f12078a1c589645d866ae96bad0cc35";
        #   hash = "sha256-0vf6rkDzUvsQwhmOHEigq1yUd/VQGFNLwjp9/P9wJ10=";
        # };
      };
      # environment = { };
    };
  };
}
