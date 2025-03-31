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
      hideMounts = false;
      users.loc = (import ../../../home/impermanence.nix).cache;
    };
  };
}
