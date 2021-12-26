let
  channelPkgs = import <test-nix-channel>;
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  buildInputs = with channelPkgs; [
    hello
    getworkspacename
  ];
}
