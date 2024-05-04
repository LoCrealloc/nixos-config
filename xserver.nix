{ pkgs
, lib
, ...
}: {
  services.xserver = {
    videoDrivers = [ "nvidia" ];

    enable = true;

    xkb = {
      layout = "de,de";
      variant = "neo_qwertz,bone";
      model = "pc105";
      options = "grp:lwin_toggle";
    };

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

    libinput = {
      enable = true;

      touchpad = {
        accelSpeed = "0.9";
        naturalScrolling = true;
      };

      mouse = {
        accelSpeed = "0.9";
      };
    };
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

  specialisation.gaming.configuration = {
    system.nixos.tags = [ "gaming" ];

    services.xserver.xkb = {
      layout = lib.mkForce "de";
      variant = lib.mkForce "";
      options = lib.mkForce "";
    };

    hardware.nvidia = {
      prime = {
        offload.enable = lib.mkForce false;
        sync.enable = lib.mkForce true;
      };
      powerManagement = {
        enable = lib.mkForce false;
        finegrained = lib.mkForce false;
      };
    };
  };
}
