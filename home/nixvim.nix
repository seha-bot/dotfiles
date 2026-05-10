{ inputs, pkgs, ... }:

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
    };

    plugins = {
      telescope = {
        enable = true;

        extensions.fzf-native.enable = true;

        keymaps = {
          "<leader>f" = "find_files";
          "<leader>g" = "live_grep";
          "<leader>b" = "buffers";
          "<leader>h" = "help_tags";
        };
      };

      web-devicons.enable = true;
      which-key.enable = true;
    };

    extraPlugins = builtins.attrValues {
      inherit (pkgs.vimPlugins)
      vim-sleuth
      ;
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
