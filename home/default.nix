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
  ];

  home.packages = builtins.attrValues {
    inherit (pkgs)
    bat
    brightnessctl
    firefox
    fzf
    gitui
    imv
    pavucontrol
    ranger
    ripgrep
    tree
    unzip
    wdisplays
    wget
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
