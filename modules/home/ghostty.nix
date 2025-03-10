{
  inputs,
  pkgs,
  host,
  config,
  ...
}: {
  home.packages = with pkgs; [ghostty];

  programs.ghostty.enable = true;
}
