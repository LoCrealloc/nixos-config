{ config
, lib
, modulesPath
, ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "sdhci_pci" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" "v4l2loopback" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.v4l2loopback.out ];

  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="a6300"
  '';

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2c483608-3c3a-41af-96b4-cb12162814e0";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/1E45-3234";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/cf8b408a-2217-4cf0-b20d-a6a005ad601e";
    fsType = "ext4";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/b1c4bfe3-85a7-4c00-b590-55008ecbb197"; }
  ];

  networking.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
