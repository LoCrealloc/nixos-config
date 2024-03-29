{pkgs, lib, config, ...}: let
  colors = {
    background = "#0f111a";
    foreground = "#ffffff";
    primary = "#89ddff";
    secondary = "#80869e";
    alert = "#ff5370";
    disabled = "#546e7a";
    border = "#82aaff";
    green = "#c3e88d";
    yellow = "#ffcb6b";
    violet = "#945eb8";
    orange = "#f78c6c";
  };
in {
  services.polybar = {
    enable = true;
    package = pkgs.polybar.override {
      i3Support = true;
      githubSupport = true;
      pulseSupport = true;
      alsaSupport = true;
    };
    settings = import ./modules.nix {colors = colors; pkgs = pkgs; };
    script = ''
			pkill polybar

			export DISPLAY=:0

			count=0

			out=$(polybar --list-monitors | cut -d":" -f1)

			for m in $out; do
				count=$(($count+1))
			done

			if [ $count == 3 ]; then
				polybar --reload left &
				polybar --reload middle &
				polybar --reload right &
			elif [ $count == 2 ]; then
				polybar --reload left &
				polybar --reload right &
			else
				polybar --reload mobile &
			fi
		'';
  };

	systemd.user.services.polybar.Service.Environment = lib.mkForce "PATH=${config.services.polybar.package}/bin:${pkgs.coreutils}/bin:${pkgs.gnugrep}/bin:/run/wrappers/bin";
}
