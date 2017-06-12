{ mkDerivation, base, lib, QuickCheck, stdenv, tasty, tasty-quickcheck, unification-fd }:
mkDerivation (rec {
  pname = "Simplicity";
  version = "0.0.0";
  src = lib.sourceByRegex ./. ["^Simplicity\.cabal$" "^Setup.hs$" "^Tests.hs$" "^Haskell$" "^Haskell/.*"];
  libraryHaskellDepends = [ base unification-fd ];
  testHaskellDepends = libraryHaskellDepends ++ [ QuickCheck tasty tasty-quickcheck ];
  license = stdenv.lib.licenses.unfree;
})
