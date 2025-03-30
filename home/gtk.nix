{ pkgs, lib, ... }:
let

  material-gtk-theme = pkgs.stdenvNoCC.mkDerivation rec {
    pname = "material-gtk-theme";
    version = "4d828d5";
    src = pkgs.fetchFromGitHub {
      owner = "Fausto-Korpsvart";
      repo = "Material-GTK-Themes";
      rev = version;
      sha256 = "sha256-2E+ZRnvqzzS986J0ckrV73J1YqMUodj8bVXVStxcfUg=";
    };

    propagatedUserEnvPkgs = [ pkgs.gtk-engine-murrine ];

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/themes
      cp -r themes $out/share/.
      runHook postInstall
    '';

    meta = with lib; {
      description = "Material GTK Themes ";
      homepage = "https://github.com/Fausto-Korpsvart/Material-GTK-Themes";
      license = licenses.gpl3Only;
    };
  };
in
{
  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Violet-Dark";
    };
    theme = {
      package = material-gtk-theme;
      name = "Material-DeepOcean-BL";
    };
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
