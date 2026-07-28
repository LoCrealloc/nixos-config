{ config, ... }: {
  boot = {
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        efiSupport = true;
        enable = true;
        device = "nodev";
        extraEntries = ''
          menuentry "Reboot" {
            reboot
          }
          menuentry "Poweroff" {
            halt
          }
        '';
      };
    };
  };
}
