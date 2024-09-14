{ pkgs, ... }:
{
  home.file."nitrogen-config" = {
    text = ''
      [xin_0]
      file=${../wallpapers/explosion_purple.jpeg}
      mode=3
      bgcolor=#000000

      [xin_1]
      file=${../wallpapers/cloud.jpeg}
      mode=5
      bgcolor=#000000
    '';
    target = ".config/nitrogen/bg-saved.cfg";
  };
}
