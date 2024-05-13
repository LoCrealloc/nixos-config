{
  services.picom = {
    enable = true;
    backend = "xrender";

    shadow = false;
    settings = {
      corner-radius = 2;
    };
  };
}
