{
  description = "An improperly used flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgsstable.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
  let
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    pkgsstable = inputs.nixpkgsstable.legacyPackages.${system};
    machine = "nixos-fx13";
  in
  {
    nixosConfigurations = {
      ${machine} = inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
	modules = [
	  {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
          }
          inputs.nixos-cosmic.nixosModules.default
          ./hosts/${machine}/configuration.nix
        ];
      };
    };
  };
}
