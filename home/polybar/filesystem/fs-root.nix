{ colors }: {
  "inherit" = "fs-base";
  mount-0 = "/";

  format = {
    mounted = {
      prefix = {
        foreground = "${colors.background}";
        background = "${colors.primary}";
      };
      underline = "${colors.primary}";
    };
  };
}
