{
  sops = {
    defaultSopsFile = ../secrets/secrets.yml;
    age.keyFile = "/home/loc/.config/sops/age/keys.txt";
    gnupg.sshKeyPaths = [ ];
  };
}
