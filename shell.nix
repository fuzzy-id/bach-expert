{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc865" }:
let
  build = nixpkgs.pkgs.haskell.packages.${compiler}.callPackage ./bach-expert.nix { };
in
build.env
