{
  config.vim = {
    spellcheck = {
      enable = false;
      languages = [
        "en"
        "es"
      ];
    };

    autopairs.nvim-autopairs.enable = true;

    notes.todo-comments = {
      enable = true;
      mappings.telescope = null;
    };

    keymaps = [
      {
        key = "<leader>st";
        mode = "n";
        action = "require('todo-comments.fzf').todo";
        lua = true;
        silent = true;
        desc = "Search TODO comments";
      }
    ];

    comments.comment-nvim = {
      enable = true;
      mappings =
        let
          s = "<leader>\/\/"; # [single] SPC / /
          m = "<leader>\/\."; # [multi]  SPC / .
        in
        {
          # single
          toggleCurrentLine = s;
          toggleOpLeaderLine = s;
          toggleSelectedLine = s;
          # multi
          toggleCurrentBlock = m;
          toggleOpLeaderBlock = m;
          toggleSelectedBlock = m;
        };
    };
  };
}
