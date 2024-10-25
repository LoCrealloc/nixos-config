{ config, ... }:
{
  environment.sessionVariables.NIX_USER_CONF_FILES = config.sops.templates."nix".path;

  sops = {
    secrets."nix/github" = {
      key = "github_token";
      sopsFile = ./secrets/nix.yml;
    };
    templates."nix" = {
      content = ''
        access-tokens = github.com=${config.sops.placeholder."nix/github"}
      '';
      mode = "444";
    };
  };
}
