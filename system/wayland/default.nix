{
  imports = [
    ./greetd.nix
  ];

  programs.sway = {
    enable = true;
    extraOptions = [
      "--unsupported-gpu" # sway claims to have no nvidia support
    ];
  };
  programs.xwayland.enable = true;
}
