{ colors }: {
  wm-name = "i3";
  width = "100%";
  height = "55pt";
  radius = "0";

  bottom = true;

  fixed-center = true;

  background = "${colors.background}";
  foreground = "${colors.foreground}";

  line-size = "4pt";

  border-top-size = "1pt";
  border-color = "${colors.border}";

  separator-foreground = "${colors.border}";

  font = [ "hack nerd font:size=18;2" "hack nerd font:size=25;2" ];

  enable-ipc = true;
}
