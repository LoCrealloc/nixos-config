{
  boot.initrd.luks.devices.crypted.device = "/dev/disk/by-uuid/14f3b9e2-9064-4587-a8b8-f21d916f9621";

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub = {
      efiSupport = true;
      enable = true;
      device = "nodev";
      useOSProber = true;
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
}
