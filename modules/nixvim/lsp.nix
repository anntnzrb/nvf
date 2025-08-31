{
  config.vim = {
    languages = {
      enableExtraDiagnostics = true;
      enableFormat = true;
    };

    lsp = {
      enable = true;
      formatOnSave = false;
      lspconfig.enable = true;
      null-ls.enable = true;
      nvim-docs-view.enable = false; # this is broken

      mappings =
        let
          prefix = "<leader>c";
          mkKey = k: "${prefix}${k}";
        in
        {
          codeAction = mkKey "a";
          format = mkKey "f";
          goToDeclaration = mkKey "gD";
          goToDefinition = mkKey "gd";
          goToType = mkKey "gt";
          renameSymbol = mkKey "r";

          hover = null; # K
          nextDiagnostic = null; # ]d
          previousDiagnostic = null; # [d
          addWorkspaceFolder = null;
          documentHighlight = null;
          listDocumentSymbols = null;
          listImplementations = null;
          listReferences = null;
          listWorkspaceFolders = null;
          listWorkspaceSymbols = null;
          openDiagnosticFloat = null;
          removeWorkspaceFolder = null;
          signatureHelp = null;
          toggleFormatOnSave = null;
        };
    };

    keymaps = [
      {
        key = "<leader>csb";
        mode = "n";
        action = "require('fzf-lua').lsp_document_symbols";
        lua = true;
        silent = true;
        desc = "LSP: Document symbols";
      }
      {
        key = "<leader>csw";
        mode = "n";
        action = "require('fzf-lua').lsp_workspace_symbols";
        lua = true;
        silent = true;
        desc = "LSP: Workspace symbols";
      }
      {
        key = "<leader>cR";
        mode = "n";
        action = "require('fzf-lua').lsp_references";
        lua = true;
        silent = true;
        desc = "LSP: References";
      }
      {
        key = "<leader>ci";
        mode = "n";
        action = "require('fzf-lua').lsp_implementations";
        lua = true;
        silent = true;
        desc = "LSP: Implementations";
      }
      {
        key = "<leader>cd";
        mode = "n";
        action = "require('fzf-lua').lsp_definitions";
        lua = true;
        silent = true;
        desc = "LSP: Definitions";
      }
      {
        key = "<leader>ct";
        mode = "n";
        action = "require('fzf-lua').lsp_typedefs";
        lua = true;
        silent = true;
        desc = "LSP: Type definitions";
      }
      {
        key = "<leader>cD";
        mode = "n";
        action = "require('fzf-lua').diagnostics_document";
        lua = true;
        silent = true;
        desc = "LSP: Document diagnostics";
      }
    ];
  };
}
