{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-filter.url = "github:numtide/nix-filter";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      nix-filter,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells = {
          default = pkgs.mkShell {
            packages = [
              pkgs.gnumake
              pkgs.cmake
              pkgs.ninja
            ];
          };
        };

        packages = {
          default = pkgs.stdenv.mkDerivation {
            name = "the-truth";
            src = nix-filter {
              root = ./.;
              include = [
                "src"
                "CMakeLists.txt"
              ];
            };
            nativeBuildInputs = [
              pkgs.cmake
              pkgs.ninja
            ];
            doCheck = false;
          };
        };
      }
    );
}
