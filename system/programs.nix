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
  };

  environment = {
    systemPackages = with pkgs; [
      ardour
      audacity
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
      neovim
      nvtopPackages.full
      obs-studio
      okteta
      onlyoffice-desktopeditors
      pciutils
      prismlauncher
      protonvpn-cli_2
      protonvpn-gui
      qbittorrent
      rnote
      ryzenadj
      tauon
      thunderbird
      vesktop
      vlc
      vscodium-fhs
      vulkan-tools
      wget
    ];
  };
}
