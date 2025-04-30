{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
    settings = {
      bar = {
        layer = "top";
        position = "bottom";
        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-center = [ ];
        modules-right = [
          "network"
          "pulseaudio"
          "temperature"
          "cpu"
          "memory"
          "clock"
        ];

        # Modules
        "sway/workspaces" = {

        };
        network = {
          "format-wifi" = "󰖩 {essid} {ipaddr} ({bandwidthDownBits})";
          "format-ethernet" = "  {ipaddr} ({bandwidthDownBits})";
          "family" = "ipv4";
        };
        cpu = {
          "format" = "  {}%";
        };
        memory = {
          "format" = "󰍛  {used}/{total}GB ({percentage}%)";
        };
      };
    };
  };
}
