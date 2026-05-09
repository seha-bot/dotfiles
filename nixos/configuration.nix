{ pkgs, lib, user, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        efiSupport = true;
        device = "nodev";
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  networking = {
    networkmanager.enable = true;
    hostName = "ol-reliable";
  };

  services = {
    openssh.enable = true;
  };

  hardware.graphics.enable = true;

  # TODO: you won't need this once you setup niri correctly
  programs.niri.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
  ];

  fonts.packages = builtins.attrValues {
    inherit (pkgs)
    font-awesome
    noto-fonts
    noto-fonts-cjk-sans
    ;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";
}
