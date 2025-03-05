{ ... }:
{
  programs.waybar.settings.mainBar = {
    position = "top";
    layer = "top";
    reload_style_on_change = true;
    height= 5;
    margin-top= 0;
    margin-bottom= 0;
    margin-left= 0;
    margin-right= 0;
    modules-left = [
        "custom/notification"
        "clock"
        "custom/pacman"
        "tray"
    ];
    modules-center = [
        "hyprland/workspaces"
    ];
    modules-right = [
        "group/expand"
        "bluetooth"
        "network"
        "battery"
    ];

    clock = {
        calendar = {
          format = { today = "<span color='#fAfBfC'><b>{}</b></span>"; };
        };
        format = "{:%I:%M:%S %p} ";
        tooltip= "true";
        tooltip-format= "<tt>{calendar}</tt>";
        format-alt= " {:%d/%m}";
        interval = 1;
        actions = {
            on-click-right = "shift_down";
            on-click = "shift_up";
        };
    };

    "hyprland/workspaces"= {
        active-only= false;
        disable-scroll= true;
        format = "{icon}";
        on-click= "activate";
        format-icons= {
            active = "";
            default = "";
            empty = "";
            urgent= "";
            sort-by-number= true;
        };
        persistent-workspaces = {
            "*" = [ 1 2 3 4 5 ];
        };
    };

    memory= {
        format= "";
        format-alt= "󰟜 {used} GiB"; # 
        interval= 2;
    };

    cpu= {
        format= "󰻠";
        format-alt= "  {avg_frequency} GHz";
        interval= 2;
        tooltip = true;
    };

    disk = {
        # path = "/";
        format = "󰋊 {percentage_used}%";
        interval= 60;
    };

    network = {
        format-wifi = "";
        format-ethernet = "";
        format-disconnected = "";
        tooltip-format-disconnected = "Error";
        tooltip-format-wifi = "{essid} ({signalStrength}%) ";
        tooltip-format-ethernet = "{ifname} 🖧 ";
        on-click = "kitty nmtui";
    };

    tray= {
        icon-size = 14;
        spacing = 10;
    };

    pulseaudio= {
        format= "{icon} {volume}%";
        format-muted= "  {volume}%";
        format-icons= {
            default= [" "];
        };
        scroll-step= 5;
        on-click= "pamixer -t";
    };

    battery = {
        format = "{capacity}% {icon}";
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

    "custom/launcher"= {
        format= "";
        on-click= "fuzzel";
        on-click-right= "wallpaper-picker"; 
        tooltip= "false";
    };

    "custom/notification" = {
        tooltip = false;
        format = "";
        format-icons = {
            notification = "<span foreground='red'><sup></sup></span>   ";
            none = "   ";
            dnd-notification = "<span foreground='red'><sup></sup></span>   ";
            dnd-none = "   ";
            inhibited-notification = "<span foreground='red'><sup></sup></span>   ";
            inhibited-none = "   ";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>   ";
            dnd-inhibited-none = "   ";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
    };

    "custom/pacman" = {
        format = "󰅢 {}";
        interval = 30;
        exec = "checkupdates | wc -l";
        exec-if = "exit 0";
        on-click = "kitty sh -c 'yay -Syu; echo Done - Press enter to exit; read'; pkill -SIGRTMIN+8 waybar";
        signal = 8;
        tooltip = false;
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

    "custom/colorpicker" = {
        format = "{}";
        return-type = "json";
        interval = "once";
        exec = "~/.config/waybar/scripts/colorpicker.sh -j";
        on-click = "~/.config/waybar/scripts/colorpicker.sh";
        signal = 1;
    };

    temperature = {
        critical-threshold = 80;
        format = "";
    };

    bluetooth = {
        format-on = "󰂯";
        format-off = "BT-off";
        format-disabled = "󰂲";
        format-connected-battery = "{device_battery_percentage}% 󰂯";
        format-alt = "{device_alias} 󰂯";
        tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
        tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
        tooltip-format-enumerate-connected = "{device_alias}\n{device_address}";
        tooltip-format-enumerate-connected-battery = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
        on-click-right = "blueman-manager";
    };
  };
}
