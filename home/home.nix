{
  conf,
  pkgs,
  config,
  pkgs-stable,
  ...
}:
{
  imports = [
    ./chromium.nix
    ./dunst.nix
    ./git.nix
    ./gtk.nix
    ./kitty.nix
    ./librewolf.nix
    ./mime.nix
    ./neovim
    ./zsh.nix
    (if conf.window-system == "x11" then ./x11 else ./wayland)
  ];

  programs.home-manager.enable = true;

  home.username = "loc";
  home.homeDirectory = "/home/loc";

  xdg.dataHome = "/home/loc/.local/share";
  xdg.configHome = "/home/loc/.config";

  home.file.".icons/default".source =
    "${config.gtk.cursorTheme.package}/share/icons/${config.gtk.cursorTheme.name}";

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
    netbird-ui

    pkgs-stable.cura
    pkgs-stable.iamb

    # communication
    discord
    signal-desktop-source
    thunderbird
    weechat
    element-desktop

    # browser
    firefox
    librewolf
    tor-browser-bundle-bin
    #chromium

    # media
    playerctl
    pavucontrol
    pkgs-stable.cava
    glava
    vlc
    sonixd
    spotify

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
    ghc
    stack

    # Nix tools
    nix-output-monitor
    nix-tree
    nix-diff
    comma

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
    #tone

    # 3d printing / electronics
    #cura
    freecad
    openscad
    kicad
    xnec2c

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
    wireshark

    # documents
    libreoffice
    texlive.combined.scheme-full
    mupdf

    # uni
    obsidian
    anki

    # fonts
    google-fonts

    # shell
    kitty
    alacritty
    htop
    gtop
    btop
    powertop
    calc
    coreutils
    gnugrep
    fastfetch

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

  services.network-manager-applet.enable = true;

  home.stateVersion = "22.05";
}
