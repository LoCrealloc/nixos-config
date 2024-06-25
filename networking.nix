{ pkgs, ... }: {
  networking.hostName = "locs-thinkbook";
  networking.networkmanager = {
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
    enable = true;
  };

  networking.nameservers = [ "9.9.9.9" ];
}
