{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "juanghurtado";
      plugins = [
        "git"
        "ssh-agent"
        "sudo"
        "dotenv"
      ];
      extraConfig = ''
        zstyle :omz:plugins:ssh-agent identities id_ed25519
      '';
    };
    shellAliases = {
      nixdev = "nix develop --command zsh";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
    initContent = ''
      export QT_SCREEN_SCALE_FACTORS=1.25
      function gignore() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
    '';
  };
}
