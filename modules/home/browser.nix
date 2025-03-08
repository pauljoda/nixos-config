{
  inputs,
  pkgs,
  host,
  ...
}: {
  home.packages = with pkgs; [
    inputs.zen-browser.packages."${system}".default
    firefoxpwa
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts = [pkgs.firefoxpwa];
  };
}
