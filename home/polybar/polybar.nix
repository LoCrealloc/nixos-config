# Polybar 

{ config, lib, pkgs, ... }:
let
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
	settings = (import ./modules.nix { colors = colors; } );
	script = "";
  };
}
