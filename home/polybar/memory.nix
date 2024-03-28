{colors}: {
  type = "internal/memory";
  interval = "0.5";

  format = {
    prefix = {
      text = "%{T2}  󰍛  %{T-}";
      foreground = "${colors.background}";
      background = "${colors.orange}";
    };
    underline = "${colors.orange}";
  };

  label = {
    text = "%gb_used% (%percentage_used%%)";
    margin = 2;
    minlen = 15;
  };
}
