{ inputs, self, ... }:
{
  flake.modules.nixos.desktop =
    { lib, pkgs, ... }:
    let
      selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
    in
    {

      imports = [
        self.modules.nixos.mango
        self.modules.nixos.thunar
      ];

      security.polkit.enable = true;
      security.rtkit.enable = true;
      services.dbus.enable = lib.mkDefault true;
      services.playerctld.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # jack.enable = true;
      };

      fonts = {
        packages = with pkgs; [
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-monochrome-emoji
          nerd-fonts.iosevka-term
          iosevka
          maple-mono.NF
          nerd-fonts.jetbrains-mono
        ];

        fontconfig.defaultFonts = {
          serif = [ "Noto Sans CJK" ];
          sansSerif = [ "Noto Sans CJK" ];
          monospace = [ "IosevkaTerm NF" ];
        };
      };

      environment.systemPackages = with pkgs; [
        rose-pine-cursor
        librewolf
        noctalia-shell
        feishin
        jellyfin-desktop
        easytag
        thunderbird

        selfpkgs.mpv
        selfpkgs.foot
        selfpkgs.zathura
        selfpkgs.goldendict-ng

      ];

    };
}
