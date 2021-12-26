{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./get-workspace-name.nix { inherit pkgs };
