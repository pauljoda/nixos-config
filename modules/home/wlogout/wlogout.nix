{
  inputs,
  pkgs,
  host,
  config,
  username,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
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

  xdg.configFile."wlogout/style.css".text = ''
    * {
    	background-image: none;
    	box-shadow: none;
    }

    window {
    	background-color: rgba(12, 12, 12, 0.9);
    }

    button {
      border-radius: 0;
      border-color: black;
    	text-decoration-color: ${colors.base05};
      color: ${colors.base03};
    	background-color: ${colors.base00};
    	border-style: solid;
    	border-width: 1px;
    	background-repeat: no-repeat;
    	background-position: center;
    	background-size: 25%;
    }

    button:focus, button:active, button:hover {
    	background-color: ${colors.base02};
    	outline-style: none;
    }

    #lock {
        background-image: image(url("/home/${username}/.config/wlogout/icons/lock.png"));
    }

    #logout {
        background-image: image(url("icons/logout.png"));

    #suspend {
        background-image: image(url("icons/suspend.png"));
    }

    #hibernate {
        background-image: image(url("icons/hibernate.png"));
    }

    #shutdown {
        background-image: image(url("icons/shutdown.png"));
    }

    #reboot {
        background-image: image(url("icons/reboot.png"));
    }
  '';
}
