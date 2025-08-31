{
  description = "annt's nixified Neovim via nvf";

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;
      imports =
        let
          modulesDir = ./modules/flake;
        in
        with builtins;
        map (mod: "${modulesDir}/${mod}") (attrNames (readDir modulesDir));
    };

  inputs = {
    nixpkgs.follows = "nvf/nixpkgs";
    flake-parts.follows = "nvf/flake-parts";

    nvf.url = "github:notashelf/nvf/main";
  };
}
