{ colors }:

{
  type = "internal/battery";

  full-at = "95";

  time-format = "%H:%M";

  format = {
    full = {
      prefix = {
	    text = "%{T2}  󰁹  %{T-}";
		foreground = "${colors.background}";
		background = "${colors.yellow}";
	  };
	  underline = "${colors.yellow}";
	};
	low = {
	  foreground = "${colors.alert}";
      prefix = {
	    text = "%{T2}  󱉞  %{T-}";
		foreground = "${colors.background}";
		background = "${colors.alert}";
	  };
	  underline = "${colors.alert}";
	};
	charging = {
      prefix = {
	    text = "%{T2}  󰂈  %{T-}";
		foreground = "${colors.background}";
		background = "${colors.yellow}";
	  };
	  underline = "${colors.yellow}";
	};
	discharging = {
      prefix = {
	    text = "%{T2}   󰁽  %{T-}";
		foreground = "${colors.background}";
		background = "${colors.yellow}";
	  };
	  underline = "${colors.yellow}";
	};
  };

  animation-charging = [ "󰂆" "󰂈" "󰂉" "󰂊" "󰂅" ];
  animation-charging-framerate = 750;

  animation-discharging = [ "󰁹" "󰂁" "󰁿" "󰁽" "󰁻" ];
  animation-discharging-framerate = 750;

  label = {
    full = {
      text = " %percentage_raw%%";
	  margin = "2";
	  minlen ="4";
	};
    low = {
      text = " LOW %percentage_raw%% (%time%)";
	  margin = "2";
	  minlen ="4";
	};
    charging = {
      text = "%percentage_raw%%";
	  margin = "2";
	  minlen ="4";
	};
    discharging = {
      text = " %percentage_raw%% (%time%)";
	  margin = "2";
	  minlen ="4";
	};
  };

}
