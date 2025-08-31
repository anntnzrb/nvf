{
  pkgs,
  ...
}:
{
  config.vim.languages.nix = {
    enable = true;
    lsp.server = "nixd";
    format = {
      package = pkgs.nixfmt-rfc-style;
      type = "nixfmt";
    };
  };

  # FIXME: this should be bundled by the above; expecting upstream fix
  config.vim.extraPackages = [ pkgs.nixd ];
}
