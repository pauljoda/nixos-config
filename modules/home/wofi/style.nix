{
  lib,
  inputs,
  config,
  ...
}: let
  colors = config.lib.stylix.colors.withHashtag;
in {
  xdg.configFile."wofi/style.css".text = ''
    @keyframes fadeIn {
        0% {
        }
        100% {
        }
    }
    * {
        all:unset;
        font-family: 'CodeNewRoman Nerd Font Mono', monospace;
        font-size: 18px;
        outline: none;
        border: none;
        text-shadow:none;
    }
    window {
        padding: 20px;
        border-radius: 0px;
    }
    #inner-box {
        margin: 2px;
        padding: 5px
        border: none;
    }
    #outer-box {
        border: none;
    }
    #scroll {
        margin: 0px;
        padding: 30px;
        border: none;
    }
    #input {
        all:unset;
        margin-left:20px;
        margin-right:20px;
        margin-top:20px;
        padding: 20px;
        border: none;
        outline: none;
        border-radius:10;
    }
    #entry:nth-child(odd) {
        background-color: ${colors.base00};
    }

    #entry:nth-child(even) {
        background-color: ${colors.base00};
    }
    #input image {
        border: none;
        padding-right:10px;
    }
    #input * {
        border: none;
        outline: none;
    }
    #input:focus {
        outline: none;
        border: none;
        border-radius:10;
    }
    #text {
        margin: 5px;
        border: none;
        outline: none;
    }
    #entry {
        border: none;
        margin: 5px;
        padding: 10px;
    }
    #entry arrow {
        border: none;
    }
    #entry:selected {
        border-radius: 20px;
        background-color: ${colors.base02};
    }
  '';

  xdg.configFile."wofi/style-wallpaper.css".text = ''
    * {
        all:unset;
        font-family: 'CodeNewRoman Nerd Font Mono', monospace;
        font-size: 18px;
        outline: none;
        border: none;
        text-shadow:none;
    }
    window {
        background-color: ${colors.base00};
        color: ${colors.base05};
        padding: 20px;
        border-radius: 0px;
    }
    #inner-box {
        margin: 2px;
        padding: 5px;
        border: none;

    }
    #outer-box {
        border: none;
    }
    #scroll {
        margin: 0px;
        padding: 30px;
        border: none;
    }
    #input {
        all:unset;
        margin-left:20px;
        margin-right:20px;
        margin-top:20px;
        padding: 20px;
        border: none;
        outline: none;
        border-radius:10;
    }
    #input image {
        border: none;
        padding-right:10px;
    }
    #input * {
        border: none;
        outline: none;
    }
    #input:focus {
        outline: none;
        border: none;
        border-radius:10;
    }
    #text {
        margin: 5px;
        border: none;
        outline: none;
    }
    #entry {
        all:unset;
        padding: 20 0 20 45;
    }
    #entry arrow {
        border: none;

    }
    #entry:selected {
        border-radius: 20px;
        background-color: ${colors.base02};
    }
  '';
}
