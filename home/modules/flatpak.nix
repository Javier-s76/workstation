{
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    update.onActivation = true;
    packages = [
      "org.vinegarhq.Sober" # Roblox Linux Native
      "md.obsidian.Obsidian" # Obsidian
      "com.spotify.Client" # Spotify
    ];
  };
}
