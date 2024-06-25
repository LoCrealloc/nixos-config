{
  sops = {
    age.keyFile = "/home/loc/.config/sops/age/keys.txt";

    defaultSopsFile = ../secrets/home/secrets.yml;
  };

  systemd.user.services.mbsync.Unit.After = [ "sops-nix.service" ];
}
