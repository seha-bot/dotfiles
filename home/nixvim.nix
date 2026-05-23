{ config, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

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
      signcolumn = "number";

      foldlevelstart = 99;

      scrolloff = 5;
    };

    # Highlight with a box instead of an underline.
    extraConfigVim = ''
      hi! link MiniCursorword Visual
      hi! MiniCursorwordCurrent gui=nocombine guifg=NONE guibg=NONE
    '';

    colorschemes.catppuccin = {
      enable = true;
      settings.transparent_background = true;
    };

    plugins = {
      lsp = {
        enable = true;

        servers = {
          clangd.enable = true;
          nixd.enable = true;
        };

        keymaps = {
          diagnostic = {
            "<leader>e" = "open_float";
          };
          lspBuf = {
            "<leader>a" = "code_action";
            "<leader>f" = "format";
          };
        };
      };

      # Highlight same words as the one under cursor.
      mini-cursorword.enable = true;

      # Autodetect tab/space.
      sleuth.enable = true;

      # Fuzzy search for various lists.
      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        keymaps = {
          "<leader><leader>" = "find_files";
          "<leader>g" = "live_grep";
          "<leader>b" = "buffers";
          "<leader>h" = "help_tags";
          "<leader>d" = "diagnostics";
        };
      };

      # Folding and better indentation.
      treesitter = {
        enable = true;
        folding.enable = true;
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

    # Remain in visual mode after indenting.
    keymaps = [
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
