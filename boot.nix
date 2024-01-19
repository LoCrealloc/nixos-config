{pkgs, ...}: {
  
	# Crypt-stuff
  boot.initrd.luks.devices.crypted.device = "/dev/nvme1n1p2";

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
