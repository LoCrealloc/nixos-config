{pkgs, ...} : {
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
    extraGroups = [ "wheel" "networkmanager" "docker" "video" "camera" "borg" "keyboard" "libvirtd" "dialout" "plugdev" ];
    packages = [
      pkgs.udisks
    ];
  };

	home-manager.users = {
		loc = import ./home/home.nix;
	};
}
