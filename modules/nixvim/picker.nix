_: {
  config.vim.fzf-lua = {
    enable = true;
    setupOpts.profile = "fzf-native";
  };

  # yaml treesitter needed for fzf-lua previews
  config.vim.languages.yaml.enable = true;

  config.vim.keymaps = [
    {
      key = "<leader> ";
      mode = "n";
      action = ":FzfLua files<CR>";
      desc = "Find files";
    }
    {
      key = "<leader>sg";
      mode = "n";
      action = ":FzfLua live_grep<CR>";
      desc = "Live grep";
    }
    {
      key = "<leader>s/";
      mode = "n";
      action = ":FzfLua builtin<CR>";
      desc = "Builtin pickers";
    }
  ];
}
