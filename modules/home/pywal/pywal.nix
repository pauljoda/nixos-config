{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    imagemagick
     pywal16
      ]);


  #programs.pywalfox.enable = true;
}