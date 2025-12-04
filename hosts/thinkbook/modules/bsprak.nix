{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # BSPRAK
    git
    gcc
    gnumake
    cmake
    (python313.withPackages (
      ps: with ps; [
        zlib
        pip
        setuptools
        virtualenv
        sphinx
      ]
    ))
    ninja
    texinfo
    pkg-config
    bison
    flex
    curl
    wget

    # the `.dev` syntax tells nix to also provide header files
    zlib
    zlib.dev
    gmp
    gmp.dev
    mpfr
    mpfr.dev
    libmpc
    glib
    glib.dev
    pixman
    expat
    expat.dev
    ncurses5
    ncurses5.dev
  ];

  #TEMPORARY BSPRAK FIX!!!!!
  environment.pathsToLink = [
    # Tell nix to link header files of all installed packages
    # in /run/current-system/sw/include
    "/include"
    # Tell nix to link `.pc` files of all installed packages
    # in /run/current-system/sw/lib/pkgconfig
    "/lib/pkgconfig"
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      zlib
      gmp
      mpfr
      libmpc
      glib
      pixman
      expat
      ncurses5
      stdenv.cc.cc.lib
      zlib
    ];
  };

  environment.variables = {
    # Tell compilers where to find the header files
    CPATH = "/run/current-system/sw/include";
    # Tell linker where to find shared objects
    LIBRARY_PATH = "/run/current-system/sw/lib";
    # Tell pkg-config where to find `.pc` files
    PKG_CONFIG_PATH = "/run/current-system/sw/lib/pkgconfig";
  };

}
