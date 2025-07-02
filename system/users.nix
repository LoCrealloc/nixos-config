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
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAvFUhkhp13FXwFfbBrAEMHWjBbo6pNhKPwp12DAoWS+ loc@locs-thinkbook"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINeSROnV/rwwD0TuUQsksyfTvB2/u843GtHKbhhY+7vE loc@locs-desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAqVIzjqnBoyY7ypBeWVQezjuTtkC8VCi1zr9IE3ajXu loc@locs-thinkpad"
    ];
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
