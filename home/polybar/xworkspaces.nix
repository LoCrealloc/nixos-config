{ colors }: {
  type = "internal/xworkspaces";

  icon = {
    text = [ "1;" "2;" "3;󰝚" "4;󰖟" "5;" "7;" "10;" ];
    default = "";
  };

  format = {
    prefix = {
      text = "%{T2}    %{T-}";
      foreground = "${colors.background}";
      background = "${colors.primary}";
    };
    underline = "${colors.primary}";
  };

  pin-workspaces = true;

  label = {
    active = {
      text = " %{T2} %icon% %{T-}";
      foreground = "${colors.background}";
      background = "${colors.primary}";
      padding = "1";
    };
    occupied = {
      text = "%{T2}%icon%%{T-}";
      padding = "1";
    };
    urgent = {
      text = "%{T2}%icon%%{T-}";
      background = "${colors.alert}";
      padding = "1";
    };
    empty = {
      text = "%{T2}%icon%%{T-}";
      foreground = "${colors.disabled}";
      padding = "1";
    };
  };
}
