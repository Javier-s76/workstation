{ pkgs, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    gtk3.extraConfig = {
      gtk-icon-theme-name = "Papirus-Dark";
      gtk-cursor-theme-name = "Bibata-Modern-Classic";
    };
    gtk4.extraConfig = {
      gtk-icon-theme-name = "Papirus-Dark";
      gtk-cursor-theme-name = "Bibata-Modern-Classic";
    };
  };
}
