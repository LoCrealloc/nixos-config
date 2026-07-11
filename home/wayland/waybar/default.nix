{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
    settings = {
      bar-right = {
        layer = "top";
        position = "bottom";
        output = [ "DP-2" ];
        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-right = [
          "clock"
        ];

      };
      bar-center = {
        layer = "top";
        position = "bottom";
        output = [
          "DP-3"
          "HDMI-A-1"
        ];
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
