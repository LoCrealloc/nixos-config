{ pkgs, colors }: {
  type = "custom/script";
  interval = "5";

  exec = pkgs.writeShellScript "polybar-wireguard" ''
		vpn="$(nmcli -t -f name,type connection show --order name --active 2>/dev/null | grep wireguard | head -1 | cut -d ':' -f 1)"

		if [ -n "$vpn" ]; then
			echo "$vpn"
		else
			echo "DOWN "
		fi
	'';

  format = {
    prefix = {
      text = "%{T2}  󰒒  %{T-}";
      foreground = "${colors.background}";
      background = "${colors.orange}";
    };
    underline = "${colors.orange}";
  };

  label = {
    margin = 2;
  };
}
