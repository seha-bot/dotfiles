{ pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bash.nix
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
    clang
    clang-tools
    cmake
    firefox
    fzf
    gitui
    imv
    lldb
    ninja
    pavucontrol
    ranger
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

  home.stateVersion = "26.05";
}
