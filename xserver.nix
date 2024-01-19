{pkgs, ...} : {
	services.xserver = {
    videoDrivers = [ "nvidia" ];

    enable = true;

    layout = "de";

    desktopManager = {
      xterm.enable = false;
    };
   
    displayManager = {
      
      defaultSession = "none+i3";
      sddm = {
        enable = true;
        autoNumlock = true;
        autoLogin.relogin = true;
      };
      autoLogin = {
        enable = true;
        user = "loc";
      };
    };

    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        networkmanager_dmenu
        i3lock-color
        polybar
        nitrogen
        jq
        dunst
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
    (nerdfonts.override { fonts = [ "Hack" ]; } )
  ];

  programs.light.enable = true;

  services.udev = {
    extraRules = ''
      ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="amdgpu_bl1", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
    '';
	};

}
