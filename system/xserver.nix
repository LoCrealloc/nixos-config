{
  pkgs,
  lib,
  scripts,
  ...
}:
{
  services.xserver = {
    videoDrivers = [ "amdgpu" ];

    enable = true;

    xkb = {
      layout = "de";
      variant = "neo_qwertz";
      model = "pc105";
    };

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      extraPackages = with pkgs; [
        i3lock-color
      ];
    };

    xautolock = {
      enable = true;
      locker = "${scripts.i3lock}";
    };

  };

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
