{ mkDerivation, base, binary, lens-family, lib, MemoTrie, QuickCheck, stdenv, SHA, tasty, tasty-hunit, tasty-quickcheck, unification-fd, vector }:
mkDerivation (rec {
  pname = "Simplicity";
  version = "0.0.0";
  src = lib.sourceFilesBySuffices
      (lib.sourceByRegex ./. ["^Simplicity\.cabal$" "^Setup.hs$" "^Tests.hs$" "^Haskell$" "^Haskell/.*"])
    [".cabal" ".hs"];
  libraryHaskellDepends = [ base binary lens-family MemoTrie SHA unification-fd vector ];
  testHaskellDepends = libraryHaskellDepends ++ [ QuickCheck tasty tasty-hunit tasty-quickcheck ];
  testTarget = ''--test-option="--quickcheck-replay=582534"'';
  license = stdenv.lib.licenses.unfree;
})
