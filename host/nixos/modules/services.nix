{ pkgs, ... }:

{
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;
  
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

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
  };
}
