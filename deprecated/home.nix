{ pkgs, inputs, config, ...}:

{ 
	home.username = "tony";
	home.homeDirectory = "/home/tony";

	imports = [ inputs.noctalia.homeModules.default ];

	home.packages = with pkgs; [
		papirus-icon-theme
    bibata-cursors
    neovim
		ripgrep
		fd
		foot
		yazi
		cava
		fastfetch
	];

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

	programs.noctalia = {
		enable = true;
	};

	programs.starship = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.eza = {
		enable = true;
		icons = "auto";
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
			# Corregido: Se añade 'config.' antes de homeDirectory
			path = "${config.home.homeDirectory}/.zsh_history";
		};

		shellAliases = {
			ls = "eza --icons";
			ll = "eza -l --icons";
			la = "eza -la --icons";
			update = "sudo nixos-rebuild switch --flake .#nixos";
			hms = "home-manager switch";
			clean = "nix-collect-garbage -d";
		};
	};

	home.stateVersion = "26.05";
	programs.home-manager.enable = true;
}

