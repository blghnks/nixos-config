{ pkgs, inputs, ... }:

let
  pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
in
{
  programs = {
    corectrl.enable = true;
    direnv.enable = true;
    gamemode.enable = true;
    kdeconnect.enable = true;
    partition-manager.enable = true;
    zsh.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      amdgpu_top
      ardour
      pkgs-stable.audacity
      beets
      bespokesynth
      brave
      byedpi
      pkgs-stable.carla
      cmus
      gamescope
      git
      jamesdsp
      kdePackages.kdenlive
      kdePackages.plasma-thunderbolt
      krita
      librewolf
      lshw
      mangohud
      mysql-workbench
      neovim
      nero-umu
      nicotine-plus
      nixd
      nixfmt-rfc-style
      obs-studio
      okteta
      onlyoffice-desktopeditors
      pciutils
      picard
      pkgs-stable.pcsx2
      pkgs-stable.prismlauncher
      protonvpn-gui
      qbittorrent
      reaper
      pkgs-stable.ryzenadj
      steamtinkerlaunch
      tauon
      unrar
      vesktop
      vlc
      vscode
      vscodium-fhs
      vulkan-tools
      wget
      wineWowPackages.yabridge
      winetricks
      yabridge
      yabridgectl
      zapzap
      zenith
    ];
  };
}
