{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
      ];

      monitor = "eDP-1, 1920x1080@144Hz, 0x0, 1";
      monitor = "HDMI-A-1, 1920x1080@239.76Hz, -1920x0, 1";
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "nemo";
      "$menu" = "wofi --show drun";

      exec-once = [
        "waybar"
      ];

      general = {
        gaps_in = 0;
        gaps_out = 0;

        border_size = 2;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        resize_on_border = true;

        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
            range = 4;
            render_power = 3;
            color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
            size = 3;
            passes = 1;

            vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = "easeOutQuint,0.23,1,0.32,1";
        bezier = "easeInOutCubic,0.65,0.05,0.36,1";
        bezier = "linear,0,0,1,1";
        bezier = "almostLinear,0.5,0.5,0.75,1.0";
        bezier = "quick,0.15,0,0.1,1";

        animation = "global, 1, 10, default";
        animation = "border, 1, 5.39, easeOutQuint";
        animation = "windows, 1, 4.79, easeOutQuint";
        animation = "windowsIn, 1, 4.1, easeOutQuint, popin 87%";
        animation = "windowsOut, 1, 1.49, linear, popin 87%";
        animation = "fadeIn, 1, 1.73, almostLinear";
        animation = "fadeOut, 1, 1.46, almostLinear";
        animation = "fade, 1, 3.03, quick";
        animation = "layers, 1, 3.81, easeOutQuint";
        animation = "layersIn, 1, 4, easeOutQuint, fade";
        animation = "layersOut, 1, 1.5, linear, fade";
        animation = "fadeLayersIn, 1, 1.79, almostLinear";
        animation = "fadeLayersOut, 1, 1.39, almostLinear";
        animation = "workspaces, 1, 1.94, almostLinear, fade";
        animation = "workspacesIn, 1, 1.21, almostLinear, fade";
        animation = "workspacesOut, 1, 1.94, almostLinear, fade";
      };

      cursor {
        no_hardware_cursors = false; # Disable hardware cursors, use software cursors instead
      };

      input = {
        kb_layout = "us, ua";
        kb_variant =;
        kb_model =;
        kb_options = "grp:win_space_toggle";
        kb_rules =;

        follow_mouse = 1;

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = false;
        workspace_swipe_forever	= true;
      };

      device {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
      };

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, $menu,"
        "$mainMod, B, exec, $browser,"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, 1, exec, hyprsome workspace 1"
        "$mainMod, 2, exec, hyprsome workspace 2"
        "$mainMod, 3, exec, hyprsome workspace 3"
        "$mainMod, 4, exec, hyprsome workspace 4"
        "$mainMod, 5, exec, hyprsome workspace 5"
        "$mainMod, 6, exec, hyprsome workspace 6"
        "$mainMod, 7, exec, hyprsome workspace 7"
        "$mainMod, 8, exec, hyprsome workspace 8"

        "$mainMod SHIFT, 1, exec, hyprsome move 1"
        "$mainMod SHIFT, 2, exec, hyprsome move 2"
        "$mainMod SHIFT, 3, exec, hyprsome move 3"
        "$mainMod SHIFT, 4, exec, hyprsome move 4"
        "$mainMod SHIFT, 5, exec, hyprsome move 5"
        "$mainMod SHIFT, 6, exec, hyprsome move 6"
        "$mainMod SHIFT, 7, exec, hyprsome move 7"
        "$mainMod SHIFT, 8, exec, hyprsome move 8"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      workspace = [
        "1, monitor:eDP-1, default:true"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"

        "9, monitor:HDMI-A-1, default:true"
        "10, monitor:HDMI-A-1"
        "11, monitor:HDMI-A-1"
        "12, monitor:HDMI-A-1"
        "13, monitor:HDMI-A-1"
        "14, monitor:HDMI-A-1"
        "15, monitor:HDMI-A-1"
        "16, monitor:HDMI-A-1"
      ];

      windowrule = [
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}