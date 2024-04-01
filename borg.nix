{
  services.borgbackup.jobs.loc-home = {
    paths = [ "/home/loc" ];
    encryption = {
      mode = "repokey";
      passCommand = "cat /home/loc/.config/borg/phrase";
    };
    exclude = [ ".cache" "*/node_modules" "*/venv" "*/.venv" ];
    compression = "zlib";
    removableDevice = true;
    group = "borg";
    user = "loc";
    postCreate = ''
      export DISPLAY=:0
      export XAUTHORITY=/home/loc/.Xauthority
      export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
      /run/current-system/sw/bin/dunstify -a Borg  -i /home/loc/.config/borg/icons/borg.png Borg "Backup saved as $archiveName"
    '';
    startAt = "hourly";
    persistentTimer = true;
    repo = "/run/media/loc/backup/borg/";
    doInit = false;
  };
}
