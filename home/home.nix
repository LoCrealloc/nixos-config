{
  pkgs,
  config,
  pkgs-stable,
  ...
}:
{
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./git.nix
    ./i3.nix
    ./polybar/polybar.nix
    ./rofi.nix
    ./gtk.nix
    ./neovim
    ./dunst.nix
    ./picom.nix
    ./nitrogen.nix
  ];

  home.username = "loc";
  home.homeDirectory = "/home/loc";

  xdg.dataHome = "/home/loc/.local/share";
  xdg.configHome = "/home/loc/.config";

  home.file.".icons/default".source = "${config.gtk.cursorTheme.package}/share/icons/${config.gtk.cursorTheme.name}";

  home.stateVersion = "22.05";

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560001;
    maxCacheTtl = 34560000;
    pinentryPackage = pkgs.pinentry-curses;
  };

  home.packages = with pkgs; [
    pkgs-stable.cura
    pkgs-stable.iamb

    # communication
    discord
    signal-desktop
    thunderbird
    weechat
    element-desktop

    # browser
    firefox
    librewolf
    tor-browser-bundle-bin
    chromium

    # media
    playerctl
    pavucontrol
    cava
    glava
    vlc
    sonixd

    # infrastructure
    gnupg
    pinentry-curses
    networkmanager-openvpn
    networkmanagerapplet
    #nextcloud-client
    rofi
    networkmanager_dmenu
    age
    sops
    nitrogen
    jq
    udisks

    # development
    python310
    cargo
    rustc
    nodejs
    sqlite
    ccls
    clang
    gnumake
    valgrind
    gdb
    jdk21

    # IDEs & editors
    jetbrains.pycharm-community

    # media editing
    darktable
    gimp
    nomacs
    obs-studio
    libgphoto2
    gphoto2
    ffmpeg
    #blender
    imagemagick
    #scribus
    #inkscape
    audacity
    #kdenlive
    tone

    # 3d printing / electronics
    #cura
    freecad
    openscad
    #kicad

    # miscellaneous
    monero-gui
    nautilus
    xclip
    scrot
    zip
    unzip
    parted
    sl
    cmatrix
    virt-manager
    pdf2svg
    newsflash

    # documents
    libreoffice
    texlive.combined.scheme-full
    mupdf

    # fonts
    google-fonts

    # shell
    alacritty
    htop
    gtop
    btop
    powertop
    calc
    neofetch
    coreutils
    gnugrep

    # GTK
    gtk-engine-murrine

    # games
    openttd
    prismlauncher

    # ham radio
    gnuradio
    gqrx
    fldigi
    gpredict
  ];

  programs.home-manager.enable = true;

  services.network-manager-applet.enable = true;
}
