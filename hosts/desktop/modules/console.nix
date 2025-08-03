{ lib, ... }:
{
  specialisation.gaming.configuration = {
    system.nixos.tags = [ "console" ];

    hardware = {
      xpadneo.enable = true;
      xone.enable = true;
    };
    home-manager.users.loc.wayland.windowManager.sway.config.output."HDMI-A-1" = lib.mkForce {
      transform = "0";
    };
  };
}
