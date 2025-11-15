{ config, pkgs, ... }:
let
  screenshotsDir = "${config.home.homeDirectory}/Pictures/screenshots";
in
{
  systemd.user.tmpfiles.rules = [
    "d ${screenshotsDir} 0740 loc users -"
  ];

  services.flameshot = {
    enable = true;
    package = pkgs.flameshot.override { enableWlrSupport = true; };
    settings = {
      General = {
        savePath = screenshotsDir;
        saveAsFileExtension = ".png";
        useJpgForClipboard = false;
        showDesktopNotification = false;
        filenamePattern = "screenshot_%Y%m%d_%H%M%S";
      };
    };
  };
}
