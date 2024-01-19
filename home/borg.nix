{ config, lib, pkgs, ... }:

{
  services.borgbackup.jobs.loc-home = {
    paths = ["/home/loc" "/etc/nixos/configuration.nix"];
	encryption = {
	  mode = "repokey";
	  passCommand = "cat /home/loc/.config/borg/phrase";
	};
	exclude = [ ".cache" "*/node_modules" "*/venv" "*/.venv" ];
	compression = "zlib";
	removableDevice = true;
	group = "borg";
	user = "loc";
    postCreate = "dunstify -a Borg  -i /home/loc/.config/borg/icons/borg.png Borg 'Backup saved as $archiveName'";
	startAt = "hourly";
	persistentTimer = true;
	repo = "/run/media/loc/8d33822d-00fb-452d-829c-11555eb43193/borg/";
  };
}
