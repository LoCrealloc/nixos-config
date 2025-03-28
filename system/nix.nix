{ config, ... }:
{
  #environment.sessionVariables.NIX_USER_CONF_FILES = config.sops.templates."nix".path;

  nix = {
    settings = {
      substituters = [
        "https://locrealloc.cachix.org"
      ];
      trusted-public-keys = [ "locrealloc.cachix.org-1:wrc3FucRL/Y76K/jwKmOYSscIlHgGNPA/Wl50eQTcZM=" ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  sops = {
    secrets."nix/github" = {
      key = "github_token";
      sopsFile = ../secrets/nix.yml;
    };
    templates."nix" = {
      content = ''
        access-tokens = github.com=${config.sops.placeholder."nix/github"}
      '';
      mode = "444";
    };
  };
}
