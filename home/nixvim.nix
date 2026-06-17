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
      dap = {
        enable = true;
        adapters = {
          executables = {
            lldb = {
              command = "${pkgs.lldb}/bin/lldb-dap";
            };
            gdb = {
              command = "${pkgs.gdb}/bin/gdb";
              args = [
                "--interpreter=dap"
                "--eval-command"
                "set print pretty on"
              ];
            };
          };
        };
        configurations = {
          cpp = [
            {
              type = "lldb";
              request = "launch";
              name = "Launch executable (LLDB)";
              program.__raw = ''
                function()
                  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end
              '';
              cwd = "\${workspaceFolder}";
              stopOnEntry = false;
              args.__raw = ''
                function()
                  local args_string = vim.fn.input('Arguments: ')
                  return vim.split(args_string, " +")
                end
              '';
            }
            {
              type = "gdb";
              request = "launch";
              name = "Launch executable (GDB)";
              program.__raw = ''
                function()
                  return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end
              '';
              cwd = "\${workspaceFolder}";
              stopOnEntry = false;
              args.__raw = ''
                function()
                  local args_string = vim.fn.input('Arguments: ')
                  return vim.split(args_string, " +")
                end
              '';
            }
          ];
        };
      };

      # UI for dap.
      dap-view = {
        enable = true;
        settings.winbar = {
          sections = [
            "watches"
            "scopes"
            "exceptions"
            "breakpoints"
            "threads"
            "repl"
            "console"
          ];
          controls = {
            enabled = true;
          };
        };
      };

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
            "<leader>f" = "format";
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
          "<leader><leader>" = "find_files";
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
      # dap-view panel
      {
        mode = "n";
        key = "<leader>m";
        action = ":DapViewToggle<CR>";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];
  };
}
