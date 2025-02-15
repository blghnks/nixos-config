{ pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      SDL2
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
}
