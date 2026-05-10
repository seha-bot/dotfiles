{
  programs.bash = {
    enable = true;

    shellAliases = {
      fop = ''
        find . -path '*/.*' -prune -o -type f -exec grep -n . {} + | fzf | sed -E 's/(.+):([0-9]+).*/+\2 \1/' | xargs -ro nvim
      '';
    };

    bashrcExtra = ''
      export PS1='\[\e[92;1m\]\w \$ \[\e[0m\]'
      export MOZ_USE_XINPUT2=1
      export EDITOR=nvim
    '';
  };
}
