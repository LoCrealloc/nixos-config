{
  config,
  lib,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Violet-Dark";
    };
    theme.name = "Material-DeepOcean-BL";
    #cursorTheme = {
    #  package = pkgs.hackneyed;
    #  name = "Hackneyed";
    #  size = 16;
    #};
    font = {
      name = "DejaVu Sans";
      size = 12;
    };
  };
}
