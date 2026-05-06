{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations.ol-reliable = let
      # TODO: pass common values as arguments
      user = "seha";
    in nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit user; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs user; };
            users."${user}" = ./home;
          };
        }
      ];
    };
  };
}
