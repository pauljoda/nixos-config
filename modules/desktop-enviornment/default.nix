{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}: {
  imports = [
    ./dms.nix
    ./flatpak.nix
    ./pipewire.nix
    ./services.nix
    ./steam.nix
    ./wayland.nix
    ./xserver.nix
  ];
}
