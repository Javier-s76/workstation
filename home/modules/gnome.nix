{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dconf-editor
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions-appindicator
    gnomeExtensions.just-perfection
  ];

  dconf.settins = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmnu:close";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "blur-my-shell@gnort.baurthefirst"
        "dash-to-dock@micxgx.gmail.com"
        "appindicatorsupport@rgcjonas.gamil.com"
        "just-perfection-desktop@just-perfection"
      ];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      dock-position = "BOTTOM";
      dock-fixed = false;
      autohide-in-fullscreen = true;
      dash-max-icon-size = 38;
      transparency-mode = "FIXED";
      background-opacity = 0.55;
      custom-theme-shrink = true;
      show-trash = false;
      show-mounts = false;
    };
    "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.85;
      noise-amount = 0.0;
    };
    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      search = true;
    };
  };
}
