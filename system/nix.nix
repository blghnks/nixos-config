{ pkgs, inputs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    nixPath = [ "nixpkgs=${inputs.nixpkgs}"];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
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
