{
  description = "annt's nixified Neovim via nvf.";

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;
      imports =
        let
          modulesDir = ./flake;
        in
        with builtins;
        map (mod: "${modulesDir}/${mod}") (attrNames (readDir modulesDir));
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts/main";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    nvf = {
      url = "github:notashelf/nvf/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-parts.follows = "flake-parts";

        # optionals
        flake-utils.follows = "";
        systems.follows = "";
        rnix-lsp.follows = "";
        nil.follows = "";
      };
    };
  };
}
