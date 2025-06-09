{ pkgs, nixgl }:

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
    ktfmt
    lutgen
    macchina
    nix-direnv
    neovim
    ripgrep
    ripgrep-all
    sd
    starship
    stylua
    yazi
    zellij
    zoxide
  ];
  linux = with pkgs; [
    easyeffects
    foot
    foot.terminfo

    brightnessctl
    hypridle
    hyprpicker
    imv
    kanata
    mako
    rofi-wayland
    # swaylock # red screen after unlock; seems to be fixed at HEAD; build from source for now.
    swww
    waybar
    swaynotificationcenter

    nixgl.packages.${system}.nixGLIntel

    # System services which are out of date on Debian
    pipewire
    wireplumber
  ];
  linux-gui = with pkgs; [
    neovide
    nwg-look
    ghostty
  ];
  darwin = with pkgs; [
    ghostty
  ];
}
