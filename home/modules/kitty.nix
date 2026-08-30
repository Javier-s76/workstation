{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      name = "Iosevka Nerd Font";
      size = 11;
    };
    themeFile = "Catppuccin-Mocha";

    settings = {
      window_padding_width = 2;
      term = "xterm-kitty";
    };
  };
}
