{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      # home-manager
    ];
    username = "blghn";
    homeDirectory = "/home/blghn";
    stateVersion = "25.05";
  };
  programs = {
    home-manager.enable = true;
  };
}
