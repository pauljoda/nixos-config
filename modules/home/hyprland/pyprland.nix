{ pkgs, ... }:
{
  home.packages = [ pkgs.pyprland ];
  xdg.configFile."hypr/pyprland.toml".text = ''
    [pyprland]

    plugins = [
    "scratchpads",
    "magnify",
    ]

    [scratchpads.term]
    animation = "fromTop"
    command = "ghostty --class main-dropterm"
    class = "main-dropterm"
    size = "75% 60%"
  '';
}
