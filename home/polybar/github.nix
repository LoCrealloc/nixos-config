{ colors }:

{
  type = "custom/script";
  interval = "60";

  exec = "/home/loc/.config/polybar/polybar-scripts/github.sh";


  format = {
    prefix = {
	  text = "%{T2}  󰊤  %{T-}";
	  foreground = "${colors.background}";
	  background = "${colors.primary}";
	};
	underline = "${colors.primary}";
  };

  label = {
    offline = "GitHub offline";
    margin = 2;
  };

  api.url = "https://api.github.com";
}
