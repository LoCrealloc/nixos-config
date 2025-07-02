_: {
  system = "x86_64-linux";
  window-system = "wayland";

  ageKey = "/persistent/data/home/loc/.config/sops/age/keys.txt";

  hostConfig = {
    boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/54188a2b-6216-440f-be18-50e4b6fac605";

    system.stateVersion = "25.05";

    fileSystems = {
      "/" = {
        device = "tmpfs";
        fsType = "tmpfs";
        options = [
          "defaults"
          "size=100%"
          "mode=755"
        ];
      };
      "/persistent/data" = {
        device = "/dev/disk/by-uuid/8013a572-d867-4c7c-89fa-21d5c45ec71b";
        fsType = "btrfs";
        neededForBoot = true;
        options = [
          "subvol=@data"
          "compress=zstd"
          "noatime"
        ];
      };
      "/persistent/cache" = {
        device = "/dev/disk/by-uuid/8013a572-d867-4c7c-89fa-21d5c45ec71b";
        fsType = "btrfs";
        neededForBoot = true;
        options = [
          "subvol=@cache"
          "compress=zstd"
          "noatime"
        ];
      };
      "/nix" = {
        device = "/dev/disk/by-uuid/8013a572-d867-4c7c-89fa-21d5c45ec71b";
        fsType = "btrfs";
        neededForBoot = true;
        options = [
          "subvol=@nix"
          "compress=zstd"
          "noatime"
        ];
      };
      "/swap" = {
        device = "/dev/disk/by-uuid/8013a572-d867-4c7c-89fa-21d5c45ec71b";
        fsType = "btrfs";
        neededForBoot = true;
        options = [
          "subvol=@swap"
          "noatime"
        ];
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/3B5D-DEA6";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };
    };

    swapDevices = [
      {
        device = "/swap/swapfile";
        priority = 0;
      }
    ];
  };
}
