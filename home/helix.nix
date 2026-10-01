{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

    extraPackages = [
      pkgs.nixd
      pkgs.nixfmt

      pkgs.purescript-language-server
      pkgs.purs-tidy
    ];

    settings = {
      editor = {
        auto-format = false;
        auto-pairs = false;
        soft-wrap.enable = true;
        whitespace.render = {
          space = "all";
          tab = "all";
          nbsp = "all";
          nnbsp = "all";
          newline = "none";
        };
      };
      keys = {
        normal = {
          "C-k" = "expand_selection";
          "C-j" = "shrink_selection";
          "C-h" = "select_prev_sibling";
          "C-l" = "select_next_sibling";
          "C-f" = ":format";
          "X" = "extend_line_above";
          "V" = "copy_selection_on_prev_line";
        };
        select = {
          "C-f" = "flip_selections";
          "X" = "extend_line_above";
          "V" = "copy_selection_on_prev_line";
        };
      };
      editor.cursor-shape.insert = "bar";
      theme = "catppuccin_mocha";
    };

    languages = {
      language-server.purescript-language-server = {
        config.purescript.addNpmPath = true;
      };
    };
  };
}
