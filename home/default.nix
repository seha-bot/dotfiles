{ pkgs, ... }:

{
  imports = [
    ./fish.nix # shell
    ./foot.nix # terminal emulator
    ./git.nix
    ./niri # wayland compositor
    ./nixvim.nix # neovim wrapper for nix
    ./rofi.nix # app opener
    ./waybar # wayland status bar
    ./yazi.nix # TUI file manager
  ];

  home.packages = builtins.attrValues {
    inherit (pkgs)
      bat # cat, but bat
      brightnessctl
      direnv # per-directory environments
      easyeffects # TEMPORARILY HERE: can turn stereo sound into mono
      firefox
      fzf # fuzzy finder
      gitui # git ui
      imv # image viewer
      keepassxc # password manager
      nixd # nix LSP
      nixfmt # nix formatter
      obsidian # notes app
      pavucontrol # volume control
      ripgrep # grep which ignores .gitignore and hidden files
      unzip
      wdisplays # monitor setup tool for wayland
      wl-clipboard # wayland clipboard utils
      ;
  };

  dconf.settings = {
    # System-wide dark theme.
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
