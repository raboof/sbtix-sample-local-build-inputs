
# this file originates from SBTix
{ pkgs ? import <nixpkgs> {}
, cleanSource ? pkgs.lib.cleanSource
}:

let
  sbtix = pkgs.callPackage ./sbtix.nix {};
in
  sbtix.buildSbtProgram {
    name = "sbtix-sample-build-inputs";
    src = cleanSource ./.;
    sbtixBuildInputs = (pkgs.callPackage ./sbtix-build-inputs.nix {});
    repo = [
      (import ./repo.nix)
      (import ./project/repo.nix)
      (import ./manual-repo.nix)
    ];
  }
