{ colors }: {
  type = "internal/network";
  interval = "3";

  interface-type = "wireless";

  format = {
    connected = {
      text = "<label-connected>";
      underline = "${colors.primary}";
      prefix = {
        text = "%{T2}  󰖩  %{T-}";
        foreground = "${colors.background}";
        background = "${colors.primary}";
      };
    };
    disconnected = {
      text = "<label-disconnected>";
      prefix = {
        text = "WLAN ";
        foreground = "${colors.primary}";
      };
    };
  };

  label = {
    connected = {
      text = "%essid% (%downspeed%)";
      margin = "2";
    };
    disconnected = {
      text = " %{F#F0C674}%ifname%%{F#707880} disconnected";
      margin = "2";
    };
  };

  click-right = "alacritty";
}
