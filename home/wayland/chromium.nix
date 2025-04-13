{
  programs.chromium = {
    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--enable-features=WebRTCPipeWireCapturer"
      "--enable-features=WaylandWindowDecorations"
      "--ozone-platform-hint=auto"
      "--ozone-platform=wayland"
      "--ignore-gpu-blocklist"
      "--use-gl=desktop"
    ];
  };
}
