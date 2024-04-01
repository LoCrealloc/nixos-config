{ colors }: {
  type = "internal/alsa";

  master-soundcard = "default";
  speaker-soundcard = "default";
  headphone-soundcard = "default";

  format = {
    volume = {
      text = "<label-volume>";
      underline = "${colors.violet}";
      prefix = {
        text = "%{T2}  󰕾  %{T-}";
        foreground = "${colors.background}";
        background = "${colors.violet}";
      };
    };
    muted = {
      underline = "${colors.secondary}";
      prefix = {
        text = "%{T2}  󰸈  %{T-}";
        foreground = "${colors.background}";
        background = "${colors.secondary}";
      };
    };
  };

  label = {
    volume = {
      text = "%percentage%%";
      margin = "2";
      minlen = "5";
      alignment = "center";
    };
    muted = {
      text = "muted";
      foreground = "${colors.disabled}";
      margin = "2";
    };
  };

  click-right = "pavucontrol";
}
