{ pkgs, ... }:
{  
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
    
      ];
    };

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
  hardware.enableRedistributableFirmware = true;

  # Thunderbolt
  services.hardware.bolt.enable = true;

  # Bluetooth
  services.blueman.enable = true;
}
