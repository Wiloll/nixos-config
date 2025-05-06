{

    description = "My system configuration";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
        home-manager = {
            url = "github:nix-community/home-manager/release-24.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { nixpkgs, home-manager, ... }: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [ ./configuration.nix ];
        };

        homeConfigurations.wilol = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages."x86_64-linux";
            modules = [ ./home.nix ];
        };
    };
}