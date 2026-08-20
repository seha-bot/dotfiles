{ pkgs, ... }:

{
  home.packages = [
    pkgs.vanilla-dmz
  ];

  wayland.windowManager.niri = {
    enable = true;
    xwaylandSatellitePackage = null;

    settings = {
      input = {
        keyboard = {
          xkb = {
            layout = "us,ba";
            options = "grp:win_space_toggle,compose:ralt";
          };
          repeat-delay = 200;
          repeat-rate = 40;
        };

        touchpad.tap = { };

        mouse = {
          # TODO: Setup mouse when you start using one.
          # off
          # natural-scroll
          # accel-speed 0.2
          # accel-profile "flat"
          # scroll-method "no-scroll"
        };

        # Focus windows and outputs automatically when moving the mouse into them.
        focus-follows-mouse._props.max-scroll-amount = "0%";

        # By default, niri will take over the power button to make it
        # sleep instead of power off.
        disable-power-key-handling = { };
      };

      cursor = {
        xcursor-theme = "Vanilla-DMZ";
        xcursor-size = 32;
      };

      layout = {
        empty-workspace-above-first = { };

        # Gaps around windows in logical pixels.
        gaps = 10;

        # The default width of new windows.
        default-column-width.proportion = 0.5;

        # Window borders.
        focus-ring = {
          # How many logical pixels the ring extends out from the windows.
          width = 4;

          # Color of the ring on the active monitor.
          active-color = "#7fc8ff";

          # Color of the ring on inactive monitors.
          # The focus ring only draws around the active window, so the only place
          # where you can see its inactive-color is on other monitors.
          inactive-color = "#505050";
        };

        background-color = "#000000";
      };

      hotkey-overlay.skip-at-startup = { };

      gestures.hot-corners.off = { };

      prefer-no-csd = { };

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      # Open the Firefox picture-in-picture player as floating by default.
      window-rule = {
        match._props = {
          app-id = "firefox$";
          title = "^Picture-in-Picture$";
        };
        open-floating = true;
      };

      # Disable alt tab.
      recent-windows.off = { };

      animations.slowdown = 0.8;

      binds = {
        # Show a list of important hotkeys.
        "Mod+Shift+Slash".show-hotkey-overlay = { };

        "Mod+Shift+Return" = {
          _props = {
            hotkey-overlay-title = "Open a Terminal: foot";
            repeat = false;
          };
          spawn = "foot";
        };
        "Mod+P" = {
          _props.hotkey-overlay-title = "Run an Application";
          spawn = [
            "rofi"
            "-show"
            "drun"
          ];
        };

        XF86AudioRaiseVolume = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+";
        };
        XF86AudioLowerVolume = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-";
        };
        XF86AudioMute = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        XF86AudioMicMute = {
          _props.allow-when-locked = true;
          spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };
        XF86AudioPlay = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl play-pause";
        };
        XF86AudioStop = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl stop";
        };
        XF86AudioPrev = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl previous";
        };
        XF86AudioNext = {
          _props.allow-when-locked = true;
          spawn-sh = "playerctl next";
        };

        "Mod+Y" = {
          _props.allow-when-locked = true;
          spawn = [
            "brightnessctl"
            "s"
            "1%+"
          ];
        };
        "Mod+Shift+Y" = {
          _props.allow-when-locked = true;
          spawn = [
            "brightnessctl"
            "s"
            "1%-"
          ];
        };

        "Mod+O" = {
          _props.repeat = false;
          toggle-overview = { };
        };

        "Mod+Shift+Q" = {
          _props.repeat = false;
          close-window = { };
        };

        "Mod+H".focus-column-left = { };
        "Mod+J".focus-window-or-workspace-down = { };
        "Mod+K".focus-window-or-workspace-up = { };
        "Mod+L".focus-column-right = { };

        "Mod+Shift+H".move-column-left = { };
        "Mod+Shift+J".move-window-down-or-to-workspace-down = { };
        "Mod+Shift+K".move-window-up-or-to-workspace-up = { };
        "Mod+Shift+L".move-column-right = { };

        "Mod+Ctrl+Left".focus-monitor-left = { };
        "Mod+Ctrl+Down".focus-monitor-down = { };
        "Mod+Ctrl+Up".focus-monitor-up = { };
        "Mod+Ctrl+Right".focus-monitor-right = { };
        "Mod+Ctrl+H".focus-monitor-left = { };
        "Mod+Ctrl+J".focus-monitor-down = { };
        "Mod+Ctrl+K".focus-monitor-up = { };
        "Mod+Ctrl+L".focus-monitor-right = { };

        "Mod+Shift+Ctrl+Left".move-window-to-monitor-left = { };
        "Mod+Shift+Ctrl+Down".move-window-to-monitor-down = { };
        "Mod+Shift+Ctrl+Up".move-window-to-monitor-up = { };
        "Mod+Shift+Ctrl+Right".move-window-to-monitor-right = { };
        "Mod+Shift+Ctrl+H".move-window-to-monitor-left = { };
        "Mod+Shift+Ctrl+J".move-window-to-monitor-down = { };
        "Mod+Shift+Ctrl+K".move-window-to-monitor-up = { };
        "Mod+Shift+Ctrl+L".move-window-to-monitor-right = { };

        "Mod+Ctrl+Page_Down".move-workspace-down = { };
        "Mod+Ctrl+Page_Up".move-workspace-up = { };
        "Mod+Ctrl+U".move-workspace-down = { };
        "Mod+Ctrl+I".move-workspace-up = { };

        "Mod+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          focus-workspace-down = { };
        };
        "Mod+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          focus-workspace-up = { };
        };
        # TODO: You want to make these Mod+Shift...
        # Look for other offenders.
        "Mod+Ctrl+WheelScrollDown" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-down = { };
        };
        "Mod+Ctrl+WheelScrollUp" = {
          _props.cooldown-ms = 150;
          move-column-to-workspace-up = { };
        };

        "Mod+WheelScrollRight".focus-column-right = { };
        "Mod+WheelScrollLeft".focus-column-left = { };
        "Mod+Ctrl+WheelScrollRight".move-column-right = { };
        "Mod+Ctrl+WheelScrollLeft".move-column-left = { };

        # Usually scrolling up and down with Shift in applications results in
        # horizontal scrolling; these binds replicate that.
        "Mod+Shift+WheelScrollDown".focus-column-right = { };
        "Mod+Shift+WheelScrollUp".focus-column-left = { };
        "Mod+Ctrl+Shift+WheelScrollDown".move-column-right = { };
        "Mod+Ctrl+Shift+WheelScrollUp".move-column-left = { };

        "Mod+0".focus-workspace = 1;
        "Mod+1".focus-workspace = 2;
        "Mod+2".focus-workspace = 3;
        "Mod+3".focus-workspace = 4;
        "Mod+4".focus-workspace = 5;
        "Mod+5".focus-workspace = 6;
        "Mod+6".focus-workspace = 7;
        "Mod+7".focus-workspace = 8;
        "Mod+8".focus-workspace = 9;
        "Mod+9".focus-workspace = 10;
        "Mod+Shift+0".move-window-to-workspace = 1;
        "Mod+Shift+1".move-window-to-workspace = 2;
        "Mod+Shift+2".move-window-to-workspace = 3;
        "Mod+Shift+3".move-window-to-workspace = 4;
        "Mod+Shift+4".move-window-to-workspace = 5;
        "Mod+Shift+5".move-window-to-workspace = 6;
        "Mod+Shift+6".move-window-to-workspace = 7;
        "Mod+Shift+7".move-window-to-workspace = 8;
        "Mod+Shift+8".move-window-to-workspace = 9;
        "Mod+Shift+9".move-window-to-workspace = 10;

        # Move the focused window in and out of a column.
        "Mod+BracketLeft".consume-or-expel-window-left = { };
        "Mod+BracketRight".consume-or-expel-window-right = { };

        # Consume one window from the right to the bottom of the focused column.
        "Mod+Comma".consume-window-into-column = { };

        # Expel the bottom window from the focused column to the right.
        "Mod+Period".expel-window-from-column = { };

        "Mod+F".maximize-column = { };
        "Mod+Shift+F".fullscreen-window = { };
        "Mod+M".maximize-window-to-edges = { };

        # Expand the focused column to space not taken up by other fully visible columns.
        # Makes the column "fill the rest of the space".
        "Mod+Ctrl+F".expand-column-to-available-width = { };

        "Mod+C".center-column = { };

        # Center all fully visible columns on screen.
        "Mod+Shift+C".center-visible-columns = { };

        # Finer width adjustments.
        "Mod+Minus".set-column-width = "-10%";
        "Mod+Equal".set-column-width = "+10%";

        # Finer height adjustments when in column with other windows.
        "Mod+Shift+Minus".set-window-height = "-10%";
        "Mod+Shift+Equal".set-window-height = "+10%";

        "Mod+V".switch-focus-between-floating-and-tiling = { };
        "Mod+Shift+V".toggle-window-floating = { };

        # Toggle tabbed column display mode.
        # Windows in this column will appear as vertical tabs,
        # rather than stacked on top of each other.
        "Mod+W".toggle-column-tabbed-display = { };

        "Print".screenshot = { };
        "Ctrl+Print".screenshot-screen = { };
        "Alt+Print".screenshot-window = { };

        # Applications such as remote-desktop clients and software KVM switches may
        # request that niri stops processing the keyboard shortcuts defined here
        # so they may, for example, forward the key presses as-is to a remote machine.
        # It's a good idea to bind an escape hatch to toggle the inhibitor,
        # so a buggy application can't hold your session hostage.
        #
        # The allow-inhibiting=false property can be applied to other binds as well,
        # which ensures niri always processes them, even when an inhibitor is active.
        "Mod+Escape" = {
          _props.allow-inhibiting = false;
          toggle-keyboard-shortcuts-inhibit = { };
        };

        # The quit action will show a confirmation dialog to avoid accidental exits.
        "Mod+Shift+X".quit = { };

        # Show both displays.
        "Mod+F1".spawn = [
          "sh"
          "-c"
          "niri msg output eDP-1 on && niri msg output HDMI-A-1 on"
        ];

        # Only show the external display.
        "Mod+F2".spawn = [
          "sh"
          "-c"
          "niri msg output eDP-1 off && niri msg output HDMI-A-1 on"
        ];

        # Only show the internal display.
        "Mod+F3".spawn = [
          "sh"
          "-c"
          "niri msg output HDMI-A-1 off && niri msg output eDP-1 on"
        ];
      };

      _children = [
        { spawn-at-startup = "waybar"; }
        {
          spawn-at-startup = [
            "setxkbmap"
            "-option"
            "compose:ralt"
          ];
        }
        {
          spawn-at-startup = [
            "wl-clip-persist"
            "--clipboard"
            "regular"
          ];
        }
        {
          # builtin monitor
          output = {
            _args = [ "eDP-1" ];
            mode = "1920x1080@165.004";
            position._props = {
              x = 0;
              y = 0;
            };
          };
        }
        {
          # samsung tv
          output = {
            _args = [ "Samsung Electric Company SAMSUNG 0x01000E00" ];
            mode = "1920x1080@50.000";
            position._props = {
              x = 0;
              y = -1080;
            };
          };
        }
        {
          # room monitor
          output = {
            _args = [ "PNP(AOC) 27G2G4 0x00024B09" ];
            mode = "1920x1080@60.000";
            position._props = {
              x = 0;
              y = -1080;
            };
          };
        }
      ];
    };
  };
}
