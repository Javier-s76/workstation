{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  networking.hostName = "nixos"; # Define your hostname.
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.displayManager.ly = {
    enable = true;
    settings = {
      animate = false;
      hide_borders = true;
      clock = "%c";
      bigclock = true;
      hide_f1_commands = true;
    };
  };

  networking.networkmanager.enable = true;
  time.timeZone = "America/El_Salvador";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];  

  services.pipewire = {
     enable = true;
     pulse.enable = true;
     alsa.enable = true;
   };

  nix.gc = {
	  automatic = true;
	  dates = "weekly";
	  options ="--delete-older-than 7d";
  };

  nix.settings.auto-optimise-store = true;

  hardware.graphics = {
	  enable = true;
	  enable32Bit = true;
	  extraPackages = with pkgs; [
		  intel-media-driver
		  vulkan-validation-layers
	  ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
];

zramSwap = {
	enable = true;
	algorithm = "zstd";
	memoryPercent = 50;
};
programs.firefox.enable = true;
programs.niri.enable = true;
programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;

  users.users.tony = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "audio" "networkmanager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
    ];
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

  system.stateVersion = "26.05"; # Did you read the comment?

}

