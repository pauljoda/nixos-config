{
  pkgs,
  inputs,
  host,
  ...
}: {
  home.packages = [
    #pkgs.pyprland
    inputs.pyprland.packages."${pkgs.stdenv.hostPlatform.system}".pyprland
  ];
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
    multi = false
    unfocus = "hide"
    lazy = true
    size = "75% 60%"
  '';
}
