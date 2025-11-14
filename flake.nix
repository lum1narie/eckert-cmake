{
  description = "A flake for building eckert";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        eckertDrv = pkgs.stdenv.mkDerivation {
          src = self;
          name = "eckert";

          nativeBuildInputs = with pkgs; [
            cmake
            ninja
          ];

          installPhase = ''
            mkdir -p $out/bin
            cp eckert $out/bin/
            mkdir -p $out/share/doc
            cp -r ${self}/doc/. $out/share/doc/
          '';
        };
      in
      {
        formatter = pkgs.nixpkgs-fmt;
        packages = {
          default = eckertDrv;
          eckert = eckertDrv;
        };
      });
}
