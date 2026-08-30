{ pkgs, inputs, ... }:

{
  home.username = "tony";
  home.homeDirectory = "/home/tony";
  home.stateVersion = "26.05";

  imports = [
    ./theme.nix
    ./modules/zsh.nix
    ./modules/kitty.nix
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
    fd
    fetch
    fastfetch
  ];

  programs.home-manager.enable = true;
}
