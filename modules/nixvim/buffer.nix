let
  bufferMap = "<leader>b";
in
{
  config.vim = {
    maps.normal = {
      "${bufferMap}k" = {
        action = ":bdel<CR>";
        desc = "Buffer: Kill Current";
      };
      "${bufferMap}s" = {
        action = ":w<CR>";
        desc = "Buffer: Save";
      };
      "${bufferMap}-" = {
        action = ":bp<CR>";
        desc = "Buffer: Previous";
      };
      "${bufferMap}=" = {
        action = ":bn<CR>";
        desc = "Buffer: Next";
      };
    };

    keymaps = [
      {
        key = "<leader>bb";
        mode = "n";
        action = ":FzfLua buffers<CR>";
        desc = "Buffer picker";
      }
    ];
  };
}
