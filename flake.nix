{
  description = "LoC's system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/release-24.05";
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
    {
      nixpkgs,
      home-manager,
      sops-nix,
      nixpkgs-stable,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      scripts = import ./scripts.nix { pkgs = import nixpkgs { inherit system; }; };
    in
    {
      formatter."x86_64-linux" = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      nixosConfigurations.locs-thinkbook = nixpkgs.lib.nixosSystem {
        system = system;
        specialArgs = inputs // {
          scripts = scripts;
        };

        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.extraSpecialArgs = {
              scripts = scripts;
              pkgs-stable = import nixpkgs-stable { inherit system; };
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [ sops-nix.homeManagerModules.sops ];
          }
          sops-nix.nixosModules.sops

          ./system
        ];
      };
    };
}
