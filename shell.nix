with import <nixpkgs> {};

let
  haskellDeps = ps: [
    ps.diagrams
    #ps.diagrams-pgf
    ps.implicit
    ps.dhall
    ps.haskell-language-server
    ps.cabal-install
  ];
  myghc = haskellPackages.ghcWithPackages haskellDeps;
  nixPackages = [
    myghc
    binutils
    inkscape
    hlint
    emacs
    ];
in
mkShell rec {
  buildInputs = nixPackages;
}
