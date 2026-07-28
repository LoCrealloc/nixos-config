{ pkgs, lib, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ./style.css;
    settings =
      let
        modulesConfig = import ./modules.nix { inherit pkgs lib; };
      in
      builtins.mapAttrs (_: set: set // modulesConfig) {
        bar-left = {
          layer = "top";
          position = "bottom";
          output = [ "DP-2" ];
          modules-left = [
            "sway/workspaces"
          ];
          modules-right = [
            "wireplumber"
            "mpris"
            "clock"
          ];
        };
        bar-center = {
          layer = "top";
          position = "bottom";
          output = [
            "DP-3"
          ];
          modules-left = [
            "sway/workspaces"
            "sway/mode"
          ];
          modules-center = [ ];
          modules-right = [
            "network"
            "cpu"
            "memory"
            "clock"
          ];
        };
        bar-right = {
          layer = "top";
          position = "bottom";
          output = [ "HDMI-A-1" ];
          modules-left = [
            "sway/workspaces"
          ];
          modules-right = [
            "bluetooth"
            "clock"
          ];
        };
      };
  };
}
