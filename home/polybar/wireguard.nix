{ colors }:

{
  type = "custom/script";
  interval = "5";

  exec = "/home/loc/.config/polybar/polybar-scripts/wireguard.sh";


  format = {
    prefix = {
	  text = "%{T2}  󰒒  %{T-}";
	  foreground = "${colors.background}";
	  background = "${colors.orange}";
	};
	underline = "${colors.orange}";
  };

  label = {
    margin = 2;
  };
}
