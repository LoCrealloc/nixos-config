{ lib, ... }: {
  hardware.opengl.enable = true;

  hardware.nvidia = {

    modesetting.enable = true;
    powerManagement = {
      enable = true;
      #finegrained = true;
    };

    prime = {
      offload.enable = true;

      nvidiaBusId = "PCI:1:00:0";

      amdgpuBusId = "PCI:6:00:0";
    };
  };

  specialisation = {
    external-display.configuration = {
      system.nixos.tags = [ "external-display" ];
      hardware.nvidia = {
        prime = {
          offload.enable = lib.mkForce false;
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
