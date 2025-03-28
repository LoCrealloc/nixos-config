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
      package = pkgs.i3-gaps;
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
}
