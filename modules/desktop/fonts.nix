{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      fonts = {
        fontconfig.defaultFonts = {
          serif = [ "Noto Serif" ];
          sansSerif = [ "Inter" ];
          monospace = [ "IosevkaTerm NF" ];
          emoji = [ "Noto Emoji" ];
        };

        packages = with pkgs; [
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-monochrome-emoji
          nerd-fonts.iosevka-term
          iosevka
          maple-mono.NF
          nerd-fonts.jetbrains-mono
          inter
        ];
      };
    };
}
