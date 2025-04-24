{
  description = "Packages flake which installs the most commonly used software I need on all systems.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixgl.url = "github:guibou/nixGL";
  };

  outputs = { self, nixpkgs, flake-utils, nixgl }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        packages = import ./packages.nix  { inherit pkgs; nixgl=nixgl; };
      in {
        packages = {
          default = pkgs.buildEnv {
            name = "tools";
            paths = packages.common
              ++ (if pkgs.stdenv.isLinux then packages.linux else [])
              ++ (if pkgs.stdenv.isDarwin then packages.darwin else []);
          };
        };
      }
    );
}
