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
        command = "ghostty"
        class = "com.mitchellh.ghostty"
        unfocus = "hide"
        lazy = true
        size = "75% 60%"
  '';
}