{ config, ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      save = 10000;
      share = true;
      ignoreAllDups = true;
      path = "${config.home.homeDirectory}/.zsh_history";
    };

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake .#nixos";
      clean = "nix-collect-garbage -d";
    };
  };
}
