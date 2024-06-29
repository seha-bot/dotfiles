{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Sarajevo";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bs_BA.UTF-8";
    LC_IDENTIFICATION = "bs_BA.UTF-8";
    LC_MEASUREMENT = "bs_BA.UTF-8";
    LC_MONETARY = "bs_BA.UTF-8";
    LC_NAME = "bs_BA.UTF-8";
    LC_NUMERIC = "bs_BA.UTF-8";
    LC_PAPER = "bs_BA.UTF-8";
    LC_TELEPHONE = "bs_BA.UTF-8";
    LC_TIME = "bs_BA.UTF-8";
  };

  users.users.seha = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  services.xserver = {
    enable = true;
    autorun = false;
    layout = "us";
    xkbVariant = "";
    displayManager.startx.enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = builtins.readFile /home/seha/.config/xmonad/xmonad.hs;
      extraPackages = hpkgs: [ hpkgs.xmobar ];
    };
  };

  hardware.pulseaudio.enable = true;
  environment.systemPackages = with pkgs; [
    xmobar
    dmenu
    xorg.xmessage
    pavucontrol
    neovim
    firefox
    alacritty
    obsidian
    xplr
    nixfmt
    git
  ];

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "obsidian" ];

  environment.variables = { EDITOR = "nvim"; };

  system.stateVersion = "23.11";
}
