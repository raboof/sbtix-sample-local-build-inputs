# sbtix local dependency sample

This is a sample project showing how to use `sbtixBuildInputs` to
provide a dependency that is provided by a local derivation instead
of fetched from a Maven/Ivy repository.

## About this feature

To make sure transitive dependencies and overrides work correctly,
the local dependency must be available both when running 'sbtix-gen'
and when building. You provide it in a `sbtix-build-inputs.nix` file,
which could hold a single dependency:

```
{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./scala-scraper {}
```

.. or multiple:

```
{ pkgs ? import <nixpkgs> {} }:

pkgs.symlinkJoin {
  name = "sbtix-dependencies";

  paths = [
    (pkgs.callPackage ./scala-scraper {})
    # ... more local dependencies
  ];
}
```

This file is picked up by name by `sbtix-gen`, and passed
in as a parameter in `default.nix`:

```
sbtix.buildSbtProgram {
    ...
    sbtixBuildInputs = (pkgs.callPackage ./sbtix-build-inputs.nix {});
    ...
}
```

## About this example

In this example, the local dependency is a fork of
https://github.com/ruippeixotog/scala-scraper with
some changes, such as removed/additional dependencies
and a change to the API. This fork is loaded as a git
submodule, so you have to `git submodule update`
before running both `sbtix-gen` and the 'real' build.

