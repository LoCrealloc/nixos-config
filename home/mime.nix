{
  xdg.mimeApps = {
    enable = true;
    defaultApplications =
      let
        browser = "librewolf.desktop";
      in
      {
        "text/html" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/about" = browser;
        "x-scheme-handler/unknown" = browser;
      };
  };
}
