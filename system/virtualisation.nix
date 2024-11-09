{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    podman-tui
    podman-compose
  ];

  programs.dconf.enable = true;

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  virtualisation.libvirtd.enable = true;
}
