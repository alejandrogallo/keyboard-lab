with import <nixpkgs> {};

let
  haskellDeps = ps: [
    ps.diagrams
    ps.diagrams-pgf
    ps.implicit
    ps.haskell-language-server
    ps.cabal-install
  ];
  ghc = unstable.haskellPackages.ghcWithPackages haskellDeps;
  nixPackages = [
    ghc
    binutils
    hlint
    emacs26
    ];
in
mkShell rec {
  buildInputs = nixPackages;
}
