{
	services.openssh = {
		enable = true;
		openFirewall = true;
		listenAddresses = {
			addr = "192.168.5.1";
			port = 22;
		};
		settings = {
			PermitRootLogin = false;
			PasswordAuthentication = false;
			allowUsers = [ "copy" ];
		};
	};
}
