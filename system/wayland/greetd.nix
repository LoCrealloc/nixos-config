{
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        user = "loc";
        command = "agreety --cmd sway";
      };
      initial_session = {
        command = "sway --unsupported-gpu";
        user = "loc";
      };
    };
  };
}
