{
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;

    modesetting.enable = true;
    powerManagement = {
      enable = true;
      #finegrained = true;
    };
  };
}
