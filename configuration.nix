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

  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;

  services.udev = {
    packages = [
      pkgs.platformio-core
      pkgs.openocd
    ];
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  programs.light.enable = true;

  services.udev = {
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl1", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';
  };

  programs.zsh.enable = true;

  hardware.rtl-sdr.enable = true;

  services.tumbler.enable = true;
  services.gvfs.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = [
    nvidia-offload
    pkgs.killall
    pkgs.git
    pkgs.pciutils
    pkgs.zsh
    pkgs.vim
    pkgs.i3-gaps
    pkgs.glxinfo
    (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })
    pkgs.pulseaudio
    pkgs.os-prober
    pkgs.borgbackup
    pkgs.qemu
    pkgs.libvirt
    pkgs.lutris
    pkgs.wineWowPackages.stable
  ];

  system.stateVersion = "22.05";
}
