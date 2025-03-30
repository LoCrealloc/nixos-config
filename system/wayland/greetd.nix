{ pkgs, ... }:
{
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        user = "loc";
        command = "${pkgs.sway}/bin/sway --unsupported-gpu";
      };
      initial_session = {
        command = "${pkgs.sway}/bin/sway --unsupported-gpu";
        user = "loc";
      };
    };
  };
}
