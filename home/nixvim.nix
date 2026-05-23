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

    colorschemes.github-theme = {
      enable = true;
      settings.options = {
        transparent = true;
      };
    };

    plugins = {
      lsp = {
        enable = true;

        servers = {
          clangd.enable = true;
          nixd.enable = true;
        };

        keymaps.lspBuf = {
          "<leader>a" = "code_action";
          "<leader>f" = "format";
        };
      };

      sleuth.enable = true;

      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
        keymaps = {
          "<leader><leader>" = "find_files";
          "<leader>g" = "live_grep";
          "<leader>b" = "buffers";
          "<leader>h" = "help_tags";
        };
      };

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

      web-devicons.enable = true;
      which-key.enable = true;
    };

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
