{ pkgs, ... }: {
  programs.swaylock = {
    enable = true;
    settings = {
      ignore-empty-password = false;
      show-failed-attempts = true;
      indicator-radius = "150";
      inside-color = "0f111a";
      inside-ver-color = "b2ccd6";
      inside-wrong-color = "ff5370";
      inside-clear-color = "ffcb6b";
      ring-color = "89ddff";
      ring-ver-color = "c792ea";
      ring-clear-color = "ffcb6b";
      key-hl-color = "bb80b3";
      bs-hl-color = "ff5370";
      font = "Hack Nerd Font";
      font-size = "25";
      image = "/home/loc/Pictures/wallpapers/desk1.png";
      scaling = "fill";
    };
  };
}
