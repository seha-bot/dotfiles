{
  programs.fish = {
    enable = true;

    binds = {
      "\\t".command = "if commandline --paging-mode; true; else; commandline -f complete; end";
      right.command = "forward-char-passive";
      ctrl-f.command = "nextd-or-forward-word";
    };

    functions = {
      fish_prompt = ''
        set -l nix_shell_info (
          if test -n "$IN_NIX_SHELL"
            echo -n "<nix-shell> "
          end
        )
        set -l jobs (jobs | wc -l)
        echo -n -s (set_color -o brgreen) $nix_shell_info (prompt_pwd) ([ $jobs -gt 0 ] && echo " [$jobs]") ' $ ' (set_color normal)
      '';

      fish_greeting = "";
    };

    shellInit = ''
      set -gx EDITOR hx
    '';
  };
}
