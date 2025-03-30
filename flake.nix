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

    impermanence.url = "github:nix-community/impermanence";
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    {
      formatter."x86_64-linux" = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

      nixosConfigurations =
        let
          lib = nixpkgs.lib;

          hosts = builtins.attrNames (builtins.readDir ./hosts);
          importHostConf =
            host:
            import ./hosts/${host} inputs
            // {
              hostname = "locs-${host}";
              hardware-configuration = ./hosts/${host}/hardware-configuration.nix;
              host-modules = map (module: ./. + ("/hosts/${host}/modules/" + module)) (
                lib.lists.remove ".gitkeep" (builtins.attrNames (builtins.readDir ./hosts/${host}/modules))
              );
            };

          mkNixOSConfig =
            host:
            import ./system (
              inputs
              // {
                conf = importHostConf host;
              }
            );
        in
        builtins.listToAttrs (
          map (
            host:
            let
              system = mkNixOSConfig host;
            in
            {
              name = system.config.networking.hostName;
              value = system;
            }
          ) hosts
        );
    };
}
