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
        packages = import ./packages.nix { inherit pkgs; nixgl = nixgl; };
        getName = guiApp:
          if guiApp ? meta && guiApp.meta ? mainProgram then
            guiApp.meta.mainProgram
          else if guiApp ? pname then
            guiApp.pname
          else
            guiApp.name;
        wrapWithNixGL = guiApp:
          let
            appName = getName guiApp;
          in
          pkgs.writeShellScriptBin appName ''
            exec ${nixgl.packages.${pkgs.system}.nixGLIntel}/bin/nixGLIntel ${guiApp}/bin/${appName} "$@"
          '';
        wrappedLinuxGuiPackages = map wrapWithNixGL packages.linux-gui;
      in
      {
        packages = {
          default = pkgs.buildEnv {
            name = "tools";
            paths = packages.common
              ++ (if pkgs.stdenv.isLinux then packages.linux else [ ])
              ++ (if pkgs.stdenv.isLinux then wrappedLinuxGuiPackages else [ ])
              ++ (if pkgs.stdenv.isDarwin then packages.darwin else [ ]);
          };
        };
      }
    );
}
