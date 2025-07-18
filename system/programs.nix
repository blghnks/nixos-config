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
      audacity
      bottles
      brave
      byedpi
      pkgs-stable.carla
      git
      glxinfo
      jamesdsp
      kdePackages.kdenlive
      kdePackages.plasma-thunderbolt
      krita
      librewolf
      lshw
      nixd
      neovim
      obs-studio
      okteta
      onlyoffice-desktopeditors
      pciutils
      picard
      pkgs-stable.prismlauncher
      protonvpn-gui
      qbittorrent
      reaper
      rnote
      ryzenadj
      steamtinkerlaunch
      pkgs-stable.tauon
      thunderbird
      unrar
      vesktop
      vlc
      vulkan-tools
      wget
      zapzap
      vscodium-fhs
      yabridge
      yabridgectl
      geonkick
      lsp-plugins
      nvtopPackages.amd
      htop
      zenith
      mangohud
      cmus
      nicotine-plus
      nero-umu
      gamescope
      bespokesynth
      nixfmt-rfc-style
      vscode
    ];
  };
}
