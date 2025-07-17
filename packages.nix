{ pkgs }:

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
    lf
    luarocks # simpler to install it here.
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
    bzmenu
    cliphist
    hypridle
    hyprpicker
    imv
    iwmenu
    kanata
    # swaylock # red screen after unlock; seems to be fixed at HEAD; build from source for now.
    swaynotificationcenter
    swww
    waybar
    wl-clipboard

    # System services which are out of date on Debian
    pipewire
    wireplumber
    # glibcLocales # seems to be required for rofi which fails to find locale without this

    # HW accelerated (require nixGL - to be installed separately)
    neovide
    nwg-look
    wdisplays
  ];
  darwin = with pkgs; [
    ghostty
  ];
}
