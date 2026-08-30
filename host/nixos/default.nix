{ config, lib, pkgs, ... }:

{
  imports = [
  ./hardware-configuration.nix
  ./modules/boot.nix
  ./modules/hardware.nix
  ./modules/system.nix
  ./modules/services.nix
  ];

  system.stateVersion = "26.05";
}
