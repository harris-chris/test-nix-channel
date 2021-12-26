let
  pkgs = import <nixpkgs> {};
  pinnedNixpkgs = import ./pinned-nixpkgs.nix;

  hello = pkgs.writeShellScriptBin "hello" ''
    echo "Hello from the Nix channel overlay 😀!"
  '';

  goodbye = pkgs.writeShellScriptBin "goodbye" ''
    echo "So sad that you must go 😕!"
  '';

  overlays = [
    (self: super: {
      inherit goodbye hello;
    })
  ];

  channelPackages = {
    inherit hello;
    inherit overlays;
    getworkspacename = pkgs.callPackage ./packages/get-workspace-name/get-workspace-name.nix {};
  };
in channelPackages
