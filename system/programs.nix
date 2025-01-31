{pkgs, inputs, ...}:
{
  programs = {
    direnv.enable = true;
    partition-manager.enable = true;
    kdeconnect.enable = true;
    htop.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    zsh.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      ardour
      audacity
      beets
      bottles
      brave
      carla
      git
      glxinfo
      jamesdsp
      kdePackages.kdenlive
      krita
      librewolf
      lshw
      nvtopPackages.full
      obs-studio
      okteta
      onlyoffice-desktopeditors
      pciutils
      prismlauncher
      protonvpn-cli_2
      protonvpn-gui
      qbittorrent
      reaper
      rnote
      ryzenadj
      supergee
      tauon
      thunderbird
      vesktop
      vlc
      vscodium-fhs
      vulkan-tools
      wget
      yabridge
      yabridgectl
    ];
  };
}
