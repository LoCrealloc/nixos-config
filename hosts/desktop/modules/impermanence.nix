{
  environment.persistence = {
    "/persistent/data" = {
      hideMounts = false;
      directories = [
        "/var/lib/nixos"
      ];
      users.loc = (import ../../../home/impermanence.nix).data;
    };
    "/persistent/cache" = {
      directories = [
        "/var/lib/bluetooth"
        "/var/lib/libvirt"
      ];
      files = map (file: "/etc/ssh/ssh_host_" + file) [
        "ed25519_key"
        "ed25519_key.pub"
        "rsa_key"
        "rsa_key.pub"
      ];
      hideMounts = false;
      users.loc = (import ../../../home/impermanence.nix).cache;
    };
  };
}
