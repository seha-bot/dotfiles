{ pkgs, ... }:

{
  # TODO: https://github.com/nix-community/home-manager/issues/7250
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  # TODO sync this with niri config once the issue above gets resolved
  home.pointerCursor = {
    enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    size = 32;
  };
}
