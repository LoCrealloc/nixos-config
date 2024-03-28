{
  config,
  ...
}: let
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    font = "Hack Nerd Font Mono 18";
    terminal = "alacritty";
    extraConfig = {
      modes = "drun,run,ssh,filebrowser,window";
      display-drun = "";
      display-run = "";
      display-ssh = "󰒋";
      display-filebrowser = "󰉋";
      display-window = "";
    };
    theme = {
      "*" = {
        border = 0;
        margin = 0;
        padding = 0;
        spacing = 0;

        bg = mkLiteral "#0F111A";
        bg-alt = mkLiteral "#89DDFF";
        fg = mkLiteral "#FFFFFF";
        fg-alt = mkLiteral "#80869E";

        background-color = mkLiteral "@bg";
        text-color = mkLiteral "@fg";
      };

      window = {
        transparency = "real";
        width = mkLiteral "30%";

        border = mkLiteral "3px";
        border-color = mkLiteral "@bg-alt";
      };

      mainbox = {
        children = mkLiteral "[inputbar, listview]";
      };

      inputbar = {
        background-color = mkLiteral "@bg-alt";
        children = mkLiteral "[prompt, entry]";
        border-color = mkLiteral "@bg";
        border = mkLiteral "2px";
      };

      entry = {
        background-color = mkLiteral "inherit";
        padding = mkLiteral "12px 3px";
        text-color = mkLiteral "@bg";
      };

      prompt = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "@bg";
        padding = mkLiteral "12px";
      };

      listview = {
        lines = 8;
      };

      element = {
        children = mkLiteral "[element-icon, element-text]";
      };

      element-icon = {
        padding = mkLiteral "10px 10px";
      };

      element-text = {
        padding = mkLiteral "10px 0";
        text-color = mkLiteral "@fg-alt";
      };

      "element-text selected" = {
        text-color = mkLiteral "@fg";
      };
    };
  };
}
