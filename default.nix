
# this file originates from SBTix
{ pkgs ? import <nixpkgs> {}
, cleanSource ? pkgs.lib.cleanSource
}:

let
  sbtix = pkgs.callPackage ./sbtix.nix {};
in
  sbtix.buildSbtProgram {
    name = "sbtix-sample-nix-managed-dependencies";
    src = cleanSource ./.;
    repo = [
      (import ./repo.nix)
      (import ./project/repo.nix)
      (import ./manual-repo.nix)
    ];
  }
