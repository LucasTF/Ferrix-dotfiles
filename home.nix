{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Home Packages
  home.packages = with pkgs; [
    feh # Terminal Image Viewer
    fastfetch # Fetch
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice"; # Icon theme
    ".config/waybar".source = ./home/external/waybar;
  };

  # ncspot
  programs.ncspot = {
    enable = true;
    package = pkgs.ncspot;
  };

  # Git
  programs.git = {
    enable = true;
    userName = "Lucas Ferreira";
    userEmail = "lucas.htferreira@outlook.com";
  };

  # XDG
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = "${config.home.homeDirectory}/Desktop";
      documents = "${config.home.homeDirectory}/Documents";
      download = "${config.home.homeDirectory}/Downloads";
      music = "${config.home.homeDirectory}/Music";
      pictures = "${config.home.homeDirectory}/Images";
      videos = "${config.home.homeDirectory}/Videos";
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/*" = [ "feh.desktop" ];
      };
    };

    desktopEntries = {
      feh = {
        name = "Feh";
        type = "Application";
        genericName = "Image Viewer";
        exec = "feh -.";
        terminal = false;
        categories = [ "Graphics" "Viewer" ];
        mimeType = [ "image/jpeg" "image/png" "image/gif" "image/svg+xml" "image/webp" "image/bmp" ];
      };
    };
  };

  # GTK
  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus Icon Theme";
    };
  };

  # Qt
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "breeze-dark";
    style.package = pkgs.libsForQt5.breeze-qt5;
  };

  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {
	    window = {
        opacity = 0.8;
        blur = true;
	      dimensions = {
		      columns = 140;
		      lines = 36;
	      };
	    };
	    font = {
	      size = 12.5;
	      normal = {
	        family = "CaskaydiaCove Nerd Font";
		      style = "Regular";
	      };
	    };
    };
  };

  # ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lucas/etc/profile.d/hm-session-vars.sh
  #
  home.shellAliases = {
    neofetch = "fastfetch";
  };
    
  home.sessionVariables = {
    BROWSER = "firefox";
    EDITOR = "vscode";
    TERMINAL = "alacritty";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
