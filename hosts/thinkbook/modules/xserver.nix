{
  lib,
  ...
}:
{

  specialisation.gaming.configuration = {
    system.nixos.tags = [ "gaming" ];

    services.xserver.xkb = {
      layout = lib.mkForce "de";
      variant = lib.mkForce "";
      options = lib.mkForce "";
    };

    services.xserver.videoDrivers = lib.mkForce [ "nvidia" ];

    hardware.nvidia = {
      prime = {
        offload.enable = lib.mkForce false;
        offload.enableOffloadCmd = lib.mkForce false;

        sync.enable = lib.mkForce true;
      };
      powerManagement = {
        enable = lib.mkForce false;
        finegrained = lib.mkForce false;
      };
    };
  };
}
