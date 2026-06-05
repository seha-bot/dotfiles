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
    zswap.enable = true;
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 8 * 1024; # 8GB
    }
  ];

  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
  };

  security = {
    doas.enable = true;
    sudo.enable = false;
    doas.extraRules = [
      {
        users = [ "seha" ];
        persist = true;
      }
    ];
  };

  networking = {
    networkmanager.enable = true;
    hostName = "ol-reliable";
  };

  services = {
    automatic-timezoned.enable = true;

    kmonad = {
      enable = true;
      keyboards.ergonomic = {
        device = "/dev/input/by-id/usb-ITE_Tech._Inc._ITE_Device_8176_-event-kbd";
        defcfg = {
          enable = true;
          fallthrough = true;
        };
        config = ''
          (defsrc
            esc
            caps
            lsft
            lctl lalt
          )

          (defalias
            cesc (tap-hold-next 200 esc lsft)
          )

          (deflayer base
            caps
            @cesc
            XX
            lalt lctl
          )
        '';
      };
    };

    openssh.enable = true;

    # TODO: wait for https://github.com/NixOS/nixos-hardware/pull/1630
    tlp.enable = false;
    tuned.enable = true;
  };

  hardware.graphics.enable = true;

  programs = {
    bash.enable = false;
    fish.enable = true;
    nano.enable = false;

    # TODO: you won't need this once you setup niri correctly
    niri.enable = true;
  };

  # TODO: this should be configured per user and per hostname
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-settings"
      "nvidia-x11"
      "obsidian"
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
