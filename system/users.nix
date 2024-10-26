{ pkgs, config, ... }:
{
  users.groups = {
    borg = {
      name = "borg";
    };
    keyboard = {
      name = "keyboard";
    };
  };

  users.users.loc = {
    isNormalUser = true;
    home = "/home/loc";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "video"
      "camera"
      "borg"
      "keyboard"
      "libvirtd"
      "dialout"
      "plugdev"
      "wireshark"
    ];
    hashedPasswordFile = config.sops.secrets."user/hashedPassword".path;
  };

  users.users.copy = {
    isNormalUser = true;
    home = "/srv/copy";
    homeMode = "777";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA0vi1RQ03861k7jdykz9OpWImFnoAZN+4qHJg0/ufOE wolfsblut@wolfswald"
    ];
  };

  home-manager.users = {
    loc = import ../home/home.nix;
  };

  sops.secrets."user/hashedPassword".neededForUsers = true;

}
