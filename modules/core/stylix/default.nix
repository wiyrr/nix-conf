{
  inputs,
  pkgs,
  ...
}:
let
  opacity = 0.5;
  fontSize = 15;
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];
  stylix = {
    enable = true;
    autoEnable = true;
    image = ./img.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    opacity = {
      terminal = opacity;
      popups = opacity;
    };

    # cursor = {
    #   package = pkgs.catppuccin-cursors.mochaDark;
    #   name = "catppuccin-mocha-dark-cursors";
    #   size = 32;
    # };

    cursor = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 32;
    };

    # iconTheme = {
    #   enable = true;
    #   package = pkgs.nordzy-icon-theme;
    #   dark = "Nordzy-turquoise-dark";
    # };

    fonts = {
      serif = {
        package = pkgs.aleo-fonts;
        name = "Aleo";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.iosevka;
        name = "IosevkaTerm NF";
      };

      emoji = {
        package = pkgs.noto-fonts-monochrome-emoji;
        name = "Noto Emoji";
      };

      sizes = {
        applications = fontSize;
        desktop = fontSize;
        popups = fontSize;
        terminal = fontSize;
      };
    };
  };
}
