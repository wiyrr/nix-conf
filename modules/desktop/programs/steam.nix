{
  flake.modules.nixos.steam =
    { pkgs, ... }:
    {
      programs.steam = {
        enable = true;
        extraCompatPackages = with pkgs; [ proton-ge-bin ];
        protontricks.enable = true;
        # remotePlay.openFirewall = true;
        # dedicatedServer.openFirewall = true;
      };
      environment.systemPackages = with pkgs; [
        gamescope
        mangohud
        # steamcmd
        # steam-tui
      ];
    };
}
