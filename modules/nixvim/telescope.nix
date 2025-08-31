_: {
  config.vim.fzf-lua = {
    enable = true;
    setupOpts = {
      profile = "fzf-native"; # Maximum performance with native fzf
    };
  };

  config.vim.keymaps = [
    {
      key = "<leader> ";
      mode = "n";
      action = "require('fzf-lua').files";
      lua = true;
      silent = true;
      desc = "Find files (fzf-lua)";
    }
    {
      key = "<leader>sg";
      mode = "n";
      action = "require('fzf-lua').live_grep";
      lua = true;
      silent = true;
      desc = "Live grep (fzf-lua)";
    }
    {
      key = "<leader>s/";
      mode = "n";
      action = "require('fzf-lua').builtin";
      lua = true;
      silent = true;
      desc = "FzfLua builtin pickers";
    }
  ];
}
