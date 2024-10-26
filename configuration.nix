{ pkgs, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in
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
    (nerdfonts.override { fonts = [ "Hack" ]; })
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
    nvidia-offload
    pkgs.killall
    pkgs.git
    pkgs.pciutils
    pkgs.vim
    pkgs.glxinfo
    pkgs.qemu
    pkgs.libvirt
    pkgs.lutris
    pkgs.wineWowPackages.stable
  ];

  system.stateVersion = "22.05";
}
