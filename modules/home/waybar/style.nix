{...}: let
  custom = {
    font = "JetBrainsMono Nerd Font";
    font_size = "15px";
    font_weight = "bold";
    text_color = "#cdd6f4";
    secondary_accent = "89b4fa";
    tertiary_accent = "f5f5f5";
    background = "11111B";
    opacity = "0.98";
  };
in {
  programs.waybar.style = ''
    @import url('../../.cache/wal/colors-waybar.css');

    * {
        font-size:15px;
        font-family: "CodeNewRoman Nerd Font Propo";
    }
    window#waybar{
        all:unset;
    }
    .modules-left {
        padding:7px;
        margin:10 0 5 10;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
    }
    .modules-center {
        padding:7px;
        margin:10 0 5 0;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
    }
    .modules-right {
        padding:7px;
        margin: 10 10 5 0;
        border-radius:10px;
        background: alpha(@background,.6);
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
    }
    tooltip {
        background:@background;
        color: @color7;
    }
    #clock:hover,#custom-exit:hover, #custom-pacman:hover, #custom-notification:hover,#bluetooth:hover, #network:hover, #battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
        transition: all .3s ease;
        color:@color9;
    }
    #wlr-taskbar{
        padding: 10px;
    }
    #custom-notification {
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;
    }
    #clock{
        padding: 0px 5px;
        color:@color7;
        transition: all .3s ease;
    }
    #workspaces, #window {
        padding: 0px 5px;
    }
    #workspaces button {
        all:unset;
        padding: 0px 5px;
        color: alpha(@color9,.4);
        transition: all .2s ease;
    }
    #workspaces button:hover {
        color:rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
    }
    #workspaces button.active {
        color: @color9;
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
    }
    #workspaces button.empty {
        color: rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
    }
    #workspaces button.empty:hover {
        color: rgba(0,0,0,0);
        border: none;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
        transition: all 1s ease;
    }
    #workspaces button.empty.active {
        color: @color9;
        border: none;
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
    }
    #bluetooth{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;

    }
    #network, #pulseaudio, #custom-exit{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;

    }
    #battery{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;


    }
    #battery.charging {
        color: #26A65B;
    }

    #battery.warning:not(.charging) {
        color: #ffbe61;
    }

    #battery.critical:not(.charging) {
        color: #f53c3c;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
    }
    #group-expand{
        padding: 0px 5px;
        transition: all .3s ease;
    }
    #custom-expand{
        padding: 0px 5px;
        color:alpha(@foreground,.2);
        text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
        transition: all .3s ease;
    }
    #custom-expand:hover{
        color:rgba(255,255,255,.2);
        text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
    }
    #custom-colorpicker{
        padding: 0px 5px;
    }
    #cpu,#memory,#temperature{
        padding: 0px 5px;
        transition: all .3s ease;
        color:@color7;

    }
    #custom-endpoint{
        color:transparent;
        text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);

    }
    #tray, #custom-launcher{
        padding: 0px 10px;
        transition: all .3s ease;

    }
    #tray menu * {
        padding: 0px 5px;
        transition: all .3s ease;
    }

    #tray menu separator {
        padding: 0px 5px;
        transition: all .3s ease;
    }
  '';
}
