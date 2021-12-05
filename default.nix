let
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

  pkgs = pinnedNixpkgs {
    inherit overlays;
  };
in pkgs
