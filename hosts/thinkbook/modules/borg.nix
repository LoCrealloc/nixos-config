{ config, pkgs, ... }:
{
  services.borgbackup.jobs.loc-home = {
    paths = [ "/home/loc" ];
    encryption = {
      mode = "repokey";
      passCommand = "cat ${config.sops.secrets."user/borgPhrase".path}";
    };
    exclude = [
      ".cache"
      "*/node_modules"
      "*/venv"
      "*/.venv"
      "Games"
      ".local/share/Steam"
    ];
    compression = "zlib";
    removableDevice = true;
    group = "borg";
    user = "loc";
    postCreate = ''
      export DISPLAY=:0
      export XAUTHORITY=/home/loc/.Xauthority
      export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
      ${pkgs.dunst}/bin/dunstify -a Borg  -i /home/loc/.config/borg/icons/borg.png Borg "Backup saved as $archiveName"
    '';
    startAt = "hourly";
    persistentTimer = true;
    repo = "/home/loc/backup/borg/";
    doInit = false;
  };

  sops.secrets."user/borgPhrase" = {
    owner = "loc";
    group = "borg";
    mode = "0660";
  };
}
