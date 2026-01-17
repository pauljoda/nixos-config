{
  description = "pauljoda's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hyprtasking = {
      url = "github:raybbian/hyprtasking";
      inputs.hyprland.follows = "hyprland";
    };

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    pyprland = {
      type = "git";
      url = "https://github.com/hyprland-community/pyprland";
    };

    zen-browser.url = "github:youwen5/zen-browser-flake";

    nvim-bundle = {
      url = "github:jla2000/nvim-bundle";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    self,
    ...
  } @ inputs: let
    username = "paul";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/desktop)];
        specialArgs = {
          host = "desktop";
          inherit self inputs username;
        };
      };
      laptop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/laptop)];
        specialArgs = {
          host = "laptop";
          inherit self inputs username;
        };
      };
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/vm)];
        specialArgs = {
          host = "vm";
          inherit self inputs username;
        };
      };
      macbook-air-2013 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/macbook-air-2013)];
        specialArgs = {
          host = "macbook-air-2013";
          inherit self inputs username;
        };
      };
      dell-latitude-5440 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/dell-latitude-5440)];
        specialArgs = {
          host = "dell-latitude-5440";
          inherit self inputs username;
        };
      };
      custom-pc-2026 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [(import ./hosts/custom-pc-2026)];
        specialArgs = {
          host = "custom-pc-2026";
          inherit self inputs username;
        };
      };
    };
  };
}
