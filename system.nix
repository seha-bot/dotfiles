let
  sources = import ./npins;

  home-manager = sources.home-manager;
  nixos-hardware = sources.nixos-hardware;
  nixpkgs = sources.nixpkgs;
  nixvim = import sources.nixvim;
  purescript-overlay = import sources.purescript-overlay;

  user = "seha";
in
import "${nixpkgs}/nixos" {
  specialArgs = { inherit user; };
  configuration = {
    nixpkgs.overlays = [ purescript-overlay.overlays.default ];
    imports = [
      {
        nix = {
          nixPath = [ "nixpkgs=${nixpkgs}" ];
          channel.enable = false;
          settings.experimental-features = [
            "nix-command"
          ];
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
