{ config, pkgs, ... } : {
  
  imports = [ ./zsh.nix ./git.nix ./i3.nix ./polybar/polybar.nix ./rofi.nix ./gtk.nix ];

  home.username = "loc";
  home.homeDirectory = "/home/loc";

  xdg.dataHome = "/home/loc/.local/share";
  xdg.configHome = "/home/loc/.config";

  home.stateVersion = "22.05";

  # GnuPG
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    pinentryFlavor = "tty";
  };

  home.packages = with pkgs; [
		# communication
		discord
		signal-desktop
		element-desktop
		thunderbird
		#mattermost-desktop
		weechat

		# browser
		firefox
		librewolf
		tor-browser-bundle-bin
		chromium
			
		# media
		spotify  
		spotify-tui
		playerctl
		pavucontrol
		cava
		glava
		vlc

		# infrastructure
		gnupg
		pinentry-curses
		networkmanager-openvpn
		networkmanagerapplet
		#nextcloud-client
		rofi
		age

		# development
		python310
		cargo
		rustc
		nodejs
		sqlite
		ccls
		#gcc
		clang
		valgrind

		# IDEs & editors
		neovim
		jetbrains.pycharm-community
		#jetbrains.webstorm

		# media editing
		darktable
		gimp
		nomacs
		obs-studio
		libgphoto2
		gphoto2
		ffmpeg
		#blender
		imagemagick
		#scribus
		#inkscape
		audacity
		#kdenlive

		# 3d printing / electronics
		cura
		freecad
		openscad
		#kicad

		# miscellaneous
		monero-gui
		gnome.nautilus
		xclip
		scrot
		zip
		unzip
		parted
		sl
		cmatrix
		virt-manager
		terminator
		pdf2svg

		# documents
		libreoffice
		texlive.combined.scheme-full
		mupdf
		onlyoffice-bin

		# fonts
		google-fonts

		# shell
		alacritty
		htop
		gtop
		btop
		powertop
		calc
		neofetch

		# GTK
		gtk-engine-murrine
		lxappearance


		# games
		openttd
		prismlauncher
  ];

  programs.home-manager.enable = true;

  services.network-manager-applet.enable = true;

 }
