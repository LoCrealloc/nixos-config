{
  programs.git = {
    enable = true;
    settings.usee = {
      name = "LoCrealloc";
      email = "loc@locrealloc.de";
    };
    signing = {
      signByDefault = true;
      key = "LoCrealloc <loc@locrealloc.de>";
    };
  };
}
