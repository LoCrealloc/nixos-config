{ colors }: {
  type = "internal/date";
  interval = "1";

  date = {
    text = "%H:%M";
    alt = "%d.%m.%Y %H:%M:%S";
  };

  format = {
    prefix = {
      text = "%{T2}  󰃰  %{T-}";
      foreground = "${colors.background}";
      background = "${colors.violet}";
    };
    underline = "${colors.violet}";
  };

  label = {
    text = "%date%";
    margin = 2;
    minlen = 5;
  };
}
