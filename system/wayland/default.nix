{ pkgs, lib, ... }:
{
  imports = [
    ./greetd.nix
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.xwayland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # may enable wayland for chromium/electron

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    wlr.settings = {
      screencast = {
        max_fps = 30;
        chooser_type = "dmenu";
        chooser_cmd = "${lib.getExe pkgs.fuzzel} --dmenu --prompt \"󱒃 \"";
      };
    };
  };
}
