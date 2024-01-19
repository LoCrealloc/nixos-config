{
  description = "LoC's system flake";

	inputs = {
		nixpkgs = {
			url = github:NixOS/nixpkgs/nixos-unstable;
		};

		home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	};

  outputs = { self, nixpkgs, home-manager, ... }: {

		nixosConfigurations.locs-thinkbook = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";

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
				./pam.nix
				./pipewire.nix
				./steam.nix
				./users.nix
				./virtualisation.nix
				./xserver.nix
			];
		};

  };
}
