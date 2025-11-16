{ pkgs, ... }:

{
  users.users.blghn = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Bilgehan";
    extraGroups = [ "networkmanager" "wheel" "corectrl" "adbusers"];
    packages = [];
  };

  system.stateVersion = "25.05";
}
