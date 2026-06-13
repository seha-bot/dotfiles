{
  programs.waybar = {
    enable = true;

    style = ./style.css;
    settings.mainBar = {
      height = 30;
      spacing = 4;
      modules-left = [ "niri/workspaces" ];
      modules-center = [ "niri/window" ];
      modules-right = [
        "network"
        "power-profiles-daemon"
        "temperature"
        "niri/language"
        "pulseaudio"
        "battery"
        "clock"
        "tray"
      ];
      "niri/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = "0";
          "2" = "1";
          "3" = "2";
          "4" = "3";
          "5" = "4";
          "6" = "5";
          "7" = "6";
          "8" = "7";
          "9" = "8";
          "10" = "9";
        };
      };
      network = {
        format-wifi = "{essid} ({signalStrength}%)";
        format-ethernet = "{ipaddr}/{cidr}";
        tooltip-format = "{ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "Disconnected";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      power-profiles-daemon.format-icons = {
        default = "P";
        performance = "P";
        balanced = "B";
        power-saver = "S";
      };
      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C";
      };
      pulseaudio = {
        format = "{volume}% {format_source}";
        format-bluetooth = "{volume}% {format_source}";
        format-bluetooth-muted = "MUT {format_source}";
        format-muted = "MUT {format_source}";
        format-source = "";
        format-source-muted = " ";
        on-click = "pavucontrol";
      };
      battery = {
        format = "BAT {capacity}%";
        format-full = "FULL";
        format-charging = "CHR {capacity}%";
        format-alt = "{time}";
      };
      clock.format = "{:%d %b, %a, %H:%M}";
      tray.spacing = 10;
    };
  };
}
