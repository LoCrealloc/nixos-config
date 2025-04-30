{
  imports = [
    ./greetd.nix
  ];

  programs.sway = {
    enable = true;
    # extraOptions = [
    #   "--unsupported-gpu" # sway claims to have no nvidia support
    # ];
  };
  programs.xwayland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # may enable wayland for chromium/electron
}
