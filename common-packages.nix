{ pkgs, inputs }: with pkgs; [
  python3Minimal
  zulu8
  zulu17
  zulu
  brave
  librewolf
  vesktop
  thunderbird
  vscodium-fhs
  okteta
  neovim
  git
  wget
  obsidian
  onlyoffice-bin
  ardour
  audacity
  carla
  lv2
  inputs.nixpkgsstable.legacyPackages.${pkgs.system}.tauon
  cmus
  rnote
  krita
  vlc
  prismlauncher
  mission-center
  protonvpn-gui
  bottles
  qbittorrent
  rar
  kate
]
