{ pkgs, ghostty, nixgl }:

let
  system = pkgs.system;
in {
  common = with pkgs; [
    bluetuith
    btop
    direnv
    dust
    eza
    fd
    fzf
    helix
    lutgen
    macchina
    nix-direnv
    neovide
    neovim
    ripgrep
    ripgrep-all
    starship
    stylua
    zellij
    zoxide

    # can't install ghostty from nixpkgs, and the git flake builds a version which complains about EGL
    # needs to be run using `nixGL`
    # ghostty.packages.${system}.ghostty
  ];
  linux = with pkgs; [
    easyeffects
    foot
    foot.terminfo

    kanata
    mako
    niri
    pipewire
    wireplumber
    waybar
    # nixgl.packages.${system}.nixGL
  ];
  darwin = with pkgs; [];
}

# Packages from home-manager
    # home-manager.packages.${system}.home-manager

    # Build ghostty from source until the nix package is fixed

    # Build nixGL
    # nixgl.packages.${system}.nixGL
