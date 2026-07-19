{
  programs.git = {
    enable = true;
    settings.user = {
      name = "LoC";
      email = "loc@locrealloc.de";
    };
    signing = {
      signByDefault = true;
      key = "LoCrealloc <loc@locrealloc.de>";
      format = "openpgp";
    };
  };
}
