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
}
