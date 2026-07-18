{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    nixpkgs.source = inputs.nixpkgs;

    extraPackages = [
      pkgs.nixd
      pkgs.nixfmt
    ];

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      clipboard = "unnamedplus";

      list = true;
      listchars = {
        tab = ">-";
        space = "·";
        trail = "·";
        nbsp = "·";
      };

      expandtab = true;
      tabstop = 4;
      shiftwidth = 0;

      ignorecase = true;
      smartcase = true;

      number = true;
      relativenumber = true;
      signcolumn = "yes:1";

      foldlevelstart = 99;
      scrolloff = 5;
      jumpoptions = "stack";
      grepprg = "rg --vimgrep";
    };

    colorschemes.catppuccin = {
      enable = true;
      settings.transparent_background = true;
    };

    plugins = {

      lsp = {
        enable = true;

        servers = {
          clangd = {
            enable = true;
            cmd = [
              "clangd"
              "--background-index"
            ];
          };
          nixd.enable = true;
        };

        keymaps = {
          diagnostic = {
            "<leader>e" = "open_float";
          };
          lspBuf = {
            "<leader>a" = "code_action";
            "<leader><leader>" = "format";
            "<leader>r" = "rename";
          };
        };
      };

      # Highlight same words as the one under cursor.
      mini-cursorword.enable = true;

      # Autodetect tab/space.
      sleuth.enable = true;

      # Highlighting for various todo comments.
      todo-comments.enable = true;

      # Fuzzy search for various lists.
      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        keymaps = {
          "<leader>f" = "find_files";
          "<leader>g" = "live_grep";
          "<leader>b" = "buffers";
          "<leader>h" = "help_tags";
          "<leader>d" = "diagnostics";
          "gd" = "lsp_definitions";
          "<leader>/" = "current_buffer_fuzzy_find";
        };
      };

      # Folding, highlighting and better indentation.
      treesitter = {
        enable = true;
        folding.enable = true;
        highlight.enable = true;
        indent.enable = true;
        grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
          cpp
          bash
          json
          make
          markdown
          nix
          regex
          toml
          vim
          vimdoc
          xml
          yaml
        ];
      };

      # Icon pack. Required for telescope.
      web-devicons.enable = true;

      # Keymap help menu.
      which-key.enable = true;
    };

    keymaps = [
      # Remain in visual mode after indenting.
      {
        mode = "v";
        key = ">";
        action = ">gv";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<";
        action = "<gv";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];
  };
}
