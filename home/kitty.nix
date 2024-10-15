let
  black = "#000000";
  blue = "#82aaff";
  cyan = "#89ddff";
  green = "#c3e88d";
  magenta = "#c792ea";
  red = "#ff5370";
  white = "#ffffff";
  yellow = "#ffcb6b";
in
{
  programs.kitty = {
    enable = true;

    font = {
      name = "Hack Nerd Font";
      size = 12;
    };

    settings = rec {
      enable_audio_bell = false;

      window_alert_on_bell = false;

      foreground = "#ffffff";
      background = "#0f111a";

      selection_foreground = background;
      selection_background = "#a6accd";

      color0 = black;
      color8 = "#3b3e4c";

      color1 = red;
      color9 = "#ff8b92";

      color2 = green;
      color10 = "#ddffa7";

      color3 = yellow;
      color11 = "#ffe585";

      color4 = blue;
      color12 = "#9cc4ff";

      color5 = magenta;
      color13 = "#e1acff";

      color6 = cyan;
      color14 = "#a3f7ff";

      color7 = white;
      color15 = white;

      cursor = foreground;
      cursor_shape = "beam";

      confirm_os_window_close = 0;
    };
  };
}
