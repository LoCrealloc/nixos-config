{ pkgs, ... }:
{
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";

  programs.zsh.enable = true;

  hardware.rtl-sdr.enable = true;

  services.tumbler.enable = true;
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    killall
    git
    pciutils
    vim
    mesa-demos
    qemu
    libvirt
    man-pages
    man-pages-posix
    libva-utils
    vulkan-tools

    lutris
    wineWowPackages.stable
    winetricks
    dxvk
  ];

  documentation.dev.enable = true;

  programs.wireshark.enable = true;

  security.polkit.enable = true;

  services.udev = {
    packages = [
      pkgs.platformio-core
      pkgs.openocd
    ];
  };
}
