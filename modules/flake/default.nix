{
  lib,
  inputs,
  ...
}:
let
  inherit (lib)
    pipe
    mapAttrsToList
    hasSuffix
    concatLists
    optional
    optionals
    filter
    elem
    ;
  inherit (builtins) readDir pathExists;

  # dispatch table for file type handling
  fileHandlers = {
    regular =
      name: path: lib.optional (hasSuffix ".nix" name && name != "default.nix") (path + "/${name}");

    directory =
      name: path:
      let
        subPath = path + "/${name}";
      in
      lib.optional (pathExists (subPath + "/default.nix")) subPath ++ forAllNixFiles subPath;
  };

  # recursively discover .nix files
  forAllNixFiles =
    path:
    lib.optionals (pathExists path) (
      pipe (readDir path) [
        (lib.mapAttrsToList (name: type: (fileHandlers.${type} or (_: _: [ ])) name path))
        concatLists
      ]
    );

  # nixvim modules configuration
  modulesDir = inputs.self + "/modules/nixvim";
  ignoredModules = [
    #"${modulesDir}/misc.nix"
  ];

  allNixvimModules = forAllNixFiles modulesDir;
  nixvimModules.imports = filter (name: !(elem name ignoredModules)) allNixvimModules;

  mkNvimConf = pkgs: modules: (inputs.nvf.lib.neovimConfiguration { inherit pkgs modules; }).neovim;
in
{
  /**
    Auto-discovery mechanism for modules.

    Recursively scans for .nix files and default.nix in directories.
  */
  imports = forAllNixFiles ./.;

  # nixvim package configuration
  perSystem =
    { self', pkgs, ... }:
    {
      formatter = pkgs.nixfmt-rfc-style;
      packages = {
        nvf = mkNvimConf pkgs [ nixvimModules ];
        default = self'.packages.nvf;
      };
    };
}
