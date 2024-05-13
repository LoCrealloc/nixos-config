{
  services.picom = {
    enable = true;
    backend = "xrender";

    shadow = false;

    activeOpacity = 1;
    inactiveOpacity = 0.95;
    menuOpacity = 0.98;
    opacityRules = [
      "99:name *= 'YouTube'"
      "99:name *= 'Picture-in-Picture'"
      "99:class_g = 'vlc'"
      "95:class_g = 'URxvt' && !_NET_WM_STATE@:32a"
      "0:_NET_WM_STATE@[0]:32a *= '_NET_WM_STATE_HIDDEN'"
      "0:_NET_WM_STATE@[1]:32a *= '_NET_WM_STATE_HIDDEN'"
      "0:_NET_WM_STATE@[2]:32a *= '_NET_WM_STATE_HIDDEN'"
      "0:_NET_WM_STATE@[3]:32a *= '_NET_WM_STATE_HIDDEN'"
      "0:_NET_WM_STATE@[4]:32a *= '_NET_WM_STATE_HIDDEN'"
    ];

    settings = {
      corner-radius = 2;
    };
  };
}
