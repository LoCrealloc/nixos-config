{
  monitor = "";
  "inherit" = "base";

  "modules" = {
    left = "xworkspaces";
    right = "fs-root fs-home alsa battery memory cpu wlan date";
  };

  cursor = {
    click = "pointer";
    scroll = "ns-resize";
  };
}
