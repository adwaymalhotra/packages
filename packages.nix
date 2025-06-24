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
    # luarocks # simpler to install it here.
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
    cliphist
    hypridle
    hyprpicker
    imv
    kanata
    mako
    rofi-wayland
    # swaylock # red screen after unlock; seems to be fixed at HEAD; build from source for now.
    swaynotificationcenter
    swww
    waybar
    wl-clipboard

    # nixgl.packages.${system}.nixGLDefault

    # System services which are out of date on Debian
    pipewire
    wireplumber
  ];
  linux-gui = with pkgs; [
    neovide
    nwg-look
    # ghostty # this just seems to hog CPU time a lot. Probably an issue with nixGL.
    wdisplays
    # niri # I haven't been able to get this running via nix. local builds are still king.
  ];
  darwin = with pkgs; [
    ghostty
  ];
}
