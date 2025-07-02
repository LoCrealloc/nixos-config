{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nvtopPackages.intel
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vpl-gpu-rt
    ];
  };

  services.xserver.videoDrivers = [
    "modesetting"
  ];

  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };
}
