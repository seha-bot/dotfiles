{
  pkgs,
  lib,
  user,
  ...
}:

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
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  networking = {
    networkmanager.enable = true;
    hostName = "ol-reliable";
  };

  services = {
    automatic-timezoned.enable = true;
    openssh.enable = true;
    power-profiles-daemon.enable = true;
  };

  hardware.graphics.enable = true;

  # TODO: you won't need this once you setup niri correctly
  programs.niri.enable = true;
  programs.nano.enable = false;

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "vscode"
    ];

  fonts.packages = [
    pkgs.font-awesome
    pkgs.nerd-fonts.sauce-code-pro
    pkgs.nerd-fonts.symbols-only
    pkgs.noto-fonts
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.channel.enable = false;

  system.stateVersion = "26.05";
}
