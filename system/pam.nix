{ pkgs, ... }:
{
  services.fprintd = {
    enable = false;
    tod.enable = true;
    tod.driver = pkgs.libfprint-2-tod1-elan;
  };

  security.pam = {
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
      i3lock.u2fAuth = true;
      i3lock-color.u2fAuth = true;
    };
  };
}
