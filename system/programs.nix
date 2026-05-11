{ pkgs, pkgs-stable, inputs, ... }:
{
  programs = {
    corectrl.enable = true;
    direnv = {
      enable = true;
      package = pkgs.direnv;
      silent = true;
      loadInNixShell = true;
      direnvrcExtra = "";
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };
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
      helix
      mangohud
      xdg-desktop-portal-gnome
      xwayland-satellite
      alacritty
      wl-clipboard-rs
      brightnessctl
      amdgpu_top
      ardour
      audacity
      beets
      bespokesynth
      brave
      byedpi
      carla
      cmus
      firefox
      gamescope
      git
      jamesdsp
      krita
      lshw
      neovim
      nero-umu
      nil
      nixd
      nixfmt
      obs-studio
      okteta
      onlyoffice-desktopeditors
      pciutils
      picard
      pcsx2
      pkgs-stable.prismlauncher
      proton-vpn
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
      winetricks
      zenith
      (callPackage ../custom-pkgs/cosmic-ext-alt {})
      (callPackage ../custom-pkgs/visual-paradigm-ce {})
    ];
  };

  virtualisation.podman.enable = true;
}
