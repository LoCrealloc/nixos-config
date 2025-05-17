{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      # theme = "bureau";
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
      cpshot = "cp ~/Pictures/screenshots/$(ls -t ~/Pictures/screenshots | head -n1)";
      nixdev = "nix develop --command zsh";
    };
    sessionVariables = {
      EDITOR = "nvim";
    };
    initContent = ''
              export QT_SCREEN_SCALE_FACTORS=1.25
              export GPG_TTY=$(tty)
              gpgconf --launch gpg-agent
              function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
      				# define function for creating terminal
      				newterm_curr_cd() {
              	nohup alacritty --working-directory $(pwd) </dev/null &>/dev/null &
      				}

      				bindkey -s '^t' 'newterm_curr_cd\n'  # CTRL-T in terminal calls for newterm_curr_cd function
    '';

  };
}
