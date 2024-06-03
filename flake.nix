{
  description = "LoC's system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , sops-nix
    , ...
    } @ inputs: {
      formatter."x86_64-linux" = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      nixosConfigurations.locs-thinkbook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = inputs;

        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [
              sops-nix.homeManagerModules.sops
            ];
          }
          sops-nix.nixosModules.sops

          ./configuration.nix
          ./hardware-configuration.nix

          ./boot.nix
          ./borg.nix
          ./cups.nix
          ./input.nix
          ./networking.nix
          ./nvidia.nix
          ./pam.nix
          ./pipewire.nix
          ./sddm.nix
          ./sops.nix
          #./ssh.nix
          ./steam.nix
          ./users.nix
          ./virtualisation.nix
          ./xserver.nix
        ];
      };
    };
}
