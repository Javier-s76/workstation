{ pkgs, inputs, ... }:

{
  home.username = "tony";
  home.homeDirectory = "/home/tony";
  home.stateVersion = "26.05";

  imports = [
    ./theme.nix
    ./modules/zsh.nix
  ];

  home.packages = with pkgs; [
    ripgrep
    neovim
    unzip
    tmux
    gnumake
    nil
    lua-language-server
    pyright
    bash-language-server
    nixfmt-rfc-style
    stylua
    black
    kitty
    fd
    fetch
    yazi
    cava
    fastfetch
  ];

  programs.home-manager.enable = true;
}
