{
  home-manager.users.loc.wayland.windowManager.sway.config.output = {
    "DP-2" = {
      background = "${../../../wallpapers/ariane6.jpeg} fill";
      position = "0 200";
      transform = "270";
    };
    "DP-3" = {
      background = "${../../../wallpapers/explosion_purple.jpeg} fit";
      position = "1080 0";
    };
    "HDMI-A-1" = {
      transform = "270";
      scale = "1.5";
      background = "${../../../wallpapers/cloud.jpeg} center";
      position = "${toString (1080 + 3440)} -700";
    };
  };
}
