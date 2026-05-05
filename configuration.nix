{ pkgs, user, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub.device = "/dev/vda1";
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    networkmanager.enable = true;
    hostName = "ol-reliable";
  };

  users.users."${user}" = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  time.timeZone = "Europe/Sarajevo";

  hardware.graphics.enable = true;
  programs.niri.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
  ];

  services = {
    openssh.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
