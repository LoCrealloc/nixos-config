{ colors }:

{
  type = "internal/cpu";

  interval = "0.5";

  format = {
    prefix =  {
	  text = "%{T2}    %{T-}";
	  foreground = "${colors.background}";
	  background = "${colors.green}";
	};
	underline = "${colors.green}";
  };

  label = {
    text = "%percentage%%";
    margin = "2";
	minlen = "4";
	alignment = "center";
  };
}
