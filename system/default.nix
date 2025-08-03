{
  conf,
  nixpkgs,
  nixpkgs-stable,
  home-manager,
  sops-nix,
  impermanence,
  ...
}@inputs:
let
  inherit (conf) system;
  inherit (nixpkgs) lib;

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
        "spotify"
        "obsidian"
        "steam"
        "steam-unwrapped"
        "nvidia-x11"
        "nvidia-settings"
        "xow_dongle-firmware"
      ];
  };

  scripts = import ../scripts.nix { inherit pkgs; }; # i need to think of a better way for this mess

  specialArgs = {
    inherit scripts;
  } // inputs;
in
nixpkgs.lib.nixosSystem {
  inherit system pkgs specialArgs;

  modules = [
    home-manager.nixosModules.home-manager
    {
      home-manager.extraSpecialArgs = {
        inherit conf scripts;
        pkgs-stable = import nixpkgs-stable { inherit system; };
      };
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.sharedModules = [ sops-nix.homeManagerModules.sops ];
    }
    sops-nix.nixosModules.sops
    impermanence.nixosModules.impermanence

    conf.hostConfig
    conf.hardware-configuration

    ./boot.nix
    ./cups.nix
    ./font.nix
    ./general.nix
    ./layout.nix
    ./networking.nix
    ./nix.nix
    ./pam.nix
    ./pipewire.nix
    ./sops.nix
    ./ssh.nix
    ./steam.nix
    ./users.nix
    ./virtualisation.nix
    (if conf.window-system == "x11" then ./x11 else ./wayland)
  ] ++ conf.host-modules;
}
