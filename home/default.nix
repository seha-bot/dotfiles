{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./direnv.nix
    ./git.nix
    ./niri
    ./nixvim.nix
    ./rofi.nix
    ./vscode.nix
    ./waybar
    ./yazi.nix
  ];

  home.packages = builtins.attrValues {
    inherit (pkgs)
      bat
      brightnessctl
      easyeffects
      firefox
      fzf
      # TODO: should this be inside ./git.nix?
      gitui
      imv
      keepassxc
      nixd
      nixfmt
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
