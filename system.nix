let
  sources = import ./npins;

  home-manager = sources.home-manager;
  nixos-hardware = sources.nixos-hardware;
  nixpkgs = sources.nixpkgs;
  nixvim = import sources.nixvim;

  user = "seha";
in
import "${nixpkgs}/nixos" {
  specialArgs = { inherit user; };
  configuration = {
    imports = [
      {
        nix = {
          nixPath = [ "nixpkgs=${nixpkgs}" ];
          channel.enable = false;
        };
      }
      ./nixos/configuration.nix
      "${nixos-hardware}/lenovo/ideapad/15ach6"
      "${home-manager}/nixos"
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit nixvim; };
          users."${user}" = ./home;
        };
      }
    ];
  };
}
