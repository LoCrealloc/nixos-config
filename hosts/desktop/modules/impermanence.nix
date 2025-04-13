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
      ];
      hideMounts = false;
      users.loc = (import ../../../home/impermanence.nix).cache;
    };
  };
}
