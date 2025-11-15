{
  lib,
  pkgs,
  config,
  ...
}:
let
  mod = "Mod4";

  ws1 = "1";
  ws2 = "2";
  ws3 = "3";
  ws4 = "4";
  ws5 = "5";
  ws6 = "6";
  ws7 = "7";
  ws8 = "8";
  ws9 = "9";
  ws10 = "10";
in
{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = mod;

      fonts = {
        names = [ "Hack Nerd Font" ];
        style = "Regular";
        size = 11.0;
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+d" = "exec ${pkgs.fuzzel}/bin/fuzzel";

        # volume adjust
        "XF86AudioRaiseVolume" =
          "exec ${lib.getExe' pkgs.pulseaudio "pactl"} set-sink-volume @DEFAULT_SINK@ +5%";
        "XF86AudioLowerVolume" =
          "exec ${lib.getExe' pkgs.pulseaudio "pactl"} set-sink-volume @DEFAULT_SINK@ -5%";
        "XF86AudioMute" = "exec ${lib.getExe' pkgs.pulseaudio "pactl"} set-sink-mute @DEFAULT_SINK@ toggle";
        "XF86AudioMicMute" =
          "exec ${lib.getExe' pkgs.pulseaudio "pactl"} set-source-mute @DEFAULT_SOURCE@ toggle";

        # media player
        "XF86AudioPlay" = "exec playerctl play-pause";
        "XF86AudioNext" = "exec playerctl next";
        "XF86AudioPrev" = "exec playerctl previous";

        # backlight
        "XF86MonBrightnessUp" = "exec ${lib.getExe pkgs.light} -A 5";
        "XF86MonBrightnessDown" = "exec ${lib.getExe pkgs.light} -U 5";

        # kill window
        "${mod}+Shift+q" = "kill";

        # start terminal
        "${mod}+Return" = "exec ${pkgs.kitty}/bin/kitty";
        "${mod}+Shift+Return" = "exec ${pkgs.kitty}/bin/kitty &";

        # change focus
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # move window
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # split horizontal
        "${mod}+b" = "split h";

        # split vertical
        "${mod}+v" = "split v";

        # fullscreen
        "${mod}+f" = "fullscreen toggle";

        # change layout
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout toggle split";

        # toggle tiling/floating
        "${mod}+Shift+space" = "floating toggle";

        # change focus between tiling/floating
        "${mod}+space" = "focus mode_toggle";

        # switch workspace
        "${mod}+1" = "workspace number ${ws1}";
        "${mod}+2" = "workspace number ${ws2}";
        "${mod}+3" = "workspace number ${ws3}";
        "${mod}+4" = "workspace number ${ws4}";
        "${mod}+5" = "workspace number ${ws5}";
        "${mod}+6" = "workspace number ${ws6}";
        "${mod}+7" = "workspace number ${ws7}";
        "${mod}+8" = "workspace number ${ws8}";
        "${mod}+9" = "workspace number ${ws9}";
        "${mod}+0" = "workspace number ${ws10}";

        # move window to workspace
        "${mod}+Shift+1" = "move container to workspace number ${ws1}";
        "${mod}+Shift+2" = "move container to workspace number ${ws2}";
        "${mod}+Shift+3" = "move container to workspace number ${ws3}";
        "${mod}+Shift+4" = "move container to workspace number ${ws4}";
        "${mod}+Shift+5" = "move container to workspace number ${ws5}";
        "${mod}+Shift+6" = "move container to workspace number ${ws6}";
        "${mod}+Shift+7" = "move container to workspace number ${ws7}";
        "${mod}+Shift+8" = "move container to workspace number ${ws8}";
        "${mod}+Shift+9" = "move container to workspace number ${ws9}";
        "${mod}+Shift+0" = "move container to workspace number ${ws10}";

        # reload config
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        "${mod}+Shift+e" =
          "exec sway-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'swaymsg exit'";

        # switch mode
        "${mod}+r" = "mode resize";
        "${mod}+o" = "mode move_workspace";
        "${mod}+Shift+u" = "mode system";

        # Dunst
        "${mod}+n" = "exec dunstctl set-paused toggle";

        "Print --release" =
          "exec ${lib.getExe config.services.flameshot.package} gui --accept-on-select --clipboard &";

        "Shift+Print --release" = "exec ${lib.getExe config.services.flameshot.package} gui --clipboard";
      };

      modes = {
        resize = {
          "h" = "resize shrink width 10 px or 10 ppt";
          "j" = "resize grow height 10 px or 10 ppt";
          "k" = "resize shrink height 10 px or 10 ppt";
          "l" = "resize grow width 10 px or 10 ppt";

          Return = "mode default";
          Escape = "mode default";
        };

        move_workspace = {
          "h" = "move workspace to output left";
          "j" = "move workspace to output up";
          "k" = "move workspace to output down";
          "l" = "move workspace to output right";

          Escape = "mode default";
        };

        system = {
          "l" = "exec swaylock, mode default";
          "s" = "exec swaylock, exec systemctl suspend, mode default";
          "r" = "exec systemctl reboot, mode default";
          "h" = "exec systemctl hibernate, mode default";
          "p" = "exec systemctl poweroff, mode default";

          Escape = "mode default";
        };
      };

      assigns = {
        "${ws1}" = [ { class = "startanimation"; } ];
        "${ws2}" = [
          { class = "Signal"; }
          { class = "element"; }
        ];
        "${ws3}" = [ { class = "spotify"; } ];
        "${ws10}" = [
          { class = "thunderbird"; }
          { class = "discord"; }
        ];
      };

      workspaceOutputAssign = [
        {
          workspace = "${ws1}";
          output = "primary";
        }
        {
          workspace = "${ws2}";
          output = "DP-2";
        }
        {
          workspace = "${ws3}";
          output = "DP-2";
        }
        {
          workspace = "${ws4}";
          output = "primary";
        }
        {
          workspace = "${ws7}";
          output = "primary";
        }
        {
          workspace = "${ws8}";
          output = "primary";
        }
        {
          workspace = "${ws10}";
          output = "DP-2";
        }
      ];

      colors = {
        focused = {
          border = "#89ddff";
          background = "#89ddff";
          text = "#0f111a";
          indicator = "#89ddff";
          childBorder = "#89ddff";
        };
        focusedInactive = {
          border = "#80869e";
          background = "#80869e";
          text = "#0f111a";
          indicator = "#80869e";
          childBorder = "#80869e";
        };
        unfocused = {
          border = "#82aaff";
          background = "#82aaff";
          text = "#0f111a";
          indicator = "#82aaff";
          childBorder = "#82aaff";
        };
        urgent = {
          border = "#ff5370";
          background = "#ff5370";
          text = "#0f111a";
          indicator = "#ff5370";
          childBorder = "#ff5370";
        };
        placeholder = {
          border = "#ffffff";
          background = "#fbb80b3";
          text = "#f78c6c";
          indicator = "#ffffff";
          childBorder = "#bb80b3";
        };
      };

      gaps = {
        inner = 10;
        outer = 5;
      };

      window = {
        border = 0;
      };

      floating.border = 0;

      focus.newWindow = "none";

      startup = [
        {
          command = "swaymsg 'workspace 10'; exec thunderbird &";
          always = false;
        }
        {
          command = "swaymsg 'workspace 1'";
          always = false;
        }
      ];

      bars = [ ];
      input = {
        "*" = {
          xkb_layout = "de";
          xkb_variant = "neo_qwertz";
          xkb_model = "pc105";
        };
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
          pointer_accel = "0.9";
          scroll_method = "two_finger";
        };
        "type:mouse" = {
          pointer_accel = "0.9";
        };
      };

    };
    extraConfig = ''
      no_focus [class="obsidian"]
    '';
  };
}
