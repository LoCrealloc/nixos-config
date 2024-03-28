{
  pkgs,
  jellyfin-plugins,
  system,
  lib,
  ...
}: {
  services.jellyfin = {
    enable = true;
    enabledPlugins = {inherit (jellyfin-plugins.packages."x86_64-linux") SSO-Auth;};
  };
}
