{ pkgs }: {
  i3lock = ''
    ${pkgs.i3lock-color}/bin/i3lock-color \
    --indicator \
    --radius 120 \
    --blur=10 \
    --inside-color=0f111a \
    --ring-color=89ddff \
    --insidever-color=b2ccd6 \
    --insidewrong-color=ff5370 \
    --keyhl-color=bb80b3 \
    --bshl-color=ff5370 \
    --layout-color=ffffff \
    --time-color=ffffff \
    --date-color=ffffff \
    --time-size=35 \
    --date-size=18 \
    --show-failed-attempts \
    --indicator \
    --clock \
    --date-str="%A, %d.%m.%Y" \
    --pass-media-keys \
    --pass-volume-keys
  '';
}
