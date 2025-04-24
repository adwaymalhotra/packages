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
    ghostty
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
    yazi
    zellij
    zoxide
  ];
  linux = with pkgs; [
    easyeffects
    foot
    foot.terminfo

    brightnessctl
    grim
    hypridle
    hyprpicker
    imv
    kanata
    mako
    nwg-look
    pipewire
    rofi-wayland
    slurp
    # swaylock # red screen after unlock; seems to be fixed at HEAD; build from source for now.
    swww
    wireplumber
    waybar
    xwayland-satellite

    # niri # (doesn't seem to work with the systemd hook in .config; seems to be some opengl issues)
    # can't seem to install using this path
    # nixgl.packages.${system}.nixGL
  ];
  darwin = with pkgs; [];
}

# Things that are not here:
# niri
# swaylock (mainly because we need a fix that's not available in the nixpkgs)
# rustup (doesn't seem like there's a straightforward way to install this via nix, though I'm sure running a simple curl command is possible inside the flake)
# nixgl is required for apps that use the nix display environment. this is probably not necessary outside of work. not sure if it's easy to install this in a flake.
# neovim's beta versions don't seem to be available in nixpkgs

# This flake is useful for two main reasons:
# 1. This is a list packages that we require to be installed on most of our systems. We probably want these installed on a system if working on it interactively.
# 2. On cloudtops it is cumbersome to install these packages manually. The alternative is to create this list in a normal text file and then use a script to install it at bootstrap but it's not necessarily straightforward to do that on Debian systems where the newest available dependencies may be too old.

# There are downsides though. Nix represents a parallel set of libs and binaries to the installed Linux system. This means we are duplicating a lot of packages and using all that extra disk usage. And obviously, these need to be downloaded when setting up a computer.
