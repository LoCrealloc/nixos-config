{
  services.logind = {
    lidSwitch = "suspend-then-hibernate";
    lidSwitchDocked = "suspend-then-hibernate";
    extraConfig = ''
      HandlePowerKey=hibernate
    '';
  };
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=60m
  '';

  powerManagement.powertop.enable = true;

  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
}
