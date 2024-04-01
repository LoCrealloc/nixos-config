{ pkgs, ... }: {
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Violet-Dark";
    };
    theme.name = "Material-DeepOcean-BL";

    font = {
      name = "DejaVu Sans";
      size = 12;
    };
  };
}
