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
    ];
in
stdenv.mkDerivation rec {
  name = "split-atreus";
  nativeBuildInputs = nixPackages;
  system = builtins.currentSystem;
}
