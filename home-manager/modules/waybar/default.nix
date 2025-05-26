{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];
        modules-right = ["hyprland/language" "pulseaudio" "memory" "cpu" "battery" "clock" "network" "tray"];
        "hyprland/workspaces" = {
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          format = "{icon}";

          persistent-workspaces = {
            "*" = 8;
          };
        };

        "hyprland/language" = {
          format-en = "🇺🇸";
          format-ua = "🇺🇦";
          min-length = 5;
          tooltip = false;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "";
          format-icons = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          on-click = "pavucontrol";
        };

        "network" = {
        format-wifi = " ";
        format-ethernet = "ethernet";
        format-disconnected = " ";
        tooltip-format-disconnected = "Error";
        tooltip-format-wifi = "{essid} ({signalStrength}%)  ";
        tooltip-format-ethernet = "{ifname} 🖧";
        on-click = "alacritty nmtui";
        };

        "cpu" = {
          format = "  {usage}%";
          tooltip = false;
        };

        "memory" = {
          format = "  {used:0.1f}G";
          tooltip = false;
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 1;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" ""];
        };

        "clock" = {
          format = "{:%d.%m.%Y - %H:%M}";
          format-alt = "{:%A, %B %d at %R}";
        };

        "tray" = {
          icon-size = 14;
          spacing = 1;
        };
      };
    };
  };
}