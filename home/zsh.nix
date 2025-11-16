{ pkgs, ... }:

let
  myAliases = {
    vesktop = "systemctl restart byedpi.service && DRI_PRIME=1002:1681! vesktop --proxy-server=socks5://127.0.0.1:1080";
    steam = "DRI_PRIME=1002:1681! steam";
  };
in
{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = myAliases;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "history"
          "wd"
        ];
      };
    };
  };
}
