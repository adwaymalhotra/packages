{
  description = "My flake with all the important pieces of software (and eventually dotfiles).";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=unstable";
    # nixgl.url = "github:guibou/nixGL";
    # ghostty.url = "github:ghostty-org/ghostty";
    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs.packages."x86_64-linux".default = let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in pkgs.buildEnv {
    name = "my-packages";
    paths = with pkgs; [
          direnv
          alacritty
          # easyeffects
          # foot
          # foot.terminfo
          # ghostty.packages.${system}ghostty
          # nix-direnv
          # nixgl.packages.${system}.nixGL
          # pipewire
          # waybar
          # wireplumber
    ];
  };
}
