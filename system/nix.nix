{ pkgs, inputs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    nixPath = [ "nixpkgs=${inputs.nixpkgs}"];
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
