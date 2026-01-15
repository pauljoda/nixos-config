{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}: {
  imports = [
    ./bootloader.nix
    ./nh.nix
    ./hardware.nix
    ./network.nix
    ./program.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./user.nix
    ./virtualization.nix
  ];
}
