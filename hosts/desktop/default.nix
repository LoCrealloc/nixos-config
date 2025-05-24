_: {
  system = "x86_64-linux";
  window-system = "wayland";

  ageKey = "/persistent/data/home/loc/.config/sops/age/keys.txt";

  hostConfig = {
    boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/c9442104-38ea-45a6-974a-16c8d0034fd0";

    system.stateVersion = "24.11";

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
        device = "/dev/disk/by-uuid/ca1ec8b7-4c38-4c9e-a9ee-4c66bc4462aa";
        fsType = "btrfs";
        neededForBoot = true;
        options = [
          "subvol=@data"
          "compress=zstd"
          "noatime"
        ];
      };
      "/persistent/cache" = {
        device = "/dev/disk/by-uuid/ca1ec8b7-4c38-4c9e-a9ee-4c66bc4462aa";
        fsType = "btrfs";
        neededForBoot = true;
        options = [
          "subvol=@cache"
          "compress=zstd"
          "noatime"
        ];
      };
      "/nix" = {
        device = "/dev/disk/by-uuid/ca1ec8b7-4c38-4c9e-a9ee-4c66bc4462aa";
        fsType = "btrfs";
        neededForBoot = true;
        options = [
          "subvol=@nix"
          "compress=zstd"
          "noatime"
        ];
      };
      "/swap" = {
        device = "/dev/disk/by-uuid/ca1ec8b7-4c38-4c9e-a9ee-4c66bc4462aa";
        fsType = "btrfs";
        neededForBoot = true;
        options = [
          "subvol=@swap"
          "noatime"
        ];
      };
      "/boot" = {
        device = "/dev/disk/by-uuid/137D-1D4C";
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
