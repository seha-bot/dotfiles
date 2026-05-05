{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export PS1='\[\e[92;1m\]\w \$ \[\e[0m\]'
    '';
  };
}
