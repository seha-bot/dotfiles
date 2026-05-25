{
  programs.bash = {
    enable = true;

    bashrcExtra = ''
      export PS1='\[\e[92;1m\]\w $([ \j -gt 0 ] && echo "[\j] ")\$ \[\e[0m\]'
      export MOZ_USE_XINPUT2=1
      export EDITOR=nvim
    '';
  };
}
