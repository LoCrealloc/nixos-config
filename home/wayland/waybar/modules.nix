{ pkgs, lib, ... }: {
  # Modules
  # use nf-md nerdfont icons where applicable
  "sway/workspaces" = {
    format = "{icon}";
    format-icons = {
      "1" = "";
      "2" = "";
      "3" = "󰝚";
      "4" = "󰖟";
      "5" = "󰈮";
      "7" = "";
      "10" = "";
      default = "";
    };
  };
  "sway/mode" = {
    format = "󱁤 {}";
  };
  network = {
    format-wifi = "󰖩 {essid} {ipaddr} ({bandwidthDownBits})";
    format-ethernet = "  {ipaddr} ({bandwidthDownBits})";
    tooltip-format = "[{ifname}] {ipaddr}/{cidr}";
    family = "ipv4";
  };
  cpu = {
    format = "󰻠  {load}% ({max_frequency}GHz)";
  };
  memory = {
    format = "󰍛  {used}/{total}GB ({percentage}%)";
    tooltip = false;
  };
  bluetooth = {
    "format-icons" = [
      "󰥇"
      "󰤾"
      "󰥀"
      "󰥂"
      "󰥄"
      "󰥈"
    ];
    format-connected-battery = "{icon} {device_alias}";
    format-connected = "󰂯 {device_alias}";
    format-on = "󰂯 No connections";
    format-off = "󰂲 {status}";
    format-no-controller = "󰂲 No controller found";
    tooltip-format-connected-battery = "{device_alias} ({device_address}) ({device_battery_percentage}%)";
    tooltip-format-connected = "{device_alias} ({device_address})";
  };
  clock = {
    interval = 1;
    format = "󰅐 {:%H:%M}";
    format-alt = "󰅐 {:%H:%M:%S - %d.%m.%Y}";
    timezone-tooltip-format = "{:%H:%M %Z}";
    timezones = [
      ""
      "UTC"
    ];
    tooltip = true;
    tooltip-format = "{tz_list}";
  };
  wireplumber = {
    format = "󰕾 {volume}% ({node_name})";
    format-muted = "󰸈 ({node_name})";
    scroll-step = 5;
    on-click = "${lib.getExe' pkgs.wireplumber "wpctl"} set-mute @DEFAULT_AUDIO_SINK@ toggle";
    on-click-middle = lib.getExe pkgs.helvum;
  };
  mpris = {
    format = "{player_icon} {dynamic}";
    format-paused = "{player_icon} [{status_icon}] {dynamic}";
    tooltip-format = "{dynamic}";
    dynamic-order = [
      "artist"
      "title"
      "album"
    ];
    dynamic-importance-order = [
      "title"
      "artist"
      "album"
    ];
    player-icons = {
      default = "󰎆";
      spotify = "󰓇";
      firefox = "󰈹";
    };
    status-icons = {
      paused = "󰏤";
    };
    dynamic-len = 40;
    on-click = "${lib.getExe pkgs.playerctl} play-pause";
  };
}
