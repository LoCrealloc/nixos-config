{ config, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        width = "80";
        #fields = "";
        lines = "10";
        tabs = "4";

        font = "Hack Nerd Font Mono:size=14";
        icon-theme = "Flat-Remix-Violet-Dark";
        terminal = "kitty";

        horizontal-pad = "12";
        vertical-pad = "12";
        inner-pad = "3";

        line-height = "22";

        prompt = "' '";
      };

      colors = {
        background = "0F111AFF";
        text = "80869EFF";
        prompt = "89DDFFFF";
        match = "89DDFFFF";

        input = "89DDFFFF";

        selection = "0F111AFF";
        selection-text = "FFFFFFFF";
        selection-match = "89DDFFFF";

        border = "89DDFFFF";
      };

      border = {
        width = "3";
        radius = "1";
      };

    };
  };
  home.file."${config.xdg.configHome}/networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = fuzzel -d
    wifi_chars = ▂▄▆█
  '';
}
