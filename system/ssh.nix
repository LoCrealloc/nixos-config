{
  services.openssh = {
    enable = false;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      AllowUsers = [ "copy" ];
    };
  };
}
