{ lib, ... }:
{
  hardware.graphics.enable = true;

  hardware.nvidia = {

    open = false;

    modesetting.enable = true;
    powerManagement = {
      enable = true;
      #finegrained = true;
    };

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;

      nvidiaBusId = "PCI:1:00:0";

      amdgpuBusId = "PCI:6:00:0";
    };
  };

  specialisation = {
    external-display.configuration = {
      system.nixos.tags = [ "external-display" ];

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
  };
}
