{...}: {
  wayland.windowManager.hyprland = {
    settings = {
      "$mainMod" = "SUPER";

      # autostart
      exec-once = [
        "systemctl --user import-environment &"
        "hash dbus-update-activation-environment 2>/dev/null &"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
        "nm-applet &"
        "wl-clip-persist --clipboard both"
        "poweralertd &"
        "wl-paste --watch cliphist store &"
        "pypr &"
      ];

      input = {
        kb_layout = "us";
        kb_options = "grp:alt_caps_toggle";
        numlock_by_default = true;
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          clickfinger_behavior = true;
          middle_button_emulation = true;
          tap-to-click = true;
          drag_lock = false;
          scroll_factor = 0.5;
        };
      };

      device = {
        name = "mx-master-mouse";
        sensitivity = -0.7;
      };

      general = {
        layout = "dwindle";
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        #no_border_on_floating = false;
        resize_on_border = true;
        hover_icon_on_border = true;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
      };

      dwindle = {
        force_split = 0;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 20;
        rounding_power = 2;
        active_opacity = 0.90;
        inactive_opacity = 0.70;
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 3;
          passes = 5;
          # size = 4;
          # passes = 2;
          brightness = 1.3;
          contrast = 1.400;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
          popups = true;
        };

        shadow = {
          enabled = true;

          ignore_window = true;
          offset = "0 2";
          range = 15;
          render_power = 5;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "easeinoutsine, 0.37, 0, 0.63, 1"
        ];

        animation = [
          # Windows
          "windowsIn, 1, 3, easeOutCubic, popin 30%" # window open
          "windowsOut, 1, 3, fluent_decel, popin 70%" # window close.
          "windowsMove, 1, 2, easeinoutsine, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn, 1, 3, easeOutCubic" # fade in (open) -> layers and windows
          "fadeOut, 1, 2, easeOutCubic" # fade out (close) -> layers and windows
          "fadeSwitch, 0, 10, easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow, 1, 10, easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim, 1, 4, fluent_decel" # the easing of the dimming of inactive windows
          "border, 1, 2.7, easeOutCirc" # for animating the border's color switch speed
          "borderangle, 1, 30, fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces, 1, 4, easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      bind = [
        # show keybinds list
        "$mainMod, H, exec, dms ipc call keybinds toggle hyprland"

        # keybindings
        "$mainMod, Return, exec, ghostty"
        "ALT, Return, exec, [float; size 1111 700] ghostty"
        "$mainMod, B, exec, [workspace 1] zen"
        "$mainMod, V, exec, [workspace 2] code --enable-features=UseOzonePlatform --ozone-platform=wayland"
        "$mainMod, Q, killactive,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod SHIFT, F, fullscreen, 1"
        "$mainMod, O, togglefloating,"
        "$mainMod, SPACE, exec, dms ipc call spotlight toggle" # App launcher
        "$mainMod, I, exec, dms ipc call settings toggle" # Settings
        "$mainMod SHIFT, S, exec, hyprctl dispatch exec '[workspace 5 silent] SoundWireServer'"
        "$mainMod, Escape, exec, dms ipc call lock lock"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, C ,exec, hyprpicker -a"
        #"$mainMod, W,exec, noctalia-shell ipc call wallpaper toggle"
        "$mainMod SHIFT, W, exec, vm-start"

        # screenshot
        "$mainMod, Print, exec, grimblast --notify --freeze save area ~/Pictures/$(date +'%Y-%m-%d-At-%Ih%Mm%Ss').png"
        ",Print, exec, grimblast --notify --freeze copy area"

        # switch focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # switch workspace
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1" # movetoworkspacesilent
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod CTRL, c, movetoworkspace, empty"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"
        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"

        # Hyprtasking
        "$mainMod, tab, hyprtasking:toggle, cursor"

        # Dropdown terminal
        "$mainMod SHIFT, Return, exec, pypr toggle term"

        "$mainMod, N, exec, dms ipc call notepad toggle"

        # media and volume controls
        ",XF86AudioRaiseVolume,exec, dms ipc call audio increment 5"
        ",XF86AudioLowerVolume,exec, dms ipc call audio decrement 5"
        ",XF86AudioMute,exec, dms ipc call audio mute"
        ",XF86AudioPlay,exec, dms ipc call mpris playPause"
        ",XF86AudioNext,exec, dms ipc call mpris  next"
        ",XF86AudioPrev,exec, dms ipc call mpris  previous"
        ",XF86AudioStop, exec, dms ipc call mpris  stop"
        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"

        # laptop brigthness
        ",XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 ''"
        ",XF86MonBrightnessDown, exec,dms ipc call brightness decrement 5 ''"
        "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
        "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"

        # clipboard manager
        "ALT, V, exec, dms ipc call clipboard toggle"
      ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # Laptop Binding
      bindl = [
        ",switch:off:Lid Switch, exec, dms ipc call lock lock"
      ];

      # windowrule
      windowrule = [
        "match:class ^(imv)$, float on"
        "match:class ^(org.gnome.NautilusPreviewer)$, float on"
        "match:class ^(org.quickshell)$, float on"
        "match:class ^(imv)$, center on"
        "match:class ^(imv)$, size 1200 725"
        "match:class ^(mpv)$, float on"
        "match:class ^(mpv)$, center on"
        "match:class ^(mpv)$, size 1200 725"
        "match:title ^(float_ghostty)$, float on"
        "match:title ^(float_ghostty)$, center on"
        "match:title ^(float_ghostty)$, size 950 600"
        "match:class ^(audacious)$, float on"
        "match:class ^(audacious)$, workspace 8 silent"
        "match:class ^(neovide)$, tile on"
        "match:class ^(mpv)$, idle_inhibit focus"
        "match:class ^(udiskie)$, float on"
        "match:title ^(Transmission)$, float on"
        "match:title ^(Volume Control)$, float on"
        "match:title ^(Firefox — Sharing Indicator)$, float on"
        "match:title ^(Firefox — Sharing Indicator)$, move 0 0"
        "match:title ^(Volume Control)$, size 700 450"
        "match:title ^(Volume ControlControl)$, move 40 55%"

        "match:title ^(Picture-in-Picture)$, float on"
        "match:title ^(Picture-in-Picture)$, opacity 1.0 override 1.0 override"
        "match:title ^(Picture-in-Picture)$, pin on"
        "match:title ^(.*imv.*)$, opacity 1.0 override 1.0 override"
        "match:title ^(.*mpv.*)$, opacity 1.0 override 1.0 override"
        "match:class ^(mpv)$, idle_inhibit focus"
        "match:class ^(firefox)$, idle_inhibit fullscreen"
        "match:class ^(zenity)$, float on"
        "match:class ^(zenity)$, center on"
        "match:class ^(zenity)$, size 850 500"
        "match:class ^(pavucontrol)$, float on"
        "match:class ^(SoundWireServer)$, float on"
        "match:class ^(.sameboy-wrapped)$, float on"
        "match:class ^(file_progress)$, float on"
        "match:class ^(confirm)$, float on"
        "match:class ^(dialog)$, float on"
        "match:class ^(download)$, float on"
        "match:class ^(notification)$, float on"
        "match:class ^(error)$, float on"
        "match:class ^(confirmreset)$, float on"
        "match:title ^(Open File)$, float on"
        "match:title ^(branchdialog)$, float on"
        "match:title ^(Confirm to replace files)$, float on"
        "match:title ^(File Operation Progress)$, float on"
        "match:class ^(xwaylandvideobridge)$, opacity 0.0 override"
        "match:class ^(xwaylandvideobridge)$, no_anim on"
        "match:class ^(xwaylandvideobridge)$, no_initial_focus on"
        "match:class ^(xwaylandvideobridge)$, max_size 1 1"
        "match:class ^(xwaylandvideobridge)$, no_blur on"
      ];
    };

    extraConfig = "
      source = ~/.config/hypr/dms-colors.conf
      monitor=DP-2,5120x1440@60,1620x0,1
      monitor=eDP-1,1920x1080@60,3220x1440,1
      
      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
