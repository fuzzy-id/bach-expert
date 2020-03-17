{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc865"}:
let
  site = nixpkgs.pkgs.haskell.packages.${compiler}.callPackage ./bach-expert.nix { };
in
nixpkgs.stdenv.mkDerivation {
  name = "bach-expert-pages";
  buildInputs = [ site ];
  src = ./.;
  buildPhase = ''
    site build
    '';
  installPhase = ''
    mkdir $out
    cp -R _site/* $out
    '';
}
