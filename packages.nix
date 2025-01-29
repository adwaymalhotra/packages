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

    ghostty.packages.${system}.ghostty

    # toolchains
    cargo
    rustc
    rust-analyzer
  ];
  linux = with pkgs; [
    easyeffects
    foot
    foot.terminfo

    grim
    hypridle
    hyprpicker
    # hyprpaper # segfaults on work system with or without nixGL.
    swww
    kanata
    mako
    pipewire
    rofi-wayland
    slurp
    # swaylock # red screen after unlock; seems to be fixed at HEAD; build from source for now.
    wireplumber
    waybar
    xwayland-satellite

    # niri # (doesn't seem to work with the systemd hook in .config; seems to be some opengl issues)
    # can't seem to install using this path
    # nixgl.packages.${system}.nixGL
  ];
  darwin = with pkgs; [];
}

# Packages from home-manager
    # home-manager.packages.${system}.home-manager

    # Build ghostty from source until the nix package is fixed

    # Build nixGL
    # nixgl.packages.${system}.nixGL
