{
  description = "An improperly used flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#     cosmic-ext-extra-sessions = {
#       url = "github:KiaraGrouwstra/cosmic-ext-extra-sessions/niri-screen-share";
#       flake = false;
#     };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager,  ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config = { allowUnfree = true; };
    };
  in {
    pkgs-stable = import inputs.nixpkgs-stable.legacyPackages.x86_64-linux {
      config.allowUnfree = true;
    };
    imports = [./pkgs];
    homeConfigurations = {
      blghn = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = {inherit self inputs;};
        modules = [
          ./home
        ];
      };
    };
    nixosConfigurations = {
      nixos-zephyrus = inputs.nixpkgs.lib.nixosSystem {
#         system = "x86_64-linux";
        specialArgs = {inherit self pkgs-stable inputs;};
	    modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
