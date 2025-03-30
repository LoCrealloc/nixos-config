{ conf, ... }:
{
  sops = {
    defaultSopsFile = ../secrets/secrets.yml;
    age.keyFile = conf.ageKey;
    gnupg.sshKeyPaths = [ ];
  };
}
