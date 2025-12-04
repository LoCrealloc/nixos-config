{
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=60m
  '';

  powerManagement.powertop.enable = true;

  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
}
