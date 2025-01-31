{lib, inputs, ...}:

{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig.pipewire = {
      "10-clock-rate" = {
        "context.properties" = {
          "default.clock.rate" = 44100;
          "default.clock.allowed-rates" = [44100 48000 88200 96000];
          "default.clock.min-quantum" = 256;
          "default.clock.max-quantum" = 8192;
          "default.clock.quantum" = 1024;
          "default.clock.quantum-limit" = 8192;
          "default.clock.quantum-floor" = 256;
        };
      };
    };
  };
}
