{
  environment.persistence = {
    "/persistent/data" = {
      hideMounts = true;
      directories = [
        "/var/lib/nixos"
      ];
      users.loc = (import ../../../home/impermanence.nix).data;
    };
    "/persistent/cache" = {
      hideMounts = true;
      directories = [
      ];
      users.loc = (import ../../../home/impermanence.nix).cache;
    };
  };
}
