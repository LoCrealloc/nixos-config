{ lib, ... }: {
  hardware.opengl.enable = true;
  hardware.nvidia.modesetting.enable = true;

  hardware.nvidia.prime = {
    offload.enable = true;

    nvidiaBusId = "PCI:1:00:0";

    amdgpuBusId = "PCI:6:00:0";
  };

  specialisation = {
    external-display.configuration = {
      system.nixos.tags = [ "external-display" ];
      hardware.nvidia.prime.offload.enable = lib.mkForce false;
      hardware.nvidia.powerManagement.enable = lib.mkForce false;

      hardware.nvidia.prime.sync.enable = lib.mkForce true;
    };
  };
}
