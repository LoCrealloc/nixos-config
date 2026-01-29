{
  conf,
  pkgs,
  lib,
  ...
}:
{
  networking.hostName = conf.hostname;
  networking.networkmanager = {
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
    enable = true;
  };

  sops.secrets =
    let
      connections = ../secrets/networks;
    in
    builtins.listToAttrs (
      map (name: {
        name = "networking/nm-connection-${name}.nmconnection";
        value = {
          format = "binary";
          sopsFile = /${connections}/${name};
          path = "/etc/NetworkManager/system-connections/${name}.nmconnection";
        };
      }) (builtins.attrNames (removeAttrs (builtins.readDir connections) [ ".gitkeep" ]))
    );

  networking.nameservers = [ "9.9.9.9" ];
}
