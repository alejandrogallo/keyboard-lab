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
    hlint
    ];
in
mkShell rec {
  buildInputs = nixPackages;
}
