{
  conf,
  pkgs,
  lib,
  config,
  ...
}:
{
  networking.hostName = conf.hostname;
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];
    ensureProfiles = {
      profiles = {
        dk0tu-wg = {
          connection = {
            id = "dk0tu-wg";
            interface-name = "dk0tu-wg";
            type = "wireguard";
            uuid = "02819e3d-532f-4d28-8dca-4e54e118cbb3";
            autoconnect = false;
          };
          ipv4 = {
            address1 = "10.0.59.8/32";
            method = "manual";
          };
          ipv6 = {
            addr-gen-mode = "default";
            method = "disabled";
          };
          wireguard = {
          };
          "wireguard-peer.Rxv94zLvl+etp1A6LbH+Z+IuPU9XligHVQLwiLG+YHI=" = {
            allowed-ips = "192.168.59.0/24;";
            endpoint = "vpn.dk0tu.de:51820";
            preshared-key-flags = "0";
          };
        };
      };
      secrets.entries = [
        {
          matchId = "dk0tu-wg";
          matchSetting = "wireguard";
          key = "private-key";
          file = config.sops.secrets."dk0tu-wg/private-key".path;
          matchType = "wireguard";
        }
        {
          matchId = "dk0tu-wg";
          key = "peers.Rxv94zLvl+etp1A6LbH+Z+IuPU9XligHVQLwiLG+YHI=.preshared-key";
          file = config.sops.secrets."dk0tu-wg/preshared-key".path;
          matchSetting = "wireguard";
          matchType = "wireguard";
        }
      ];
    };
  };

  sops.secrets =
    let
      wireguard-interfaces = [ "dk0tu-wg" ];
    in
    lib.mergeAttrsList (
      lib.crossLists
        (iface: key: {
          "${iface}/${key}" = {
            sopsFile = ../secrets/NetworkManager/${iface}.yml;
            key = key;
          };
        })
        [
          wireguard-interfaces
          [
            "private-key"
            "preshared-key"
          ]
        ]
    );

  networking.nameservers = [ "9.9.9.9" ];
}
