_: {
  system = "x86_64-linux";
  window-system = "x11";

  ageKey = "/home/loc/.config/sops/age/keys.txt";

  hostConfig = {
    services.xserver.videoDrivers = [ "amdgpu" ];

    boot.loader.grub.useOSProber = true;

    boot.initrd.luks.devices.crypted.device = "/dev/disk/by-uuid/14f3b9e2-9064-4587-a8b8-f21d916f9621";
    system.stateVersion = "22.05";
  };
}
