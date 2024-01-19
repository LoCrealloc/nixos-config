{ colors }:

{
  "base" = (import ./bars/base.nix { colors = colors; });
  "bar/mobile" = (import ./bars/mobile.nix);
  "bar/left" = (import ./bars/left.nix);
  "bar/right" = (import ./bars/right.nix);


  "module/date" = (import ./date.nix { colors = colors; });
  "module/alsa" = (import ./alsa.nix { colors = colors; });
  "module/battery" = (import ./battery.nix { colors = colors; });
  "module/cpu" = (import ./cpu.nix { colors = colors; });
  "module/memory" = (import ./memory.nix { colors = colors; });
  "module/xworkspaces" = (import ./xworkspaces.nix { colors = colors; });
  "module/wlan" = (import ./network.nix { colors = colors; });
  "fs-base" = (import ./filesystem/fs-base.nix { colors = colors; });
  "module/fs-home" = (import ./filesystem/fs-home.nix { colors = colors; });
  "module/fs-root" = (import ./filesystem/fs-root.nix { colors = colors; });
  "module/github" = (import ./github.nix { colors = colors; });
  "module/mattermost" = (import ./mattermost.nix { colors = colors; });
  "module/wireguard" = (import ./wireguard.nix { colors = colors; });
}
