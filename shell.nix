with import <nixpkgs> {};

let
  haskellDeps = ps: [
    ps.diagrams
    ps.diagrams-pgf
  ];
  ghc = haskellPackages.ghcWithPackages haskellDeps;
  nixPackages = [
    ghc
    binutils
    emacs
    ];
in
stdenv.mkDerivation rec {
  name = "gallo-xmonad";
  nativeBuildInputs = nixPackages;
  system = builtins.currentSystem;
}
