{
  description = "annt's nixified Neovim via nvf";

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;
      imports = [ ./modules/flake ];
    };

  inputs = {
    nixpkgs.follows = "nvf/nixpkgs";
    flake-parts.follows = "nvf/flake-parts";

    nvf.url = "github:notashelf/nvf/main";
  };
}
