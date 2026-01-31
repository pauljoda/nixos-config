{
  inputs,
  pkgs,
  host,
  config,
  ...
}: {
  home.packages = with pkgs; [ghostty];

  programs.ghostty = {
    enable = true;
    settings = {
      "config-file" = "${config.home.homeDirectory}/.config/ghostty/themes/dankcolors";
      "app-notifications" = "no-clipboard-copy,no-config-reload";
    };
  };
}
