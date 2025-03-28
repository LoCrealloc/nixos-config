{
  services.displayManager = {
    defaultSession = "none+i3";
    sddm = {
      enable = true;
      autoNumlock = true;
      autoLogin.relogin = true;
    };
    autoLogin = {
      enable = true;
      user = "loc";
    };
  };
}
