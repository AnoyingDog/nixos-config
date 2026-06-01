{ config, pkgs, inputs,...}:

{

  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;

    settings.vim = {

      opts = {
        tabstop = 2;
        shiftwidth = 2;
        clipboard = "unnamedplus";
        scrolloff = 10;
        expandtab = true;
      };

      clipboard = {
        providers.wl-copy.enable = true;
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      visuals = {
        nvim-web-devicons.enable = true;
        indent-blankline.enable = true;
      };

      statusline.lualine = {
        enable = true;
        theme = "dracula";
      };

      autopairs.nvim-autopairs = {
        enable = true;
      };

      telescope = {
        enable = true;

        mappings = {
          findFiles = "<C-p>";
          liveGrep = "<leader>lg";
        };
      };

      treesitter = {
        enable = true;
        context.enable = true;
        indent.enable = false;
      };

      utility = {
        oil-nvim = {
          enable = true;
          gitStatus.enable = true;
          setupOpts = {
            columns = [
              "icon"
                "size"
                "mtime"
            ];
          };
        };
        smart-splits.enable = true;
      };

      autocomplete.nvim-cmp.enable = true;

      snippets = {
        luasnip.enable = true;
      };


      lsp = {
        enable = true;
        trouble = {
          enable = true;
        };
        presets = {
#harper.enable = true; #spellchecking
        };
        mappings = {
          codeAction = "<leader>ca";
          hover = "K";
        };
      };

      languages = {
        nix = {
          enable = true;
          format = {
            enable = true;
            type = [ "nixfmt" ];
          };
          lsp.enable = true;
          lsp.servers = [ "nixd" ];
          treesitter.enable = true;
        };
        
        clang = {
          enable = true;
          dap.enable = true;
        };

        markdown.enable = true;
      };

      diagnostics = {
        enable = true;
        config.virtual_text = false;
        config.virtual_lines = true;
      };

      keymaps = [

#easier replace
      {
        key = "<leader>s";
        mode = "n";
        silent = false;
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/<Left>";
      }

#make file executable
      {
        key = "<leader>x";
        mode = "n";
        silent = true;
        action = "<cmd>!chmod +x %<CR>";
      }

#oil-nvim bind
      {
        key = "<C-n>";
        mode = "n";
        silent = true;
        action = "<CMD>Oil<CR>";
      }

      {
        key = "gd";
        mode = "n";
        action = "<cmd> lua vim.lsp.buf.definition()<cr>";
      }
      ];

    };
  };
}
