{ pkgs, ... }:

{
  imports = [
    ./fish.nix
    ./foot.nix
    ./git.nix
    ./niri
    ./nixvim.nix
    ./rofi.nix
    ./waybar
    ./yazi.nix
  ];

  home.packages = builtins.attrValues {
    inherit (pkgs)
      bat
      brightnessctl
      direnv
      easyeffects
      firefox
      fzf
      # TODO: should this be inside ./git.nix?
      gitui
      imv
      keepassxc
      nixd
      nixfmt
      obsidian
      pavucontrol
      ripgrep
      tree
      unzip
      wdisplays
      wl-clipboard
      ;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.desktopEntries = {
    etf = {
      name = "ETF profile";
      categories = [ "WebBrowser" ];
      exec = "firefox -P etf";
    };
  };

  home.stateVersion = "26.05";
}
