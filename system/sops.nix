{ conf, ... }:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yml;
    age.keyFile = conf.agekey;
    gnupg.sshKeyPaths = [ ];
  };
}
