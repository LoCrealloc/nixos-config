{ conf, pkgs, ... }:
{
  networking.hostName = conf.hostname;
  networking.networkmanager = {
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
    enable = true;
  };

  networking.nameservers = [ "9.9.9.9" ];
}
