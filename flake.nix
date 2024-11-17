{
  description = "An improperly used flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgsstable.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = inputs:
  let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    pkgsstable = inputs.nixpkgsstable.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      nixos = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
	modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
