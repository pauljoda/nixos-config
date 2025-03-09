{
  inputs,
  pkgs,
  host,
  ...
}: {
  programs.wlogout = {
    enable = true;
  };

  xdg.configFile."wlogout/layout".text = ''
      {
        "label" : "lock",
        "action" : "power lock",
        "text" : "Lock",
        "keybind" : "l"
    }
    {
        "label" : "logout",
        "action" : "power exit",
        "text" : "Log Out",
        "keybind" : "e"
    }
    {
        "label" : "suspend",
        "action" : "power suspend",
        "text" : "Suspend",
        "keybind" : "u"
    }
    {
        "label" : "reboot",
        "action" : "power reboot",
        "text" : "Restart",
        "keybind" : "r"
    }
    {
        "label" : "shutdown",
        "action" : "power shutdown",
        "text" : "Power Off",
        "keybind" : "s"
    }
  '';
}
