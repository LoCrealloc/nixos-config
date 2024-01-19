{ colors }:

{
  type = "custom/script";
  interval = "15";

  exec = "/home/loc/.config/polybar/polybar-scripts/mattermost.sh";


  format = {
    prefix = {
	  text = "%{T2}    %{T-}";
	  foreground = "${colors.background}";
	  background = "${colors.green}";
	};
	underline = "${colors.green}";
  };

  label = {
    margin = 2;
  };
}
