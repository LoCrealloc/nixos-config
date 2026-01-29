{
  pkgs,
  scripts,
  ...
}:
{
  imports = [
    ./sddm.nix
  ];

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      package = pkgs.i3;
      enable = true;
      extraPackages = with pkgs; [
        i3lock-color
      ];
    };

    xautolock = {
      enable = true;
      locker = "${scripts.i3lock}";
    };
  };

  programs.i3lock = {
    enable = true;
    package = pkgs.i3lock-color;
    u2fSupport = true;
  };
}
