{ inputs, nixpkgs, self, username, host, ...}:
{
  imports = [
    ./bootloader.nix
    ./nh.nix
    ./flatpak.nix
    ./hardware.nix
    ./xserver.nix
    ./network.nix
    ./pipewire.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./user.nix
    ./wayland.nix
    ./virtualization.nix
  ];
}
