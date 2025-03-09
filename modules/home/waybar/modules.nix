{...}: {
  programs.waybar.settings.mainBar = {
    #######################
    # WORKSPACE MANAGEMENT
    #######################

    # Hyprland workspaces display
    # Shows available workspaces with scroll navigation
    "hyprland/workspaces" = {
      active-only = false;
      disable-scroll = true;
      format = "{icon}";
      on-click = "activate";
      format-icons = {
        active = "";
        default = "";
        empty = "";
        urgent = "";
        sort-by-number = true;
      };
      persistent-workspaces = {
        "*" = [1 2 3 4 5];
      };
    };

    # Window taskbar
    # Shows currently open applications with click actions
    "wlr/taskbar" = {
      format = "{icon}";
      "icon-size" = 18;
      "tooltip-format" = "{title}";
      "on-click" = "activate";
      "on-click-middle" = "close";
      "ignore-list" = ["com.mitchellh.ghostty" "ghostty" "kitty"];
      rewrite = {
        "Zen Browser" = "Zen";
      };
    };

    # Current window title
    # Shows focused window with title rewriting rules
    "hyprland/window" = {
      rewrite = {
        "(.*) - Zen Browser" = "$1";
        "(.*) - Outlook" = "$1";
        "(.*) Microsoft Teams" = "$1";
      };
      "separate-outputs" = true;
    };

    #######################
    # LAUNCHERS & MENUS
    #######################

    # Empty spacer module
    "custom/empty" = {
      format = "";
    };

    # App launcher
    "custom/launcher" = {
      format = ""; # Font Awesome launcher icon
      on-click = "wofi";
      on-click-right = "wallpaper";
      tooltip = "false";
    };

    # Power menu and lock screen
    "custom/exit" = {
      format = ""; # Font Awesome power icon
      "on-click" = "show-wlogout";
      "on-click-right" = "hyprlock";
      "tooltip-format" = "Left: Power menu\nRight: Lock screen";
    };

    # Calculator launcher
    "custom/calculator" = {
      format = ""; # Font Awesome calculator icon
      "on-click" = "qalculate-gtk";
      "tooltip-format" = "Open calculator";
    };

    # Tools button
    "custom/tools" = {
      format = ""; # Font Awesome tools icon
      "tooltip-format" = "Tools";
    };

    # System information header
    "custom/system" = {
      format = ""; # Font Awesome system icon
      tooltip = false;
    };

    #######################
    # SYSTEM INFORMATION
    #######################

    # CPU usage display
    cpu = {
      format = "/ C {usage}% ";
      "on-click" = "~/.config/ml4w/settings/system-monitor.sh";
    };

    # Memory usage display
    memory = {
      format = "/ M {}% ";
      "on-click" = "~/.config/ml4w/settings/system-monitor.sh";
    };

    # Storage space usage
    disk = {
      interval = 30;
      format = "D {percentage_used}% ";
      path = "/";
      "on-click" = "~/.config/ml4w/settings/system-monitor.sh";
    };

    # Keyboard layout indicator
    "hyprland/language" = {
      format = "/ K {short}";
    };

    # Temperature monitoring
    temperature = {
      critical-threshold = 80;
      format = ""; # Font Awesome temperature icon
    };

    #######################
    # NOTIFICATIONS & TRAY
    #######################

    # Notification center control
    "custom/notification" = {
      "tooltip-format" = "Left: Notifications\nRight: Do not disturb";
      format = "{icon}";
      "format-icons" = {
        notification = "<span foreground='red'><sup></sup></span>";
        none = "";
        "dnd-notification" = "<span foreground='red'><sup></sup></span>";
        "dnd-none" = "";
        "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
        "inhibited-none" = "!";
        "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
        "dnd-inhibited-none" = "!";
      };
      "return-type" = "json";
      "exec-if" = "which swaync-client";
      exec = "swaync-client -swb";
      "on-click" = "swaync-client -t -sw";
      "on-click-right" = "swaync-client -d -sw";
      escape = true;
    };

    # System tray for status icons
    tray = {
      "icon-size" = 21;
      spacing = 10;
    };

    #######################
    # PERIPHERALS STATUS
    #######################

    # Network connectivity
    network = {
      format = "{ifname}";
      "format-wifi" = "  {essid} ({signalStrength}%)"; # Font Awesome wifi icon
      "format-ethernet" = " {ifname}"; # Font Awesome ethernet icon
      "format-disconnected" = "Disconnected ⚠";
      "tooltip-format" = " {ifname} via {gwaddri}";
      "tooltip-format-wifi" = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\nUp: {bandwidthUpBits} Down: {bandwidthDownBits}";
      "tooltip-format-ethernet" = " {ifname}\nIP: {ipaddr}\n up: {bandwidthUpBits} down: {bandwidthDownBits}";
      "tooltip-format-disconnected" = "Disconnected";
      "max-length" = 50;
      "on-click" = "kitty nmtui";
    };

    # Bluetooth status
    bluetooth = {
      format = " {status}";
      "format-disabled" = "";
      "format-off" = "";
      interval = 30;
      "on-click" = "blueman-manager";
      "format-no-controller" = "";
    };

    # Battery status
    battery = {
      format = "{icon}{capacity}%";
      format-icons = [
        "󰁻"
        "󰁼"
        "󰁾"
        "󰂀"
        "󰂂"
        "󰁹"
      ];
      format-charging = "{capacity}% 󰂄";
      format-full = " {capacity}%";
      format-warning = " {capacity}%";
      interval = 30;
      states = {
        good = 95;
        warning = 30;
        critical = 20;
      };
      format-time = "{H}h{M}m";
      tooltip = true;
      tooltip-format = "{time}";
      format-plugged = "{capacity}% 󰂄 ";
      format-alt = "{time} {icon}";
    };

    # Power Profiles Daemon
    "power-profiles-daemon" = {
      format = "{icon}";
      "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
      tooltip = true;
      "format-icons" = {
        default = "";
        performance = "";
        balanced = "";
        "power-saver" = "";
      };
    };

    # Pulseaudio
    pulseaudio = {
      # scroll-step = 1; # %, can be a float
      format = "{icon}  {volume}%";
      "format-bluetooth" = "{volume}%{icon}={format_source}";
      "format-bluetooth-muted" = "  {icon}{format_source}";
      "format-muted" = "  {format_source}";
      "format-source" = "{volume}% ";
      "format-source-muted" = "";
      "format-icons" = {
        headphone = "";
        "hands-free" = "";
        headset = "";
        phone = " ";
        portable = "";
        car = "";
        default = ["" "" ""];
      };
      "on-click" = "pavucontrol";
    };

    # User
    user = {
      format = "{user}";
      interval = 60;
      icon = false;
    };

    # Backlight
    backlight = {
      format = "{icon} {percent}%";
      "format-icons" = [
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
        ""
      ];
      "scroll-step" = 1;
    };

    # Clock
    clock = {
      calendar = {
        format = {today = "<span color='#fAfBfC'><b>{}</b></span>";};
      };
      format = "{:%I:%M:%S %p} ";
      tooltip = "true";
      tooltip-format = "<tt>{calendar}</tt>";
      format-alt = " {:%d/%m}";
      interval = 1;
      actions = {
        on-click-right = "shift_down";
        on-click = "shift_up";
      };
    };

    # Keyboard State
    "keyboard-state" = {
      numlock = true;
      capslock = true;
      format = "{name} {icon}";
      "format-icons" = {
        locked = "";
        unlocked = "";
      };
    };

    "custom/expand" = {
      format = "";
      tooltip = false;
    };

    "custom/endpoint" = {
      format = "|";
      tooltip = false;
    };

    "group/expand" = {
      orientation = "horizontal";
      drawer = {
        transition-duration = 600;
        transition-to-left = true;
        click-to-reveal = true;
      };
      modules = [
        "custom/expand"
        "custom/colorpicker"
        "cpu"
        "memory"
        "temperature"
        "custom/endpoint"
      ];
    };

    # Group Hardware
    "group/hardware" = {
      orientation = "inherit";
      drawer = {
        "transition-duration" = 300;
        "children-class" = "not-memory";
        "transition-left-to-right" = false;
      };
      modules = ["custom/system" "disk" "cpu" "memory" "hyprland/language"];
    };

    # Group Tools
    "group/tools" = {
      orientation = "inherit";
      drawer = {
        "transition-duration" = 300;
        "children-class" = "not-memory";
        "transition-left-to-right" = false;
      };
      modules = [
        "custom/tools"
        "custom/cliphist"
        "custom/hypridle"
        "custom/hyprshade"
      ];
    };

    # Group Links
    "group/links" = {
      orientation = "horizontal";
      modules = [
        "custom/chatgpt"
        "custom/empty"
      ];
    };

    # Group Settings
    "group/settings" = {
      orientation = "inherit";
      drawer = {
        "transition-duration" = 300;
        "children-class" = "not-memory";
        "transition-left-to-right" = true;
      };
      modules = [
        "custom/settings"
        "custom/waybarthemes"
        "custom/wallpaper"
      ];
    };
  };
}
