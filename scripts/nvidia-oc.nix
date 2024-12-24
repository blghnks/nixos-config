{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = [pkgs.python3 pkgs.python3Packages.nvidia-ml-py];

  shellHook = ''
    python3 /etc/nixos/scripts/nvidia-oc.py
    exit
  '';
}
