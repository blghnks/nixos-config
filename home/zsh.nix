{ pkgs, ... }:

let
  myAliases = {
    vesktop = "systemctl restart byedpi.service && ${pkgs.vesktop}/bin/vesktop --proxy-server=socks5://127.0.0.1:1080";
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
