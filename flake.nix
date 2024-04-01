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

    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , alejandra
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
          }

          ./configuration.nix
          ./hardware-configuration.nix

          ./boot.nix
          ./borg.nix
          ./cups.nix
          ./networking.nix
          ./nvidia.nix
          ./ollama.nix
          ./pam.nix
          ./pipewire.nix
          ./ssh.nix
          ./steam.nix
          ./users.nix
          ./virtualisation.nix
          ./xserver.nix
        ];
      };
    };
}
