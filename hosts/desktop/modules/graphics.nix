{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nvtopPackages.amd
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    #extraPackages = [ pkgs.amdvlk ];
  };

  services.xserver.videoDrivers = [
    "amdgpu"
  ];

  environment.variables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    WLR_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1";
  };
}
