{ pkgs, user, ... }:

{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./niri
    ./waybar
  ];

  home.packages = with pkgs; [
    ranger
    tree
    wget
    bat
  ];

  # home.username = user;
  # home.homeDirectory = "/home/${user}";
  programs.home-manager.enable = true;

  programs = {
    firefox.enable = true;
    git = {
      enable = true;
      settings.user.name = "seha-bot";
      settings.user.email = "nedimsehic50@gmail.com";
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      initLua = ''
        vim.opt.clipboard = "unnamedplus"
      '';
    };
  };

  home.stateVersion = "26.05";
}
