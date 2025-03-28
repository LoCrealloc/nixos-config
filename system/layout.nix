{
  services.xserver.xkb = {
    layout = "de";
    variant = "neo_qwertz";
    model = "pc105";
  };

  console = {
    useXkbConfig = true;
  };
}
