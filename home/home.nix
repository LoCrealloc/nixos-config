{ pkgs, ... }: {
  imports = [
    ./zsh.nix
    ./git.nix
    ./i3.nix
    ./polybar/polybar.nix
    ./rofi.nix
    ./gtk.nix
    ./neovim
    ./dunst.nix
    ./picom.nix
  ];

  home.username = "loc";
  home.homeDirectory = "/home/loc";

  xdg.dataHome = "/home/loc/.local/share";
  xdg.configHome = "/home/loc/.config";

  home.stateVersion = "22.05";

  # GnuPG
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    pinentryPackage = pkgs.pinentry;
  };

  home.packages = with pkgs; [
    # communication
    discord
    signal-desktop
    element-desktop
    thunderbird
    weechat

    # browser
    firefox
    librewolf
    tor-browser-bundle-bin
    chromium

    # media
    spotify
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

    # development
    python310
    cargo
    rustc
    nodejs
    sqlite
    ccls
    clang
    valgrind

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
    cura
    freecad
    openscad
    #kicad

    # miscellaneous
    monero-gui
    gnome.nautilus
    xclip
    scrot
    zip
    unzip
    parted
    sl
    cmatrix
    virt-manager
    terminator
    pdf2svg
    newsflash

    # documents
    libreoffice
    texlive.combined.scheme-full
    mupdf
    onlyoffice-bin

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
    lxappearance

    # games
    openttd
    prismlauncher
  ];

  programs.home-manager.enable = true;

  services.network-manager-applet.enable = true;
}
