{
  config.vim = {
    options =
      let
        indentWidth = 2;
      in
      {
        autoindent = true;
        shiftwidth = indentWidth;
        tabstop = indentWidth;

        # backup & swap
        backup = false;
        writebackup = false;
        swapfile = false;

        # mouse
        mouse = "nv";
        mousemodel = "extend";

        # search
        searchCase = "smart";
      };

    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };
  };
}
