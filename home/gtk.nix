{ pkgs, ... }: {
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Violet-Dark";
    };
    theme.name = "Material-DeepOcean-BL";
    cursorTheme = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e-Dark";
    };

    font = {
      name = "Hack Nerd Font";
      size = 12;
    };
  };
}
