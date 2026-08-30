{ pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  time.timeZone = "America/El_Salvador";

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];

  programs.firefox.enable = true;
  # programs.niri.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.users.tony = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "networkmanager"
    ];
    packages = with pkgs; [ tree ];
  };
  environment.systemPackages = with pkgs; [
    wget
    gcc
    git
    curl
    pciutils
    gamemode
    lm_sensors
  ];
}
