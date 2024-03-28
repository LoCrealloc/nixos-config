{
	pkgs,
	...
} : {
	services.dunst = {
		enable = true;

		iconTheme = {
      package = pkgs.flat-remix-icon-theme;
      name = "Flat-Remix-Violet-Dark";
    };

		settings = {
			global = {
				monitor = "0";
				follow = "none";

				width = "300";
				height = "300";
				origin = "top-right";
				offset = "10x50";
				scale = "0";

				notification_limit = "0";
				sort = "yes";
				idle_threshold = "120";
				indicate_hidden = "yes";

				progress_bar = "true";
				progress_bar_height = "10";
				progress_bar_frame_width = "1";
				progress_bar_min_width = "150";
				progress_bar_max_width = "300";

				font = "hack 10";
				transparency = "0";
				separator_height = "2";
				padding = "8";
				horizontal_padding = "8";
				text_icon_padding = "0";
				icon_position = "left";
				line_height = "0";
				frame_width = "3";
				frame_color = "#89ddff";
				separator_color = "frame";

				alignment = "left";
				vertical_alignment = "center";
				ellipsize = "middle";

				markup = "full";
				format = "<b>%s</b>\n%b";
				ignore_newline = "none";
				show_indicators = "yes";
				show_age_threshold = "60";
				stack_duplicates = "true";
				hide_duplicate_count = "false";
			};

			urgency_low = {
				background = "#0f111a";
				foreground = "#ffffff";
				timeout = "10";
			};

			urgency_normal = {
				background = "#0f111a";
				foreground = "#ffffff";
				timeout = "10";
			};

			urgency_critical = {
				background = "#0f111a";
				foreground = "#ffffff";
				frame_color = "#ff5370";
				timeout = "0";
			};
		};
	};
}
