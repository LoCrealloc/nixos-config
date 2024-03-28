{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      # theme = "bureau";
      theme = "juanghurtado";
      plugins = ["git" "ssh-agent" "sudo" "dotenv"];
      extraConfig = ''
        zstyle :omz:plugins:ssh-agent identities id_ed25519
      '';
    };
    shellAliases = {
      pkgsearch = "nix search nixpkgs";
      connect_fuchs = "ssh admin@87.237.55.175";
      cpshot = "cp ~/Pictures/screenshots/$(ls -t ~/Pictures/screenshots | head -n1)";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
    initExtra = ''
      export QT_SCREEN_SCALE_FACTORS=1.25
      export GPG_TTY=$(tty)
      gpgconf --launch gpg-agent
      function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
    '';
  };
}
