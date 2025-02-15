{pkgs, ...}:
let
  myAliases = {
    java8 = "${pkgs.jdk8}/lib/openjdk/bin/java";
    java17 = "${pkgs.jdk17}/lib/openjdk/bin/java";
  };
in {
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
