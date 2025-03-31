{
  services.openssh = {
    openFirewall = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      AllowUsers = [ "copy" ];
    };
  };
}
