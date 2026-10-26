{ pkgs, ... }:

{
  imports = [
    ./fish.nix # shell
    ./foot.nix # terminal emulator
    ./git.nix
    ./helix.nix # text editor
    ./niri.nix # wayland compositor
    ./rofi.nix # app opener
    ./waybar # wayland status bar
    ./yazi.nix # TUI file manager
  ];

  home.packages = with pkgs; [
    bat # cat, but bat
    brightnessctl
    dbeaver-bin # database manager (temporary)
    direnv # per-directory environments
    easyeffects # TEMPORARILY HERE: can turn stereo sound into mono
    firefox
    fzf # fuzzy finder
    ghc # haskell compiler
    gitui # git ui
    imv # image viewer
    javaPackages.compiler.openjdk17
    keepassxc # password manager
    logisim-evolution # digital circuit simulator (temporary)
    mpv # media player
    nix-output-monitor # pretty build info
    npins # nix dependency pinning
    obs-studio # screen recorder
    obsidian # notes app
    pavucontrol # volume control
    qbittorrent
    retroarch-free
    ripgrep # grep which ignores .gitignore and hidden files
    stremio-linux-shell # movies and tv shows
    tree # recursively list files
    unzip
    wdisplays # monitor setup tool for wayland
    wine # windows compatibility layer
    wl-clipboard # wayland clipboard utils
  ];

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
