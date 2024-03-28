{colors}: {
  type = "internal/fs";
  interval = "25";

  format = {
    mounted = {
      prefix = {
        text = "%{T2}  󰋊  %{T-}";
        foreground = "${colors.background}";
        background = "${colors.green}";
      };
      underline = "${colors.green}";
    };
  };

  label = {
    mounted = {
      text = "%mountpoint% %used% (%percentage_used%%)";
      margin = 2;
    };
    unmounted = {
      text = "%mountpoint% not mounted";
      margin = 2;
      foreground = "${colors.disabled}";
    };
  };
}
