{ pkgs, ... }:
{
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "de_DE.UTF-8";

  console = {
    useXkbConfig = true;
  };

  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    lidSwitchDocked = "suspend-then-hibernate";
    extraConfig = ''
      HandlePowerKey=hibernate
    '';
  };
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=60m
  '';

  powerManagement.powertop.enable = true;

  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;

  programs.wireshark.enable = true;

  services.udev = {
    packages = [
      pkgs.platformio-core
      pkgs.openocd
      pkgs.android-udev-rules
    ];
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl1", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';
  };

  fonts.packages = with pkgs; [
    nerd-fonts.hack
  ];

  programs.light.enable = true;

  programs.zsh.enable = true;

  hardware.rtl-sdr.enable = true;

  services.tumbler.enable = true;
  services.gvfs.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = [
    pkgs.killall
    pkgs.git
    pkgs.pciutils
    pkgs.vim
    pkgs.glxinfo
    pkgs.qemu
    pkgs.libvirt
    pkgs.lutris
    pkgs.wineWowPackages.stable
    pkgs.man-pages
    pkgs.man-pages-posix
  ];

  documentation.dev.enable = true;

  system.stateVersion = "22.05";
}
